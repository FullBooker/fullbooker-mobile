import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/currency.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/entities/product_location.dart';

class UpdateHostStateAction extends ReduxAction<AppState> {
  UpdateHostStateAction({
    this.selectedProduct,
    this.currentProduct,
    this.selectedLocation,
    this.currencies,
    this.selectedCurrencyCode,
    this.selectedPricingTier,
  });

  final Product? selectedProduct;
  final Product? currentProduct;
  final ProductLocation? selectedLocation;
  final List<Currency?>? currencies;
  final String? selectedCurrencyCode;
  final String? selectedPricingTier;

  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.hostState?.call(
      selectedProduct: selectedProduct ?? state.hostState?.selectedProduct,
      currentProduct: currentProduct ?? state.hostState?.currentProduct,
      selectedLocation: selectedLocation ?? state.hostState?.selectedLocation,
      currencies: currencies ?? state.hostState?.currencies,
      selectedCurrencyCode:
          selectedCurrencyCode ?? state.hostState?.selectedCurrencyCode,
      selectedPricingTier:
          selectedPricingTier ?? state.hostState?.selectedPricingTier,
    );

    return newState;
  }
}
