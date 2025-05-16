import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/states/host_state.dart';
import 'package:fullbooker/domain/core/entities/currency.dart';
import 'package:fullbooker/domain/core/entities/pricing_option.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/entities/product_location.dart';
import 'package:fullbooker/domain/core/entities/product_pricing_option.dart';
import 'package:fullbooker/domain/core/entities/product_schedule.dart';
import 'package:fullbooker/domain/core/entities/ticket.dart';
import 'package:fullbooker/domain/core/entities/ticket_type.dart';
import 'package:fullbooker/shared/entities/enums.dart';

class UpdateHostStateAction extends ReduxAction<AppState> {
  UpdateHostStateAction({
    this.contextProduct,
    this.selectedLocation,
    this.currencies,
    this.selectedCurrency,
    this.selectedPricingTier,
    this.currentScannedTicketID,
    this.isValidTicket,
    this.selectedSchedule,
    this.pricingOptions,
    this.selectedBookingTickets,
    this.productPricingOptions,
    this.ticketTypes,
    this.selectedPricingOptionIds,
  });

  final Product? contextProduct;
  final ProductLocation? selectedLocation;
  final List<Currency?>? currencies;
  final Currency? selectedCurrency;
  final String? selectedPricingTier;
  final String? currentScannedTicketID;
  final bool? isValidTicket;
  final ProductSchedule? selectedSchedule;
  final List<PricingOption?>? pricingOptions;
  final List<ProductPricingOption?>? productPricingOptions;
  final List<Ticket?>? selectedBookingTickets;
  final List<TicketType?>? ticketTypes;
  final List<String?>? selectedPricingOptionIds;

  @override
  AppState? reduce() {
    final HostState? host = state.hostState;
    if (host == null) return state;

    final $HostStateCopyWith<AppState>? stateBuilder = state.copyWith.hostState;
    if (stateBuilder == null) return state;

    final bool isCreate = host.workflowState == WorkflowState.CREATE;

    return stateBuilder.call(
      currentProduct: isCreate
          ? (contextProduct ?? host.currentProduct)
          : host.currentProduct,
      selectedProduct: !isCreate
          ? (contextProduct ?? host.selectedProduct)
          : host.selectedProduct,
      selectedLocation: selectedLocation ?? host.selectedLocation,
      currencies: currencies ?? host.currencies,
      selectedCurrency: selectedCurrency ?? host.selectedCurrency,
      selectedPricingTier: selectedPricingTier ?? host.selectedPricingTier,
      currentScannedTicketID:
          currentScannedTicketID ?? host.currentScannedTicketID,
      isValidTicket: isValidTicket ?? host.isValidTicket,
      selectedSchedule: selectedSchedule ?? host.selectedSchedule,
      pricingOptions: pricingOptions ?? host.pricingOptions,
      selectedBookingTickets:
          selectedBookingTickets ?? host.selectedBookingTickets,
      productPricingOptions:
          productPricingOptions ?? host.productPricingOptions,
      ticketTypes: ticketTypes ?? host.ticketTypes,
      selectedPricingOptionIds:
          selectedPricingOptionIds ?? host.selectedPricingOptionIds,
    );
  }
}
