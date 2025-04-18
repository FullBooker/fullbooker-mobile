import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/actions/update_current_schedule_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';

class RepeatsYearlyWidget extends StatelessWidget {
  const RepeatsYearlyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductSetupViewModel>(
      converter: (Store<AppState> store) =>
          ProductSetupViewModel.fromState(store.state),
      builder: (BuildContext context, ProductSetupViewModel vm) {
        return Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              yearlyRepeatPrompt,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now().add(const Duration(days: 365 * 3)),
              onDateChanged: (DateTime date) {
                final String fullDate = date.toIso8601String().substring(0, 10);
                final List<String> updatedDates = <String>[
                  ...vm.repeatYearDates,
                ];
                if (!updatedDates.contains(fullDate)) {
                  updatedDates.add(fullDate);
                }
                context.dispatch(
                  UpdateCurrentScheduleAction(
                    repeatYearDates: updatedDates,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
