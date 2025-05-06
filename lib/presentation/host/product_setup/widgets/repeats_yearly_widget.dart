import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/actions/update_current_schedule_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/entities/product_schedule.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:heroicons/heroicons.dart';

@immutable
class RepeatsYearlyWidget extends StatelessWidget {
  const RepeatsYearlyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductSetupViewModel>(
      converter: (Store<AppState> store) =>
          ProductSetupViewModel.fromState(store.state),
      builder: (BuildContext context, ProductSetupViewModel vm) {
        final List<RepeatYearlySchedule> repeatMonths = vm.repeatYearly;

        final List<MapEntry<int, String>> entries = repeatMonths
            .expand<MapEntry<int, String>>((RepeatYearlySchedule ym) {
          final String m = ym.month ?? '';
          return (ym.repeatOnDateOfMonth ?? <int>[])
              .map((int day) => MapEntry<int, String>(day, m));
        }).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: <Widget>[
            Text(
              yearlyRepeatPrompt,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            // Selected date chips
            if (entries.isNotEmpty)
              Wrap(
                spacing: 8,
                runSpacing: 12,
                children: entries.map((MapEntry<int, String> entry) {
                  final int day = entry.key;
                  final String month = entry.value;
                  final String label = '$day ${abbreviateMonth(month)}';

                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: AppColors.borderColor),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          label,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            final List<RepeatYearlySchedule> updated =
                                removeOneYearlyDate(
                              repeatMonths,
                              month,
                              day,
                            );
                            context.dispatch(
                              UpdateCurrentScheduleAction(
                                repeatYearly: updated,
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.close,
                            size: 16,
                            color: AppColors.textBlackColor,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),

            InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () async {
                final DateTime now = DateTime.now();
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: now,
                  firstDate: DateTime(now.year),
                  lastDate: DateTime(now.year + 5),
                );

                if (picked == null) return;

                final String monthName =
                    getMonthNameFromInt(picked.month).toLowerCase();

                final int day = picked.day;

                final List<RepeatYearlySchedule> updated =
                    List<RepeatYearlySchedule>.from(repeatMonths);

                final int idx = updated.indexWhere(
                  (RepeatYearlySchedule s) =>
                      s.month?.toLowerCase() == monthName,
                );

                if (idx >= 0) {
                  final RepeatYearlySchedule schedule = updated[idx];

                  final List<int> dates =
                      List<int>.from(schedule.repeatOnDateOfMonth ?? <int>[]);

                  if (!dates.contains(day)) {
                    dates.add(day);
                    dates.sort();
                    updated[idx] =
                        schedule.copyWith(repeatOnDateOfMonth: dates);
                  }
                } else {
                  // Create new month schedule if none exists
                  updated.add(
                    RepeatYearlySchedule(
                      month: monthName,
                      repeatOnDateOfMonth: <int>[day],
                    ),
                  );
                }

                context.dispatch(
                  UpdateCurrentScheduleAction(repeatYearly: updated),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Theme.of(context).primaryColor,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      addDateString,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    const HeroIcon(
                      HeroIcons.plus,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
