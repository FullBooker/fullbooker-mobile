import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_product_schedule_action.dart';
import 'package:fullbooker/application/redux/actions/set_product_schedule_action.dart';
import 'package:fullbooker/application/redux/actions/update_current_schedule_action.dart';
import 'package:fullbooker/application/redux/actions/update_product_schedule_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/presentation/host/product_setup/widgets/repeats_daily_widget.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/repeats_monthly_widget.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/repeats_weekly_widget.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/repeats_yearly_widget.dart';
import 'package:fullbooker/presentation/host/products/widgets/product_alert_widget.dart';
import 'package:fullbooker/presentation/shared/custom_bottom_nav_container.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/custom_dropdown.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class ProductSchedulePage extends StatelessWidget {
  const ProductSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: setupEvent),
        bottomNavigationBar: CustomBottomNavContainer(
          child: StoreConnector<AppState, ProductSetupViewModel>(
            converter: (Store<AppState> store) =>
                ProductSetupViewModel.fromState(store.state),
            builder: (BuildContext context, ProductSetupViewModel vm) {
              final bool isLoading = context.isWaiting(<Type>[
                SetProductScheduleAction,
                UpdateProductScheduleAction,
              ]);

              final bool isEditing = vm.workflowState == WorkflowState.VIEW;

              return Row(
                spacing: 16,
                children: <Widget>[
                  Flexible(
                    child: SecondaryButton(
                      addBorder: true,
                      disabled: isLoading,
                      onPressed: () {
                        isEditing
                            ? context.router.popUntil(
                                (Route<dynamic> route) =>
                                    route.settings.name ==
                                    ProductReviewAndSubmitRoute.name,
                              )
                            : context.router.maybePop();
                      },
                      child: d.right(
                        isEditing ? backToPreview : previousString,
                      ),
                      fillColor: Colors.white,
                    ),
                  ),
                  Flexible(
                    child: PrimaryButton(
                      isLoading: isLoading,
                      onPressed: () {
                        final String? warning = Utils.validateSchedule(
                          startDate: vm.startDate,
                          startTime: vm.startTime,
                          endDate: vm.endDate,
                          endTime: vm.endTime,
                        );

                        if (warning != null) {
                          showAlertDialog(
                            context: context,
                            assetPath: productZeroStateSVGPath,
                            description: warning,
                          );

                          return;
                        }

                        if (isEditing) {
                          context.dispatch(
                            UpdateProductScheduleAction(
                              onSuccess: () {
                                context.router.popUntil(
                                  (Route<dynamic> route) =>
                                      route.settings.name ==
                                      ProductReviewAndSubmitRoute.name,
                                );
                              },
                              onError: (String error) => showAlertDialog(
                                context: context,
                                assetPath: productZeroStateSVGPath,
                                description: error,
                              ),
                              client: AppWrapperBase.of(context)!.customClient,
                            ),
                          );
                        } else {
                          context.dispatch(
                            SetProductScheduleAction(
                              onSuccess: () {
                                context.router.push(ProductPhotosRoute());
                              },
                              onError: (String error) => showAlertDialog(
                                context: context,
                                assetPath: productZeroStateSVGPath,
                                description: error,
                              ),
                              client: AppWrapperBase.of(context)!.customClient,
                            ),
                          );
                        }
                      },
                      child: d.right(continueString),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: StoreConnector<AppState, ProductSetupViewModel>(
            converter: (Store<AppState> store) =>
                ProductSetupViewModel.fromState(store.state),
            onInit: (Store<AppState> store) {
              context.dispatchAll(<ReduxAction<AppState>>[
                FetchProductScheduleAction(
                  client: AppWrapperBase.of(context)!.customClient,
                ),
              ]);
            },
            builder: (BuildContext context, ProductSetupViewModel vm) {
              if (context.isWaiting(<Type>[FetchProductScheduleAction])) {
                return AppLoading();
              }

              final bool repeats = vm.repeatType != kNoRepeatSchedule;

              final String? warning = Utils.validateSchedule(
                startDate: vm.startDate,
                startTime: vm.startTime,
                endDate: vm.endDate,
                endTime: vm.endTime,
              );

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: <Widget>[
                        Text(
                          dateAndTime,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          dateAndTimeCopy,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),

                    if (warning != null) ...<Widget>[
                      ProductAlertWidget(
                        title: warning,
                        color: AppColors.redColor,
                        iconData: HeroIcons.exclamationCircle,
                      ),
                    ],

                    // All day checkbox
                    InkWell(
                      splashColor:
                          Theme.of(context).primaryColor.withValues(alpha: .1),
                      borderRadius: BorderRadius.circular(8),
                      highlightColor:
                          Theme.of(context).primaryColor.withValues(alpha: .1),
                      onTap: () {
                        context.dispatch(
                          UpdateCurrentScheduleAction(
                            isAllDay: !vm.isAllDay,
                          ),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                            value: vm.isAllDay,
                            onChanged: (bool? value) {
                              context.dispatch(
                                UpdateCurrentScheduleAction(
                                  isAllDay: value,
                                ),
                              );
                            },
                            activeColor: Theme.of(context).colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              allDayLabel,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Starts on
                    Row(
                      spacing: 12,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            spacing: 12,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                fromString,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              InkWell(
                                splashColor: Theme.of(context)
                                    .primaryColor
                                    .withValues(alpha: .1),
                                borderRadius: BorderRadius.circular(8),
                                onTap: () async {
                                  final String? date =
                                      await pickDate(context: context);

                                  context.dispatch(
                                    UpdateCurrentScheduleAction(
                                      startDate: date,
                                      endDate: date,
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Theme.of(context).dividerColor,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: EdgeInsets.all(12),
                                  child: Row(
                                    spacing: 12,
                                    children: <Widget>[
                                      HeroIcon(
                                        HeroIcons.calendar,
                                        size: 20,
                                        color: AppColors.bodyTextColor,
                                      ),
                                      if (vm.startDate != UNKNOWN)
                                        humanizeDate(
                                          loadedDate: vm.startDate,
                                          dateTextStyle: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: AppColors.textBlackColor,
                                              ),
                                        )
                                      else
                                        Text(
                                          selectDateHint,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (!vm.isAllDay)
                          Expanded(
                            child: Column(
                              spacing: 12,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  atString,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                InkWell(
                                  borderRadius: BorderRadius.circular(8),
                                  splashColor: Theme.of(context)
                                      .primaryColor
                                      .withValues(alpha: .1),
                                  onTap: () async {
                                    final String? time =
                                        await pickTime(context: context);

                                    context.dispatch(
                                      UpdateCurrentScheduleAction(
                                        startTime: time,
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Theme.of(context).dividerColor,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: EdgeInsets.all(12),
                                    child: Row(
                                      spacing: 12,
                                      children: <Widget>[
                                        HeroIcon(
                                          HeroIcons.clock,
                                          size: 20,
                                          color: AppColors.bodyTextColor,
                                        ),
                                        if (vm.startTime != UNKNOWN)
                                          formatTime(
                                            time: vm.startTime,
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  color:
                                                      AppColors.textBlackColor,
                                                ),
                                          )
                                        else
                                          Text(
                                            chooseTime,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),

                    // Ends on
                    Row(
                      spacing: 12,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            spacing: 12,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                toString,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              InkWell(
                                onTap: () async {
                                  final String? date =
                                      await pickDate(context: context);

                                  context.dispatch(
                                    UpdateCurrentScheduleAction(
                                      endDate: date,
                                    ),
                                  );
                                },
                                splashColor: Theme.of(context)
                                    .primaryColor
                                    .withValues(alpha: .1),
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Theme.of(context).dividerColor,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: EdgeInsets.all(12),
                                  child: Row(
                                    spacing: 12,
                                    children: <Widget>[
                                      HeroIcon(
                                        HeroIcons.calendar,
                                        size: 20,
                                        color: AppColors.bodyTextColor,
                                      ),
                                      if (vm.endDate != UNKNOWN)
                                        humanizeDate(
                                          loadedDate: vm.endDate,
                                          dateTextStyle: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: AppColors.textBlackColor,
                                              ),
                                        )
                                      else
                                        Text(
                                          selectDateHint,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (!vm.isAllDay)
                          Expanded(
                            child: Column(
                              spacing: 12,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  atString,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                InkWell(
                                  onTap: () async {
                                    final String? time =
                                        await pickTime(context: context);

                                    context.dispatch(
                                      UpdateCurrentScheduleAction(
                                        endTime: time,
                                      ),
                                    );
                                  },
                                  splashColor: Theme.of(context)
                                      .primaryColor
                                      .withValues(alpha: .1),
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Theme.of(context).dividerColor,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: EdgeInsets.all(12),
                                    child: Row(
                                      spacing: 12,
                                      children: <Widget>[
                                        HeroIcon(
                                          HeroIcons.clock,
                                          size: 20,
                                          color: AppColors.bodyTextColor,
                                        ),
                                        if (vm.endTime != UNKNOWN)
                                          formatTime(
                                            time: vm.endTime,
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  color:
                                                      AppColors.textBlackColor,
                                                ),
                                          )
                                        else
                                          Text(
                                            chooseTime,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),

                    // Repeats checkbox
                    InkWell(
                      splashColor:
                          Theme.of(context).primaryColor.withValues(alpha: .1),
                      borderRadius: BorderRadius.circular(8),
                      highlightColor:
                          Theme.of(context).primaryColor.withValues(alpha: .1),
                      onTap: () {
                        context.dispatch(
                          UpdateCurrentScheduleAction(
                            repeatType: repeats
                                ? kNoRepeatSchedule
                                : kDailyRepeatOption,
                          ),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                            value: repeats,
                            onChanged: (bool? value) {
                              context.dispatch(
                                UpdateCurrentScheduleAction(
                                  repeats: value,
                                  repeatType: repeats
                                      ? kNoRepeatSchedule
                                      : kDailyRepeatOption,
                                ),
                              );
                            },
                            activeColor: Theme.of(context).colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              repeatsLabel,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                    ),

                    if (repeats)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 12,
                        children: <Widget>[
                          CustomDropdown(
                            value: vm.repeatType.toLowerCase(),
                            onChanged: (String? selected) {
                              context.dispatch(
                                UpdateCurrentScheduleAction(
                                  repeatType: selected,
                                ),
                              );
                            },
                            options: scheduleRepeatOptions,
                          ),

                          /// Repeats daily
                          if (vm.repeatType == kDailyRepeatOption)
                            RepeatsDailyWidget(),

                          /// Repeats weekly
                          if (vm.repeatType == kWeeklyRepeatOption)
                            RepeatsWeeklyWidget(),

                          /// Repeats monthly
                          if (vm.repeatType == kMonthlyRepeatOption)
                            RepeatsMonthlyWidget(),

                          /// Repeats yearly
                          if (vm.repeatType == kYearlyRepeatOption)
                            RepeatsYearlyWidget(),
                        ],
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
