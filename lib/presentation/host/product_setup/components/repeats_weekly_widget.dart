import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/actions/update_current_schedule_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';

class RepeatsWeeklyWidget extends StatelessWidget {
  const RepeatsWeeklyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductSetupViewModel>(
      converter: (Store<AppState> store) =>
          ProductSetupViewModel.fromState(store.state),
      builder: (BuildContext context, ProductSetupViewModel vm) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: <Widget>[
            Text(
              weeklyRepeatPrompt,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: weekdays.map((String day) {
                final bool isSelected = vm.repeatWeekdays.contains(day);
                return GestureDetector(
                  onTap: () {
                    final List<String> updatedDays = <String>[
                      ...vm.repeatWeekdays,
                    ];
                    isSelected ? updatedDays.remove(day) : updatedDays.add(day);
                    context.dispatch(
                      UpdateCurrentScheduleAction(
                        repeatWeekdays: updatedDays,
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).dividerColor,
                      ),
                    ),
                    child: Text(
                      day,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: isSelected
                                ? Colors.white
                                : Theme.of(context).textTheme.bodyMedium?.color,
                          ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
