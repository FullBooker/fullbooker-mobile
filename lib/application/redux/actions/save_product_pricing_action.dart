import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';

class SaveProductPricingAction extends ReduxAction<AppState> {
  @override
  AppState? reduce() {
    final List<ProductPricing?> pricingList = <ProductPricing?>[
      ...(state.hostState?.currentProduct?.pricing ?? <ProductPricing?>[]),
    ];
    final ProductPricing? newPricing = state.hostState?.selectedProductPricing;

    if (newPricing == null || newPricing.ticketTier == null) return null;

    pricingList.removeWhere(
      (ProductPricing? p) =>
          p?.ticketTier?.toLowerCase() == newPricing.ticketTier?.toLowerCase(),
    );

    pricingList.add(newPricing);

    final Product? updatedProduct = state.hostState?.currentProduct?.copyWith(
      pricing: pricingList,
    );

    return state.copyWith.hostState?.call(
      currentProduct: updatedProduct,
      selectedProductPricing: null,
    );
  }
}
