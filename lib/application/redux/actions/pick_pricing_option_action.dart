import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/pricing_option.dart';

class PickPricingOptionAction extends ReduxAction<AppState> {
  PickPricingOptionAction({required this.option});

  final PricingOption? option;

  @override
  AppState? reduce() {
    return state.copyWith.hostState?.call(
      pickedPricingOption: option ?? state.hostState?.pickedPricingOption,
    );
  }
}
