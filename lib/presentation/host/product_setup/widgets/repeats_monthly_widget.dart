import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/actions/update_current_schedule_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/spaces.dart';

class RepeatsMonthlyWidget extends StatelessWidget {
  const RepeatsMonthlyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductSetupViewModel>(
      converter: (Store<AppState> store) =>
          ProductSetupViewModel.fromState(store.state),
      builder: (BuildContext context, ProductSetupViewModel vm) {
        final List<int> selectedDates = vm.repeatMonthDates;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: <Widget>[
            Text(
              monthlyRepeatPrompt,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List<Widget>.generate(31, (int index) {
                final int day = index + 1;
                final bool isSelected = selectedDates.contains(day);

                return GestureDetector(
                  onTap: () {
                    final List<int> updated = List<int>.from(selectedDates);
                    if (isSelected) {
                      updated.remove(day);
                    } else {
                      updated.add(day);
                    }
                    context.dispatch(
                      UpdateCurrentScheduleAction(repeatMonthDates: updated),
                    );
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent,
                      border: Border.all(
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).dividerColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '$day',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: isSelected
                                ? Colors.white
                                : Theme.of(context).textTheme.bodyMedium?.color,
                          ),
                    ),
                  ),
                );
              }),
            ),
            verySmallVerticalSizedBox,
          ],
        );
      },
    );
  }
}
