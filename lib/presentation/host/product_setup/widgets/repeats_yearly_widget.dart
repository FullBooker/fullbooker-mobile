import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/actions/update_current_schedule_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
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
        final List<RepeatYearlySchedule>? repeatDates = vm.repeatYearDates;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: <Widget>[
            Text(
              yearlyRepeatPrompt,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (repeatDates?.isNotEmpty ?? false)
              Wrap(
                runSpacing: 12,
                children: repeatDates!.map((RepeatYearlySchedule yearItem) {
                  final List<int> days =
                      yearItem.repeatOnDateOfMonth ?? <int>[];
                  final String monthName = yearItem.month ?? '';

                  if (monthName.isEmpty || days.isEmpty) {
                    return const SizedBox.shrink();
                  }

                  // Formatting the month and day labels
                  final String shortMonth = _monthName(monthName);
                  final List<String> labels = days.map((int day) {
                    return '$day $shortMonth';
                  }).toList();

                  return Row(
                    children: labels.map((String label) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        margin: const EdgeInsets.only(right: 12),
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
                                    List<RepeatYearlySchedule>.from(
                                  repeatDates,
                                )..removeWhere(
                                        (RepeatYearlySchedule element) =>
                                            element.month == label,
                                      );

                                context.dispatch(
                                  UpdateCurrentScheduleAction(
                                    repeatYearDates: updated,
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

                final String month = picked.month.toString().padLeft(2, '0');
                final String day = picked.day.toString().padLeft(2, '0');
                final String value = '$month-$day';

                if (!repeatDates?.contains()) {
                  final List<String> updated =
                      List<String>.from(repeatDates ?? <String>[])..add(value);
                  context.dispatch(
                    UpdateCurrentScheduleAction(repeatYearDates: updated),
                  );
                }
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

  // Helper function to map month string to the full name
  String _monthName(String month) {
    const Map<String, String> monthMap = <String, String>{
      'january': 'January',
      'february': 'February',
      'march': 'March',
      'april': 'April',
      'may': 'May',
      'june': 'June',
      'july': 'July',
      'august': 'August',
      'september': 'September',
      'october': 'October',
      'november': 'November',
      'december': 'December',
    };
    return monthMap[month.toLowerCase()] ?? '';
  }
}
