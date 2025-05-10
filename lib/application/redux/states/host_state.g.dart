// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HostStateImpl _$$HostStateImplFromJson(Map<String, dynamic> json) =>
    _$HostStateImpl(
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : Product.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Product>[],
      currentProduct: json['currentProduct'] == null
          ? null
          : Product.fromJson(json['currentProduct'] as Map<String, dynamic>),
      selectedProduct: json['selectedProduct'] == null
          ? null
          : Product.fromJson(json['selectedProduct'] as Map<String, dynamic>),
      productCategories: (json['productCategories'] as List<dynamic>?)
              ?.map((e) => ProductCategory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductCategory>[],
      locationPerms: json['locationPerms'] == null
          ? null
          : LocationPermsResult.fromJson(
              json['locationPerms'] as Map<String, dynamic>),
      selectedLocation: json['selectedLocation'] == null
          ? null
          : ProductLocation.fromJson(
              json['selectedLocation'] as Map<String, dynamic>),
      selectedSchedule: json['selectedSchedule'] == null
          ? null
          : ProductSchedule.fromJson(
              json['selectedSchedule'] as Map<String, dynamic>),
      currencies: (json['currencies'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : Currency.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Currency>[],
      selectedCurrency: json['selectedCurrency'] == null
          ? null
          : Currency.fromJson(json['selectedCurrency'] as Map<String, dynamic>),
      selectedPricingTier: json['selectedPricingTier'] as String? ?? UNKNOWN,
      selectedProductPricing: json['selectedProductPricing'] == null
          ? null
          : ProductPricing.fromJson(
              json['selectedProductPricing'] as Map<String, dynamic>),
      currentScannedTicketID:
          json['currentScannedTicketID'] as String? ?? UNKNOWN,
      isValidTicket: json['isValidTicket'] as bool? ?? false,
      workflowState:
          $enumDecodeNullable(_$WorkflowStateEnumMap, json['workflowState']) ??
              WorkflowState.CREATE,
      pricingOptions: (json['pricingOptions'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : PricingOption.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PricingOption>[],
      productPricingOptions: (json['productPricingOptions'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : ProductPricingOption.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductPricingOption>[],
      selectedPricingOptionIds:
          (json['selectedPricingOptionIds'] as List<dynamic>?)
                  ?.map((e) => e as String?)
                  .toList() ??
              const <String>[],
      selectedProductPricingOption: json['selectedProductPricingOption'] == null
          ? null
          : ProductPricingOption.fromJson(
              json['selectedProductPricingOption'] as Map<String, dynamic>),
      isSearching: json['isSearching'] as bool? ?? false,
      searchParam: json['searchParam'] as String? ?? UNKNOWN,
      selectedProductStatusFilter: $enumDecodeNullable(
              _$ProductStatusEnumMap, json['selectedProductStatusFilter']) ??
          ProductStatus.all,
      selectedBooking: json['selectedBooking'] == null
          ? null
          : Booking.fromJson(json['selectedBooking'] as Map<String, dynamic>),
      selectedBookingTickets: (json['selectedBookingTickets'] as List<dynamic>?)
              ?.map((e) =>
                  e == null ? null : Ticket.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Ticket>[],
      pickedPricingOption: json['pickedPricingOption'] == null
          ? null
          : PricingOption.fromJson(
              json['pickedPricingOption'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HostStateImplToJson(_$HostStateImpl instance) =>
    <String, dynamic>{
      'products': instance.products?.map((e) => e?.toJson()).toList(),
      'currentProduct': instance.currentProduct?.toJson(),
      'selectedProduct': instance.selectedProduct?.toJson(),
      'productCategories':
          instance.productCategories?.map((e) => e.toJson()).toList(),
      'locationPerms': instance.locationPerms?.toJson(),
      'selectedLocation': instance.selectedLocation?.toJson(),
      'selectedSchedule': instance.selectedSchedule?.toJson(),
      'currencies': instance.currencies?.map((e) => e?.toJson()).toList(),
      'selectedCurrency': instance.selectedCurrency?.toJson(),
      'selectedPricingTier': instance.selectedPricingTier,
      'selectedProductPricing': instance.selectedProductPricing?.toJson(),
      'currentScannedTicketID': instance.currentScannedTicketID,
      'isValidTicket': instance.isValidTicket,
      'workflowState': _$WorkflowStateEnumMap[instance.workflowState],
      'pricingOptions':
          instance.pricingOptions?.map((e) => e?.toJson()).toList(),
      'productPricingOptions':
          instance.productPricingOptions?.map((e) => e?.toJson()).toList(),
      'selectedPricingOptionIds': instance.selectedPricingOptionIds,
      'selectedProductPricingOption':
          instance.selectedProductPricingOption?.toJson(),
      'isSearching': instance.isSearching,
      'searchParam': instance.searchParam,
      'selectedProductStatusFilter':
          _$ProductStatusEnumMap[instance.selectedProductStatusFilter],
      'selectedBooking': instance.selectedBooking?.toJson(),
      'selectedBookingTickets':
          instance.selectedBookingTickets?.map((e) => e?.toJson()).toList(),
      'pickedPricingOption': instance.pickedPricingOption?.toJson(),
    };

const _$WorkflowStateEnumMap = {
  WorkflowState.CREATE: 'CREATE',
  WorkflowState.VIEW: 'VIEW',
};

const _$ProductStatusEnumMap = {
  ProductStatus.all: 'all',
  ProductStatus.draft: 'draft',
  ProductStatus.review: 'review',
  ProductStatus.published: 'published',
  ProductStatus.deactivated: 'deactivated',
  ProductStatus.reviewedNeedsChanges: 'reviewedNeedsChanges',
  ProductStatus.rejected: 'rejected',
  ProductStatus.invalidated: 'invalidated',
};
