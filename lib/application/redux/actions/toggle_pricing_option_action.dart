import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';

class TogglePricingOptionAction extends ReduxAction<AppState> {
  TogglePricingOptionAction({this.optionID});

  final String? optionID;

  @override
  AppState? reduce() {
    final List<String?>? ids = state.hostState!.selectedPricingOptionIds;

    if (ids?.contains(optionID) ?? false) {
      ids?.remove(optionID);
    } else {
      ids?.add(optionID);
    }

    final AppState? newState =
        state.copyWith.hostState?.call(selectedPricingOptionIds: ids);

    return newState;
  }
}
