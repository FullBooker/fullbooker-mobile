import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/actions/update_current_schedule_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/utils.dart';
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
        final Map<String, Map<String, String>> repeatOnDays =
            vm.repeatOnDaysOfWeek;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: weekdays.map((String dayLabel) {
            final String dayKey = dayLabel.toLowerCase();
            final bool isSelected = repeatOnDays.containsKey(dayKey);
            final String startTime = repeatOnDays[dayKey]?['start_time'] ?? '';
            final String endTime = repeatOnDays[dayKey]?['end_time'] ?? '';

            return Row(
              spacing: 12,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    final Map<String, Map<String, String>> updated =
                        Map<String, Map<String, String>>.from(repeatOnDays);
                    if (isSelected) {
                      updated.remove(dayKey);
                    } else {
                      updated[dayKey] = <String, String>{
                        'start_time': '09:00',
                        'end_time': '17:00',
                      };
                    }
                    context.dispatch(
                      UpdateCurrentScheduleAction(
                        repeatOnDaysOfWeek: updated,
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
                  toBeginningOfSentenceCase(dayLabel),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                if (isSelected) ...<Widget>[
                  GestureDetector(
                    onTap: () async {
                      final String? picked = await pickTime(context: context);
                      if (picked != null) {
                        final Map<String, Map<String, String>> updated =
                            Map<String, Map<String, String>>.from(repeatOnDays);
                        updated[dayKey]?['start_time'] = picked;
                        context.dispatch(
                          UpdateCurrentScheduleAction(
                            repeatOnDaysOfWeek: updated,
                          ),
                        );
                      }
                    },
                    child: TimeSlotWidget(value: startTime),
                  ),
                  const Text(' - '),
                  GestureDetector(
                    onTap: () async {
                      final String? picked = await pickTime(context: context);
                      if (picked != null) {
                        final Map<String, Map<String, String>> updated =
                            Map<String, Map<String, String>>.from(repeatOnDays);
                        updated[dayKey]?['end_time'] = picked;
                        context.dispatch(
                          UpdateCurrentScheduleAction(
                            repeatOnDaysOfWeek: updated,
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
        );
      },
    );
  }
}
