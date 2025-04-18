import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/actions/update_current_schedule_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
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
        final List<String> repeatDates = vm.repeatYearDates;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: <Widget>[
            Text(
              yearlyRepeatPrompt,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            // Selected date chips
            if (repeatDates.isNotEmpty)
              Wrap(
                runSpacing: 12,
                children: repeatDates.map((String date) {
                  final List<String> parts = date.split('-');
                  final int? month =
                      parts.isNotEmpty ? int.tryParse(parts[0]) : null;
                  final int? day =
                      parts.length > 1 ? int.tryParse(parts[1]) : null;

                  if (month == null ||
                      day == null ||
                      month < 1 ||
                      month > 12 ||
                      day < 1 ||
                      day > 31) {
                    return const SizedBox.shrink();
                  }

                  final String shortMonth = _monthName(month).substring(0, 3);
                  final String label = '$day $shortMonth';

                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    margin: EdgeInsets.only(right: 12),
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
                            final List<String> updated =
                                List<String>.from(repeatDates)..remove(date);
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

                if (!repeatDates.contains(value)) {
                  final List<String> updated = List<String>.from(repeatDates)
                    ..add(value);
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

  String _monthName(int month) {
    const List<String> months = <String>[
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }
}
