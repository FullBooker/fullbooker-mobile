import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/actions/update_current_schedule_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/entities/product_schedule.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/time_slot_widget.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intl/intl.dart';

class RepeatsWeeklyWidget extends StatelessWidget {
  const RepeatsWeeklyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductSetupViewModel>(
      converter: (Store<AppState> store) =>
          ProductSetupViewModel.fromState(store.state),
      builder: (BuildContext context, ProductSetupViewModel vm) {
        final List<RepeatWeeklySchedule> weeklySchedule = vm.repeatWeekly;

        return Padding(
          padding: EdgeInsets.only(bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: <Widget>[
              Text(
                weeklyRepeatPrompt,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: kDaysOfTheWeek.map((String dayOfWeek) {
                  final String dayKey = dayOfWeek.toLowerCase();

                  final RepeatWeeklySchedule dayOfWeekSchedule =
                      weeklySchedule.firstWhere(
                    (RepeatWeeklySchedule week) =>
                        week.day?.toLowerCase() == dayKey,
                    orElse: () => RepeatWeeklySchedule.initial(),
                  );

                  final bool isSelected = dayOfWeekSchedule.day == dayOfWeek;

                  final String startTime = dayOfWeekSchedule.startTime ?? '';
                  final String endTime = dayOfWeekSchedule.endTime ?? '';

                  return Row(
                    spacing: 12,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          final List<RepeatWeeklySchedule> updated =
                              List<RepeatWeeklySchedule>.from(weeklySchedule);

                          if (isSelected) {
                            updated.removeWhere(
                              (RepeatWeeklySchedule element) =>
                                  element.day == dayOfWeek,
                            );
                          } else {
                            updated.add(
                              RepeatWeeklySchedule(
                                day: dayOfWeek,
                                startTime: kDefaultWeeklyScheduleStartTime,
                                endTime: kDefaultWeeklyScheduleEndTime,
                              ),
                            );
                          }

                          context.dispatch(
                            UpdateCurrentScheduleAction(repeatWeekly: updated),
                          );
                        },
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Theme.of(context).colorScheme.primary
                                : Colors.transparent,
                            border: Border.all(
                              color: isSelected
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).dividerColor,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: isSelected
                              ? HeroIcon(
                                  HeroIcons.check,
                                  size: 16,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ),
                      Text(
                        toBeginningOfSentenceCase(dayOfWeek),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      if (isSelected) ...<Widget>[
                        GestureDetector(
                          onTap: () async {
                            final String? picked =
                                await pickTime(context: context);
                            if (picked != null) {
                              final List<RepeatWeeklySchedule> updated =
                                  List<RepeatWeeklySchedule>.from(
                                weeklySchedule,
                              );

                              final int index = updated.indexWhere(
                                (RepeatWeeklySchedule s) =>
                                    s.day?.toLowerCase() ==
                                    dayOfWeek.toLowerCase(),
                              );

                              if (index >= 0) {
                                updated[index] =
                                    updated[index].copyWith(startTime: picked);
                              } else {
                                updated.add(
                                  RepeatWeeklySchedule(
                                    day: dayOfWeek,
                                    startTime: picked,
                                  ),
                                );
                              }

                              context.dispatch(
                                UpdateCurrentScheduleAction(
                                  repeatWeekly: updated,
                                ),
                              );
                            }
                          },
                          child: TimeSlotWidget(value: startTime),
                        ),
                        const Text(' - '),
                        GestureDetector(
                          onTap: () async {
                            final String? picked =
                                await pickTime(context: context);
                            if (picked != null) {
                              final List<RepeatWeeklySchedule> updated =
                                  List<RepeatWeeklySchedule>.from(
                                weeklySchedule,
                              );

                              final int index = updated.indexWhere(
                                (RepeatWeeklySchedule s) =>
                                    s.day?.toLowerCase() ==
                                    dayOfWeek.toLowerCase(),
                              );

                              if (index >= 0) {
                                updated[index] =
                                    updated[index].copyWith(endTime: picked);
                              } else {
                                updated.add(
                                  RepeatWeeklySchedule(
                                    day: dayOfWeek,
                                    endTime: picked,
                                  ),
                                );
                              }

                              context.dispatch(
                                UpdateCurrentScheduleAction(
                                  repeatWeekly: updated,
                                ),
                              );
                            }
                          },
                          child: TimeSlotWidget(value: endTime),
                        ),
                      ] else ...<Widget>[
                        TimeSlotWidget(value: closedString, isClosed: true),
                      ],
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
