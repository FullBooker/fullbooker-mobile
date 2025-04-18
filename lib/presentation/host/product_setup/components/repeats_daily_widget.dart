import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/actions/update_current_product_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:heroicons/heroicons.dart';

class RepeatsDailyWidget extends StatelessWidget {
  const RepeatsDailyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductSetupViewModel>(
      converter: (Store<AppState> store) =>
          ProductSetupViewModel.fromState(store.state),
      builder: (BuildContext context, ProductSetupViewModel vm) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: <Widget>[
            Text(
              dailyRepeatPrompt,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Row(
              spacing: 8,
              children: <Widget>[
                Expanded(
                  child: Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        fromString,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      InkWell(
                        onTap: () async {
                          final String? time = await pickTime(context: context);

                          context.dispatch(
                            UpdateCurrentProductAction(
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
                                        color: AppColors.textBlackColor,
                                      ),
                                )
                              else
                                Text(
                                  chooseTime,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        toString,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      InkWell(
                        onTap: () async {
                          final String? time = await pickTime(context: context);

                          context.dispatch(
                            UpdateCurrentProductAction(
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
                                        color: AppColors.textBlackColor,
                                      ),
                                )
                              else
                                Text(
                                  chooseTime,
                                  style: Theme.of(context).textTheme.bodyMedium,
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
          ],
        );
      },
    );
  }
}
