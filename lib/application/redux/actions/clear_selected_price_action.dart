import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';

class ClearSelectedPriceAction extends ReduxAction<AppState> {
  ClearSelectedPriceAction();

  @override
  AppState? reduce() {
    return state.copyWith.hostState?.selectedProductPricing
        ?.call(cost: UNKNOWN);
  }
}
