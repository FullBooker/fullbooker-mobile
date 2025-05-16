import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';

class UpdateSelectedPricingAction extends ReduxAction<AppState> {
  UpdateSelectedPricingAction({
    this.cost,
    this.maxTickets,
    this.currency,
    this.buyerPaysFee,
    this.selectedPricingTier,
  });

  final bool? buyerPaysFee;
  final String? cost;
  final String? currency;
  final int? maxTickets;
  final String? selectedPricingTier;

  @override
  AppState? reduce() {
    final ProductPricing existing =
        state.hostState?.selectedProductPricing ?? ProductPricing();

    final ProductPricing updated = existing.copyWith(
      cost: cost ?? existing.cost,
      maxTickets: maxTickets ?? existing.maxTickets,
      currency: currency ?? existing.currency,
      ticketTier: selectedPricingTier ?? state.hostState?.selectedPricingTier,
      buyerPaysFee: buyerPaysFee ?? existing.buyerPaysFee,
    );

    return state.copyWith.hostState?.call(selectedProductPricing: updated);
  }
}
