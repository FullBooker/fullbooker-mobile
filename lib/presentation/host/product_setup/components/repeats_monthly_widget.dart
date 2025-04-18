import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/actions/update_current_schedule_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';

class RepeatsMonthlyWidget extends StatelessWidget {
  const RepeatsMonthlyWidget({super.key});

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
              monthlyRepeatPrompt,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now().add(const Duration(days: 365)),
              onDateChanged: (DateTime date) {
                final List<int> updatedDates = <int>[
                  ...vm.repeatMonthDates,
                ];
                if (!updatedDates.contains(date.day)) {
                  updatedDates.add(date.day);
                }
                context.dispatch(
                  UpdateCurrentScheduleAction(
                    repeatMonthDates: updatedDates,
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
