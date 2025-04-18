import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';

class UpdateSelectedPricingAction extends ReduxAction<AppState> {
  final String? cost;
  final int? maxTickets;
  final String? currency;
  final bool? buyerPaysFee;

  UpdateSelectedPricingAction({
    this.cost,
    this.maxTickets,
    this.currency,
    this.buyerPaysFee,
  });

  @override
  AppState? reduce() {
    final ProductPricing existing =
        state.hostState?.selectedProductPricing ?? ProductPricing();

    final ProductPricing updated = existing.copyWith(
      cost: cost ?? existing.cost,
      maxTickets: maxTickets ?? existing.maxTickets,
      currency: currency ?? existing.currency,
      ticketTier: state.hostState?.selectedPricingTier,
      buyerPaysFee:
          buyerPaysFee ?? state.hostState?.selectedProductPricing?.buyerPaysFee,
    );

    return state.copyWith.hostState?.call(selectedProductPricing: updated);
  }
}
