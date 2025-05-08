// Package imports:

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/booking.dart';
import 'package:fullbooker/domain/core/entities/currency.dart';
import 'package:fullbooker/domain/core/entities/pricing_option.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/entities/product_category.dart';
import 'package:fullbooker/domain/core/entities/product_location.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';
import 'package:fullbooker/domain/core/entities/product_schedule.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/entities/location_perms_result.dart';

part 'host_state.freezed.dart';
part 'host_state.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class HostState with _$HostState {
  @JsonSerializable(explicitToJson: true)
  factory HostState({
    @Default(<Product>[]) List<Product?>? products,
    Product? currentProduct,
    Product? selectedProduct,
    @Default(<ProductCategory>[]) List<ProductCategory>? productCategories,
    LocationPermsResult? locationPerms,

    // Used during product setup
    ProductLocation? selectedLocation,
    ProductSchedule? selectedSchedule,
    @Default(<Currency>[]) List<Currency?>? currencies,
    Currency? selectedCurrency,
    @Default(UNKNOWN) String? selectedPricingTier,
    ProductPricing? selectedProductPricing,

    // Ticket scanning
    @Default(UNKNOWN) String? currentScannedTicketID,
    @Default(false) bool? isValidTicket,

    // Tracks editing and viewing
    @Default(WorkflowState.CREATE) WorkflowState? workflowState,

    // Modes of access
    @Default(<PricingOption>[]) List<PricingOption?>? pricingOptions,
    @Default(<String>[]) List<String?>? selectedPricingOptionIds,

    // Search
    @Default(false) bool? isSearching,
    @Default(UNKNOWN) String? searchParam,

    // Bookings page
    Booking? selectedBooking,
  }) = _HostState;

  factory HostState.initial() => HostState(
        currentProduct: Product.initial(),
        selectedProduct: Product.initial(),
        locationPerms: LocationPermsResult.initial(),
        selectedLocation: ProductLocation.initial(),
        selectedSchedule: ProductSchedule.initial(),
        selectedProductPricing: ProductPricing.initial(),
        selectedCurrency: Currency(),
      );

  factory HostState.fromJson(Map<String, dynamic> json) =>
      _$HostStateFromJson(json);
}
