import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_product_schedules_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_detail_view_model.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:heroicons/heroicons.dart';

class ProductScheduleWidget extends StatelessWidget {
  const ProductScheduleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductDetailViewModel>(
      converter: (Store<AppState> store) =>
          ProductDetailViewModel.fromState(store.state),
      onInit: (Store<AppState> store) {
        context.dispatch(
          FetchProductSchedulesAction(
            client: AppWrapperBase.of(context)!.customClient,
          ),
        );
      },
      builder: (BuildContext context, ProductDetailViewModel vm) {
        final Product? product = vm.selectedProduct;

        if (context.isWaiting(FetchProductSchedulesAction)) {
          return AppLoading();
        }
        return Wrap(
          spacing: 12,
          runSpacing: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            // Date
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              children: <Widget>[
                HeroIcon(
                  HeroIcons.calendar,
                  color: AppColors.greyTextColor,
                  size: 20,
                ),
                humanizeDate(
                  loadedDate: product?.schedule?.startDate ?? '',
                  dateTextStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  to,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                humanizeDate(
                  loadedDate: product?.schedule?.endDate ?? '',
                  dateTextStyle: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),

            // Time
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              children: <Widget>[
                HeroIcon(
                  HeroIcons.clock,
                  color: AppColors.greyTextColor,
                  size: 20,
                ),
                formatTime(
                  time: product?.schedule?.startTime,
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  to,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                formatTime(
                  time: product?.schedule?.endTime,
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
