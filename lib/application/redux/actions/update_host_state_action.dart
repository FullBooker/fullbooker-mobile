import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/currency.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/entities/product_location.dart';
import 'package:fullbooker/domain/core/entities/product_schedule.dart';

class UpdateHostStateAction extends ReduxAction<AppState> {
  UpdateHostStateAction({
    this.selectedProduct,
    this.currentProduct,
    this.selectedLocation,
    this.currencies,
    this.selectedCurrency,
    this.selectedPricingTier,
    this.currentScannedTicketID,
    this.isValidTicket,
    this.selectedSchedule,
  });

  final Product? selectedProduct;
  final Product? currentProduct;
  final ProductLocation? selectedLocation;
  final List<Currency?>? currencies;
  final Currency? selectedCurrency;
  final String? selectedPricingTier;
  final String? currentScannedTicketID;
  final bool? isValidTicket;
  final ProductSchedule? selectedSchedule;

  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.hostState?.call(
      selectedProduct: selectedProduct ?? state.hostState?.selectedProduct,
      currentProduct: currentProduct ?? state.hostState?.currentProduct,
      selectedLocation: selectedLocation ?? state.hostState?.selectedLocation,
      currencies: currencies ?? state.hostState?.currencies,
      selectedCurrency: selectedCurrency ?? state.hostState?.selectedCurrency,
      selectedPricingTier:
          selectedPricingTier ?? state.hostState?.selectedPricingTier,
      currentScannedTicketID:
          currentScannedTicketID ?? state.hostState?.currentScannedTicketID,
      isValidTicket: isValidTicket ?? state.hostState?.isValidTicket,
      selectedSchedule: selectedSchedule ?? state.hostState?.selectedSchedule,
    );

    return newState;
  }
}
