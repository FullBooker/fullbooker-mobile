import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/currency.dart';
import 'package:fullbooker/domain/core/entities/pricing_breakdown.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';

class PricingInputViewModel extends Vm {
  PricingInputViewModel({
    required this.selectedCurrency,
    required this.currencies,
    required this.currentPricingBreakdown,
    required this.selectedPricing,
    required this.buyerPaysFee,
  }) : super(
          equals: <Object?>[
            selectedCurrency,
            currencies,
            currentPricingBreakdown,
            selectedPricing,
            buyerPaysFee,
          ],
        );

  final Currency? selectedCurrency;
  final List<Currency?>? currencies;
  final PricingBreakdown? currentPricingBreakdown;
  final ProductPricing? selectedPricing;
  final bool buyerPaysFee;

  static PricingInputViewModel fromState(AppState state) {
    return PricingInputViewModel(
      selectedCurrency: state.hostState?.selectedCurrency,
      currencies: state.hostState?.currencies ?? <Currency?>[],
      currentPricingBreakdown:
          state.hostState?.currentPricingBreakdown ?? PricingBreakdown(),
      selectedPricing:
          state.hostState?.selectedProductPricing ?? ProductPricing(),
      buyerPaysFee:
          state.hostState?.selectedProductPricing?.buyerPaysFee ?? false,
    );
  }
}
