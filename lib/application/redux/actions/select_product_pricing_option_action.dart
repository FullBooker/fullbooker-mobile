import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product_pricing_option.dart';

class SelectProductPricingOptionAction extends ReduxAction<AppState> {
  SelectProductPricingOptionAction({required this.productPricingOption});

  final ProductPricingOption? productPricingOption;

  @override
  AppState? reduce() {
    return state.copyWith.hostState?.call(
      selectedProductPricingOption:
          productPricingOption ?? state.hostState?.selectedProductPricingOption,
    );
  }
}
