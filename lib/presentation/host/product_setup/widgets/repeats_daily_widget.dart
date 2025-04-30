import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/host/products/widgets/product_alert_widget.dart';
import 'package:heroicons/heroicons.dart';

class RepeatsDailyWidget extends StatelessWidget {
  const RepeatsDailyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductSetupViewModel>(
      converter: (Store<AppState> store) =>
          ProductSetupViewModel.fromState(store.state),
      builder: (BuildContext context, ProductSetupViewModel vm) {
        return ProductAlertWidget(
          title: dailyRepeatTitle,
          description: repeatDailyCopy,
          iconData: HeroIcons.informationCircle,
          color: AppColors.greenColor,
        );
      },
    );
  }
}
