import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/actions/update_current_schedule_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
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
    final DateFormat timeFormat = DateFormat.Hm();

    return StoreConnector<AppState, ProductSetupViewModel>(
      converter: (Store<AppState> store) =>
          ProductSetupViewModel.fromState(store.state),
      builder: (BuildContext context, ProductSetupViewModel vm) {
        final List<RepeatWeeklySchedule> weeklySchedule = vm.repeatWeekly;

        return Padding(
          padding: const EdgeInsets.only(bottom: 100),
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
                  final RepeatWeeklySchedule schedule =
                      weeklySchedule.firstWhere(
                    (RepeatWeeklySchedule w) => w.day?.toLowerCase() == dayKey,
                    orElse: () => RepeatWeeklySchedule.initial(),
                  );
                  final bool isSelected = schedule.day == dayOfWeek;
                  final String startTime = schedule.startTime ?? '';
                  final String endTime = schedule.endTime ?? '';

                  String? warning;
                  bool startTimeError = false;
                  bool endTimeError = false;

                  if (isSelected &&
                      startTime.isNotEmpty &&
                      endTime.isNotEmpty) {
                    try {
                      final DateTime start = timeFormat.parseStrict(startTime);
                      final DateTime end = timeFormat.parseStrict(endTime);
                      if (start.isAfter(end)) {
                        startTimeError = true;
                        warning = startTimeWarning;
                      } else if (!start.isBefore(end)) {
                        endTimeError = true;
                        warning = endTimeWarning;
                      }
                    } catch (_) {}
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        spacing: 12,
                        children: <Widget>[
                          // Checkbox
                          GestureDetector(
                            onTap: () {
                              final List<RepeatWeeklySchedule> updated =
                                  List<RepeatWeeklySchedule>.of(weeklySchedule);
                              if (isSelected) {
                                updated.removeWhere(
                                  (RepeatWeeklySchedule el) =>
                                      el.day == dayOfWeek,
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
                                UpdateCurrentScheduleAction(
                                  repeatWeekly: updated,
                                ),
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
                            toBeginningOfSentenceCase(dayOfWeek)!,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),

                          const Spacer(),

                          // Time slots or closed
                          if (isSelected) ...<Widget>[
                            GestureDetector(
                              onTap: () async {
                                final String? picked =
                                    await pickTime(context: context);
                                if (picked != null) {
                                  final List<RepeatWeeklySchedule> updated =
                                      List<RepeatWeeklySchedule>.of(
                                    weeklySchedule,
                                  );
                                  final int idx = updated.indexWhere(
                                    (RepeatWeeklySchedule s) =>
                                        s.day?.toLowerCase() == dayKey,
                                  );
                                  if (idx >= 0) {
                                    updated[idx] = updated[idx]
                                        .copyWith(startTime: picked);
                                  }
                                  context.dispatch(
                                    UpdateCurrentScheduleAction(
                                      repeatWeekly: updated,
                                    ),
                                  );
                                }
                              },
                              child: TimeSlotWidget(
                                value: startTime,
                                isError: startTimeError,
                              ),
                            ),
                            const Text(' - '),
                            GestureDetector(
                              onTap: () async {
                                final String? picked =
                                    await pickTime(context: context);
                                if (picked != null) {
                                  final List<RepeatWeeklySchedule> updated =
                                      List<RepeatWeeklySchedule>.of(
                                    weeklySchedule,
                                  );
                                  final int idx = updated.indexWhere(
                                    (RepeatWeeklySchedule s) =>
                                        s.day?.toLowerCase() == dayKey,
                                  );
                                  if (idx >= 0) {
                                    updated[idx] =
                                        updated[idx].copyWith(endTime: picked);
                                  }
                                  context.dispatch(
                                    UpdateCurrentScheduleAction(
                                      repeatWeekly: updated,
                                    ),
                                  );
                                }
                              },
                              child: TimeSlotWidget(
                                value: endTime,
                                isError: endTimeError,
                              ),
                            ),
                          ] else
                            TimeSlotWidget(value: closedString, isClosed: true),
                        ],
                      ),
                      if (warning != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 36, top: 8),
                          child: Text(
                            warning,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppColors.redColor,
                                      fontStyle: FontStyle.italic,
                                    ),
                          ),
                        ),
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
