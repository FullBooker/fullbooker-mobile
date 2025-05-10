import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';

class ClearPricingOptionsAction extends ReduxAction<AppState> {
  ClearPricingOptionsAction();

  @override
  AppState? reduce() {
    return state.copyWith.hostState
        ?.call(selectedPricingOptionIds: <String?>[]);
  }
}
