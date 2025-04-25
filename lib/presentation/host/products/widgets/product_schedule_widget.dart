import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_product_schedules_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_detail_view_model.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/entities/product_schedule.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:heroicons/heroicons.dart';

class ProductScheduleWidget extends StatelessWidget {
  const ProductScheduleWidget({super.key, required this.workflowState});

  final WorkflowState workflowState;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductDetailViewModel>(
      converter: (Store<AppState> store) =>
          ProductDetailViewModel.fromState(store.state),
      onInit: (Store<AppState> store) {
        context.dispatch(
          FetchProductSchedulesAction(
            client: AppWrapperBase.of(context)!.customClient,
            workflowState: workflowState,
          ),
        );
      },
      builder: (BuildContext context, ProductDetailViewModel vm) {
        final Product? product = vm.selectedProduct;
        final ProductSchedule? schedule = product?.schedule;

        final bool isDateValid = schedule?.startDate != null &&
            schedule!.startDate!.isNotEmpty &&
            schedule.startDate != UNKNOWN &&
            schedule.endDate != null &&
            schedule.endDate!.isNotEmpty &&
            schedule.endDate != UNKNOWN;

        final bool isTimeValid = schedule?.startTime != null &&
            schedule!.startTime!.isNotEmpty &&
            schedule.startTime != UNKNOWN &&
            schedule.endTime != null &&
            schedule.endTime!.isNotEmpty &&
            schedule.endTime != UNKNOWN;

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
                const HeroIcon(
                  HeroIcons.calendar,
                  color: AppColors.greyTextColor,
                  size: 20,
                ),
                if (isDateValid) ...<Widget>[
                  humanizeDate(
                    loadedDate: schedule.startDate!,
                    dateTextStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    to,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  humanizeDate(
                    loadedDate: schedule.endDate!,
                    dateTextStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                ] else
                  Text(
                    notProvided,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
              ],
            ),

            // Time
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              children: <Widget>[
                const HeroIcon(
                  HeroIcons.clock,
                  color: AppColors.greyTextColor,
                  size: 20,
                ),
                if (isTimeValid) ...<Widget>[
                  formatTime(
                    time: schedule.startTime!,
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    to,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  formatTime(
                    time: schedule.endTime!,
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                ] else
                  Text(
                    notProvided,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
