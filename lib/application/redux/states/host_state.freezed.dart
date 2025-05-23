// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'host_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HostState _$HostStateFromJson(Map<String, dynamic> json) {
  return _HostState.fromJson(json);
}

/// @nodoc
mixin _$HostState {
  List<Product?>? get products => throw _privateConstructorUsedError;
  Product? get currentProduct => throw _privateConstructorUsedError;
  Product? get selectedProduct => throw _privateConstructorUsedError;
  List<ProductCategory>? get productCategories =>
      throw _privateConstructorUsedError;
  List<ProductCategory>? get productSubCategories =>
      throw _privateConstructorUsedError;
  LocationPermsResult? get locationPerms =>
      throw _privateConstructorUsedError; // Used during product setup
  ProductLocation? get selectedLocation => throw _privateConstructorUsedError;
  ProductSchedule? get selectedSchedule => throw _privateConstructorUsedError;
  List<Currency?>? get currencies => throw _privateConstructorUsedError;
  Currency? get selectedCurrency => throw _privateConstructorUsedError;
  String? get selectedPricingTier => throw _privateConstructorUsedError;
  ProductPricing? get selectedProductPricing =>
      throw _privateConstructorUsedError; // Ticket scanning
  String? get currentScannedTicketID => throw _privateConstructorUsedError;
  bool? get isValidTicket =>
      throw _privateConstructorUsedError; // Tracks editing and viewing
  WorkflowState? get workflowState =>
      throw _privateConstructorUsedError; // Modes of access
  List<PricingOption?>? get pricingOptions =>
      throw _privateConstructorUsedError;
  List<ProductPricingOption?>? get productPricingOptions =>
      throw _privateConstructorUsedError;
  List<String?>? get selectedPricingOptionIds =>
      throw _privateConstructorUsedError;
  ProductPricingOption? get selectedProductPricingOption =>
      throw _privateConstructorUsedError; // Search products
  bool? get isSearchingProducts => throw _privateConstructorUsedError;
  String? get productSearchParam =>
      throw _privateConstructorUsedError; // Search product booking
  bool? get isSearchingProductBooking => throw _privateConstructorUsedError;
  String? get productBookingSearchParam =>
      throw _privateConstructorUsedError; // Filter chips on product details page
  ProductStatus? get selectedProductStatusFilter =>
      throw _privateConstructorUsedError; // Bookings page
  Booking? get selectedBooking => throw _privateConstructorUsedError;
  List<Ticket?>? get selectedBookingTickets =>
      throw _privateConstructorUsedError; // Add modes of access bottom sheet
  PricingOption? get pickedPricingOption =>
      throw _privateConstructorUsedError; // Pricing page
  List<TicketType?>? get ticketTypes => throw _privateConstructorUsedError;
  TicketType? get selectedTicketType => throw _privateConstructorUsedError;
  PricingBreakdown? get currentPricingBreakdown =>
      throw _privateConstructorUsedError;

  /// Serializes this HostState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HostState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HostStateCopyWith<HostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HostStateCopyWith<$Res> {
  factory $HostStateCopyWith(HostState value, $Res Function(HostState) then) =
      _$HostStateCopyWithImpl<$Res, HostState>;
  @useResult
  $Res call(
      {List<Product?>? products,
      Product? currentProduct,
      Product? selectedProduct,
      List<ProductCategory>? productCategories,
      List<ProductCategory>? productSubCategories,
      LocationPermsResult? locationPerms,
      ProductLocation? selectedLocation,
      ProductSchedule? selectedSchedule,
      List<Currency?>? currencies,
      Currency? selectedCurrency,
      String? selectedPricingTier,
      ProductPricing? selectedProductPricing,
      String? currentScannedTicketID,
      bool? isValidTicket,
      WorkflowState? workflowState,
      List<PricingOption?>? pricingOptions,
      List<ProductPricingOption?>? productPricingOptions,
      List<String?>? selectedPricingOptionIds,
      ProductPricingOption? selectedProductPricingOption,
      bool? isSearchingProducts,
      String? productSearchParam,
      bool? isSearchingProductBooking,
      String? productBookingSearchParam,
      ProductStatus? selectedProductStatusFilter,
      Booking? selectedBooking,
      List<Ticket?>? selectedBookingTickets,
      PricingOption? pickedPricingOption,
      List<TicketType?>? ticketTypes,
      TicketType? selectedTicketType,
      PricingBreakdown? currentPricingBreakdown});

  $ProductCopyWith<$Res>? get currentProduct;
  $ProductCopyWith<$Res>? get selectedProduct;
  $LocationPermsResultCopyWith<$Res>? get locationPerms;
  $ProductLocationCopyWith<$Res>? get selectedLocation;
  $ProductScheduleCopyWith<$Res>? get selectedSchedule;
  $CurrencyCopyWith<$Res>? get selectedCurrency;
  $ProductPricingCopyWith<$Res>? get selectedProductPricing;
  $ProductPricingOptionCopyWith<$Res>? get selectedProductPricingOption;
  $BookingCopyWith<$Res>? get selectedBooking;
  $PricingOptionCopyWith<$Res>? get pickedPricingOption;
  $TicketTypeCopyWith<$Res>? get selectedTicketType;
  $PricingBreakdownCopyWith<$Res>? get currentPricingBreakdown;
}

/// @nodoc
class _$HostStateCopyWithImpl<$Res, $Val extends HostState>
    implements $HostStateCopyWith<$Res> {
  _$HostStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HostState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = freezed,
    Object? currentProduct = freezed,
    Object? selectedProduct = freezed,
    Object? productCategories = freezed,
    Object? productSubCategories = freezed,
    Object? locationPerms = freezed,
    Object? selectedLocation = freezed,
    Object? selectedSchedule = freezed,
    Object? currencies = freezed,
    Object? selectedCurrency = freezed,
    Object? selectedPricingTier = freezed,
    Object? selectedProductPricing = freezed,
    Object? currentScannedTicketID = freezed,
    Object? isValidTicket = freezed,
    Object? workflowState = freezed,
    Object? pricingOptions = freezed,
    Object? productPricingOptions = freezed,
    Object? selectedPricingOptionIds = freezed,
    Object? selectedProductPricingOption = freezed,
    Object? isSearchingProducts = freezed,
    Object? productSearchParam = freezed,
    Object? isSearchingProductBooking = freezed,
    Object? productBookingSearchParam = freezed,
    Object? selectedProductStatusFilter = freezed,
    Object? selectedBooking = freezed,
    Object? selectedBookingTickets = freezed,
    Object? pickedPricingOption = freezed,
    Object? ticketTypes = freezed,
    Object? selectedTicketType = freezed,
    Object? currentPricingBreakdown = freezed,
  }) {
    return _then(_value.copyWith(
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product?>?,
      currentProduct: freezed == currentProduct
          ? _value.currentProduct
          : currentProduct // ignore: cast_nullable_to_non_nullable
              as Product?,
      selectedProduct: freezed == selectedProduct
          ? _value.selectedProduct
          : selectedProduct // ignore: cast_nullable_to_non_nullable
              as Product?,
      productCategories: freezed == productCategories
          ? _value.productCategories
          : productCategories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>?,
      productSubCategories: freezed == productSubCategories
          ? _value.productSubCategories
          : productSubCategories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>?,
      locationPerms: freezed == locationPerms
          ? _value.locationPerms
          : locationPerms // ignore: cast_nullable_to_non_nullable
              as LocationPermsResult?,
      selectedLocation: freezed == selectedLocation
          ? _value.selectedLocation
          : selectedLocation // ignore: cast_nullable_to_non_nullable
              as ProductLocation?,
      selectedSchedule: freezed == selectedSchedule
          ? _value.selectedSchedule
          : selectedSchedule // ignore: cast_nullable_to_non_nullable
              as ProductSchedule?,
      currencies: freezed == currencies
          ? _value.currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<Currency?>?,
      selectedCurrency: freezed == selectedCurrency
          ? _value.selectedCurrency
          : selectedCurrency // ignore: cast_nullable_to_non_nullable
              as Currency?,
      selectedPricingTier: freezed == selectedPricingTier
          ? _value.selectedPricingTier
          : selectedPricingTier // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedProductPricing: freezed == selectedProductPricing
          ? _value.selectedProductPricing
          : selectedProductPricing // ignore: cast_nullable_to_non_nullable
              as ProductPricing?,
      currentScannedTicketID: freezed == currentScannedTicketID
          ? _value.currentScannedTicketID
          : currentScannedTicketID // ignore: cast_nullable_to_non_nullable
              as String?,
      isValidTicket: freezed == isValidTicket
          ? _value.isValidTicket
          : isValidTicket // ignore: cast_nullable_to_non_nullable
              as bool?,
      workflowState: freezed == workflowState
          ? _value.workflowState
          : workflowState // ignore: cast_nullable_to_non_nullable
              as WorkflowState?,
      pricingOptions: freezed == pricingOptions
          ? _value.pricingOptions
          : pricingOptions // ignore: cast_nullable_to_non_nullable
              as List<PricingOption?>?,
      productPricingOptions: freezed == productPricingOptions
          ? _value.productPricingOptions
          : productPricingOptions // ignore: cast_nullable_to_non_nullable
              as List<ProductPricingOption?>?,
      selectedPricingOptionIds: freezed == selectedPricingOptionIds
          ? _value.selectedPricingOptionIds
          : selectedPricingOptionIds // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      selectedProductPricingOption: freezed == selectedProductPricingOption
          ? _value.selectedProductPricingOption
          : selectedProductPricingOption // ignore: cast_nullable_to_non_nullable
              as ProductPricingOption?,
      isSearchingProducts: freezed == isSearchingProducts
          ? _value.isSearchingProducts
          : isSearchingProducts // ignore: cast_nullable_to_non_nullable
              as bool?,
      productSearchParam: freezed == productSearchParam
          ? _value.productSearchParam
          : productSearchParam // ignore: cast_nullable_to_non_nullable
              as String?,
      isSearchingProductBooking: freezed == isSearchingProductBooking
          ? _value.isSearchingProductBooking
          : isSearchingProductBooking // ignore: cast_nullable_to_non_nullable
              as bool?,
      productBookingSearchParam: freezed == productBookingSearchParam
          ? _value.productBookingSearchParam
          : productBookingSearchParam // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedProductStatusFilter: freezed == selectedProductStatusFilter
          ? _value.selectedProductStatusFilter
          : selectedProductStatusFilter // ignore: cast_nullable_to_non_nullable
              as ProductStatus?,
      selectedBooking: freezed == selectedBooking
          ? _value.selectedBooking
          : selectedBooking // ignore: cast_nullable_to_non_nullable
              as Booking?,
      selectedBookingTickets: freezed == selectedBookingTickets
          ? _value.selectedBookingTickets
          : selectedBookingTickets // ignore: cast_nullable_to_non_nullable
              as List<Ticket?>?,
      pickedPricingOption: freezed == pickedPricingOption
          ? _value.pickedPricingOption
          : pickedPricingOption // ignore: cast_nullable_to_non_nullable
              as PricingOption?,
      ticketTypes: freezed == ticketTypes
          ? _value.ticketTypes
          : ticketTypes // ignore: cast_nullable_to_non_nullable
              as List<TicketType?>?,
      selectedTicketType: freezed == selectedTicketType
          ? _value.selectedTicketType
          : selectedTicketType // ignore: cast_nullable_to_non_nullable
              as TicketType?,
      currentPricingBreakdown: freezed == currentPricingBreakdown
          ? _value.currentPricingBreakdown
          : currentPricingBreakdown // ignore: cast_nullable_to_non_nullable
              as PricingBreakdown?,
    ) as $Val);
  }

  /// Create a copy of HostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get currentProduct {
    if (_value.currentProduct == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.currentProduct!, (value) {
      return _then(_value.copyWith(currentProduct: value) as $Val);
    });
  }

  /// Create a copy of HostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get selectedProduct {
    if (_value.selectedProduct == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.selectedProduct!, (value) {
      return _then(_value.copyWith(selectedProduct: value) as $Val);
    });
  }

  /// Create a copy of HostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationPermsResultCopyWith<$Res>? get locationPerms {
    if (_value.locationPerms == null) {
      return null;
    }

    return $LocationPermsResultCopyWith<$Res>(_value.locationPerms!, (value) {
      return _then(_value.copyWith(locationPerms: value) as $Val);
    });
  }

  /// Create a copy of HostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductLocationCopyWith<$Res>? get selectedLocation {
    if (_value.selectedLocation == null) {
      return null;
    }

    return $ProductLocationCopyWith<$Res>(_value.selectedLocation!, (value) {
      return _then(_value.copyWith(selectedLocation: value) as $Val);
    });
  }

  /// Create a copy of HostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductScheduleCopyWith<$Res>? get selectedSchedule {
    if (_value.selectedSchedule == null) {
      return null;
    }

    return $ProductScheduleCopyWith<$Res>(_value.selectedSchedule!, (value) {
      return _then(_value.copyWith(selectedSchedule: value) as $Val);
    });
  }

  /// Create a copy of HostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res>? get selectedCurrency {
    if (_value.selectedCurrency == null) {
      return null;
    }

    return $CurrencyCopyWith<$Res>(_value.selectedCurrency!, (value) {
      return _then(_value.copyWith(selectedCurrency: value) as $Val);
    });
  }

  /// Create a copy of HostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductPricingCopyWith<$Res>? get selectedProductPricing {
    if (_value.selectedProductPricing == null) {
      return null;
    }

    return $ProductPricingCopyWith<$Res>(_value.selectedProductPricing!,
        (value) {
      return _then(_value.copyWith(selectedProductPricing: value) as $Val);
    });
  }

  /// Create a copy of HostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductPricingOptionCopyWith<$Res>? get selectedProductPricingOption {
    if (_value.selectedProductPricingOption == null) {
      return null;
    }

    return $ProductPricingOptionCopyWith<$Res>(
        _value.selectedProductPricingOption!, (value) {
      return _then(
          _value.copyWith(selectedProductPricingOption: value) as $Val);
    });
  }

  /// Create a copy of HostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookingCopyWith<$Res>? get selectedBooking {
    if (_value.selectedBooking == null) {
      return null;
    }

    return $BookingCopyWith<$Res>(_value.selectedBooking!, (value) {
      return _then(_value.copyWith(selectedBooking: value) as $Val);
    });
  }

  /// Create a copy of HostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PricingOptionCopyWith<$Res>? get pickedPricingOption {
    if (_value.pickedPricingOption == null) {
      return null;
    }

    return $PricingOptionCopyWith<$Res>(_value.pickedPricingOption!, (value) {
      return _then(_value.copyWith(pickedPricingOption: value) as $Val);
    });
  }

  /// Create a copy of HostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TicketTypeCopyWith<$Res>? get selectedTicketType {
    if (_value.selectedTicketType == null) {
      return null;
    }

    return $TicketTypeCopyWith<$Res>(_value.selectedTicketType!, (value) {
      return _then(_value.copyWith(selectedTicketType: value) as $Val);
    });
  }

  /// Create a copy of HostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PricingBreakdownCopyWith<$Res>? get currentPricingBreakdown {
    if (_value.currentPricingBreakdown == null) {
      return null;
    }

    return $PricingBreakdownCopyWith<$Res>(_value.currentPricingBreakdown!,
        (value) {
      return _then(_value.copyWith(currentPricingBreakdown: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HostStateImplCopyWith<$Res>
    implements $HostStateCopyWith<$Res> {
  factory _$$HostStateImplCopyWith(
          _$HostStateImpl value, $Res Function(_$HostStateImpl) then) =
      __$$HostStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Product?>? products,
      Product? currentProduct,
      Product? selectedProduct,
      List<ProductCategory>? productCategories,
      List<ProductCategory>? productSubCategories,
      LocationPermsResult? locationPerms,
      ProductLocation? selectedLocation,
      ProductSchedule? selectedSchedule,
      List<Currency?>? currencies,
      Currency? selectedCurrency,
      String? selectedPricingTier,
      ProductPricing? selectedProductPricing,
      String? currentScannedTicketID,
      bool? isValidTicket,
      WorkflowState? workflowState,
      List<PricingOption?>? pricingOptions,
      List<ProductPricingOption?>? productPricingOptions,
      List<String?>? selectedPricingOptionIds,
      ProductPricingOption? selectedProductPricingOption,
      bool? isSearchingProducts,
      String? productSearchParam,
      bool? isSearchingProductBooking,
      String? productBookingSearchParam,
      ProductStatus? selectedProductStatusFilter,
      Booking? selectedBooking,
      List<Ticket?>? selectedBookingTickets,
      PricingOption? pickedPricingOption,
      List<TicketType?>? ticketTypes,
      TicketType? selectedTicketType,
      PricingBreakdown? currentPricingBreakdown});

  @override
  $ProductCopyWith<$Res>? get currentProduct;
  @override
  $ProductCopyWith<$Res>? get selectedProduct;
  @override
  $LocationPermsResultCopyWith<$Res>? get locationPerms;
  @override
  $ProductLocationCopyWith<$Res>? get selectedLocation;
  @override
  $ProductScheduleCopyWith<$Res>? get selectedSchedule;
  @override
  $CurrencyCopyWith<$Res>? get selectedCurrency;
  @override
  $ProductPricingCopyWith<$Res>? get selectedProductPricing;
  @override
  $ProductPricingOptionCopyWith<$Res>? get selectedProductPricingOption;
  @override
  $BookingCopyWith<$Res>? get selectedBooking;
  @override
  $PricingOptionCopyWith<$Res>? get pickedPricingOption;
  @override
  $TicketTypeCopyWith<$Res>? get selectedTicketType;
  @override
  $PricingBreakdownCopyWith<$Res>? get currentPricingBreakdown;
}

/// @nodoc
class __$$HostStateImplCopyWithImpl<$Res>
    extends _$HostStateCopyWithImpl<$Res, _$HostStateImpl>
    implements _$$HostStateImplCopyWith<$Res> {
  __$$HostStateImplCopyWithImpl(
      _$HostStateImpl _value, $Res Function(_$HostStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HostState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = freezed,
    Object? currentProduct = freezed,
    Object? selectedProduct = freezed,
    Object? productCategories = freezed,
    Object? productSubCategories = freezed,
    Object? locationPerms = freezed,
    Object? selectedLocation = freezed,
    Object? selectedSchedule = freezed,
    Object? currencies = freezed,
    Object? selectedCurrency = freezed,
    Object? selectedPricingTier = freezed,
    Object? selectedProductPricing = freezed,
    Object? currentScannedTicketID = freezed,
    Object? isValidTicket = freezed,
    Object? workflowState = freezed,
    Object? pricingOptions = freezed,
    Object? productPricingOptions = freezed,
    Object? selectedPricingOptionIds = freezed,
    Object? selectedProductPricingOption = freezed,
    Object? isSearchingProducts = freezed,
    Object? productSearchParam = freezed,
    Object? isSearchingProductBooking = freezed,
    Object? productBookingSearchParam = freezed,
    Object? selectedProductStatusFilter = freezed,
    Object? selectedBooking = freezed,
    Object? selectedBookingTickets = freezed,
    Object? pickedPricingOption = freezed,
    Object? ticketTypes = freezed,
    Object? selectedTicketType = freezed,
    Object? currentPricingBreakdown = freezed,
  }) {
    return _then(_$HostStateImpl(
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product?>?,
      currentProduct: freezed == currentProduct
          ? _value.currentProduct
          : currentProduct // ignore: cast_nullable_to_non_nullable
              as Product?,
      selectedProduct: freezed == selectedProduct
          ? _value.selectedProduct
          : selectedProduct // ignore: cast_nullable_to_non_nullable
              as Product?,
      productCategories: freezed == productCategories
          ? _value.productCategories
          : productCategories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>?,
      productSubCategories: freezed == productSubCategories
          ? _value.productSubCategories
          : productSubCategories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>?,
      locationPerms: freezed == locationPerms
          ? _value.locationPerms
          : locationPerms // ignore: cast_nullable_to_non_nullable
              as LocationPermsResult?,
      selectedLocation: freezed == selectedLocation
          ? _value.selectedLocation
          : selectedLocation // ignore: cast_nullable_to_non_nullable
              as ProductLocation?,
      selectedSchedule: freezed == selectedSchedule
          ? _value.selectedSchedule
          : selectedSchedule // ignore: cast_nullable_to_non_nullable
              as ProductSchedule?,
      currencies: freezed == currencies
          ? _value.currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<Currency?>?,
      selectedCurrency: freezed == selectedCurrency
          ? _value.selectedCurrency
          : selectedCurrency // ignore: cast_nullable_to_non_nullable
              as Currency?,
      selectedPricingTier: freezed == selectedPricingTier
          ? _value.selectedPricingTier
          : selectedPricingTier // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedProductPricing: freezed == selectedProductPricing
          ? _value.selectedProductPricing
          : selectedProductPricing // ignore: cast_nullable_to_non_nullable
              as ProductPricing?,
      currentScannedTicketID: freezed == currentScannedTicketID
          ? _value.currentScannedTicketID
          : currentScannedTicketID // ignore: cast_nullable_to_non_nullable
              as String?,
      isValidTicket: freezed == isValidTicket
          ? _value.isValidTicket
          : isValidTicket // ignore: cast_nullable_to_non_nullable
              as bool?,
      workflowState: freezed == workflowState
          ? _value.workflowState
          : workflowState // ignore: cast_nullable_to_non_nullable
              as WorkflowState?,
      pricingOptions: freezed == pricingOptions
          ? _value.pricingOptions
          : pricingOptions // ignore: cast_nullable_to_non_nullable
              as List<PricingOption?>?,
      productPricingOptions: freezed == productPricingOptions
          ? _value.productPricingOptions
          : productPricingOptions // ignore: cast_nullable_to_non_nullable
              as List<ProductPricingOption?>?,
      selectedPricingOptionIds: freezed == selectedPricingOptionIds
          ? _value.selectedPricingOptionIds
          : selectedPricingOptionIds // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      selectedProductPricingOption: freezed == selectedProductPricingOption
          ? _value.selectedProductPricingOption
          : selectedProductPricingOption // ignore: cast_nullable_to_non_nullable
              as ProductPricingOption?,
      isSearchingProducts: freezed == isSearchingProducts
          ? _value.isSearchingProducts
          : isSearchingProducts // ignore: cast_nullable_to_non_nullable
              as bool?,
      productSearchParam: freezed == productSearchParam
          ? _value.productSearchParam
          : productSearchParam // ignore: cast_nullable_to_non_nullable
              as String?,
      isSearchingProductBooking: freezed == isSearchingProductBooking
          ? _value.isSearchingProductBooking
          : isSearchingProductBooking // ignore: cast_nullable_to_non_nullable
              as bool?,
      productBookingSearchParam: freezed == productBookingSearchParam
          ? _value.productBookingSearchParam
          : productBookingSearchParam // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedProductStatusFilter: freezed == selectedProductStatusFilter
          ? _value.selectedProductStatusFilter
          : selectedProductStatusFilter // ignore: cast_nullable_to_non_nullable
              as ProductStatus?,
      selectedBooking: freezed == selectedBooking
          ? _value.selectedBooking
          : selectedBooking // ignore: cast_nullable_to_non_nullable
              as Booking?,
      selectedBookingTickets: freezed == selectedBookingTickets
          ? _value.selectedBookingTickets
          : selectedBookingTickets // ignore: cast_nullable_to_non_nullable
              as List<Ticket?>?,
      pickedPricingOption: freezed == pickedPricingOption
          ? _value.pickedPricingOption
          : pickedPricingOption // ignore: cast_nullable_to_non_nullable
              as PricingOption?,
      ticketTypes: freezed == ticketTypes
          ? _value.ticketTypes
          : ticketTypes // ignore: cast_nullable_to_non_nullable
              as List<TicketType?>?,
      selectedTicketType: freezed == selectedTicketType
          ? _value.selectedTicketType
          : selectedTicketType // ignore: cast_nullable_to_non_nullable
              as TicketType?,
      currentPricingBreakdown: freezed == currentPricingBreakdown
          ? _value.currentPricingBreakdown
          : currentPricingBreakdown // ignore: cast_nullable_to_non_nullable
              as PricingBreakdown?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$HostStateImpl implements _HostState {
  _$HostStateImpl(
      {this.products = const <Product>[],
      this.currentProduct,
      this.selectedProduct,
      this.productCategories = const <ProductCategory>[],
      this.productSubCategories = const <ProductCategory>[],
      this.locationPerms,
      this.selectedLocation,
      this.selectedSchedule,
      this.currencies = const <Currency>[],
      this.selectedCurrency,
      this.selectedPricingTier = UNKNOWN,
      this.selectedProductPricing,
      this.currentScannedTicketID = UNKNOWN,
      this.isValidTicket = false,
      this.workflowState = WorkflowState.CREATE,
      this.pricingOptions = const <PricingOption>[],
      this.productPricingOptions = const <ProductPricingOption>[],
      this.selectedPricingOptionIds = const <String>[],
      this.selectedProductPricingOption,
      this.isSearchingProducts = false,
      this.productSearchParam = UNKNOWN,
      this.isSearchingProductBooking = false,
      this.productBookingSearchParam = UNKNOWN,
      this.selectedProductStatusFilter = ProductStatus.all,
      this.selectedBooking,
      this.selectedBookingTickets = const <Ticket>[],
      this.pickedPricingOption,
      this.ticketTypes = const <TicketType>[],
      this.selectedTicketType,
      this.currentPricingBreakdown});

  factory _$HostStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$HostStateImplFromJson(json);

  @override
  @JsonKey()
  final List<Product?>? products;
  @override
  final Product? currentProduct;
  @override
  final Product? selectedProduct;
  @override
  @JsonKey()
  final List<ProductCategory>? productCategories;
  @override
  @JsonKey()
  final List<ProductCategory>? productSubCategories;
  @override
  final LocationPermsResult? locationPerms;
// Used during product setup
  @override
  final ProductLocation? selectedLocation;
  @override
  final ProductSchedule? selectedSchedule;
  @override
  @JsonKey()
  final List<Currency?>? currencies;
  @override
  final Currency? selectedCurrency;
  @override
  @JsonKey()
  final String? selectedPricingTier;
  @override
  final ProductPricing? selectedProductPricing;
// Ticket scanning
  @override
  @JsonKey()
  final String? currentScannedTicketID;
  @override
  @JsonKey()
  final bool? isValidTicket;
// Tracks editing and viewing
  @override
  @JsonKey()
  final WorkflowState? workflowState;
// Modes of access
  @override
  @JsonKey()
  final List<PricingOption?>? pricingOptions;
  @override
  @JsonKey()
  final List<ProductPricingOption?>? productPricingOptions;
  @override
  @JsonKey()
  final List<String?>? selectedPricingOptionIds;
  @override
  final ProductPricingOption? selectedProductPricingOption;
// Search products
  @override
  @JsonKey()
  final bool? isSearchingProducts;
  @override
  @JsonKey()
  final String? productSearchParam;
// Search product booking
  @override
  @JsonKey()
  final bool? isSearchingProductBooking;
  @override
  @JsonKey()
  final String? productBookingSearchParam;
// Filter chips on product details page
  @override
  @JsonKey()
  final ProductStatus? selectedProductStatusFilter;
// Bookings page
  @override
  final Booking? selectedBooking;
  @override
  @JsonKey()
  final List<Ticket?>? selectedBookingTickets;
// Add modes of access bottom sheet
  @override
  final PricingOption? pickedPricingOption;
// Pricing page
  @override
  @JsonKey()
  final List<TicketType?>? ticketTypes;
  @override
  final TicketType? selectedTicketType;
  @override
  final PricingBreakdown? currentPricingBreakdown;

  @override
  String toString() {
    return 'HostState(products: $products, currentProduct: $currentProduct, selectedProduct: $selectedProduct, productCategories: $productCategories, productSubCategories: $productSubCategories, locationPerms: $locationPerms, selectedLocation: $selectedLocation, selectedSchedule: $selectedSchedule, currencies: $currencies, selectedCurrency: $selectedCurrency, selectedPricingTier: $selectedPricingTier, selectedProductPricing: $selectedProductPricing, currentScannedTicketID: $currentScannedTicketID, isValidTicket: $isValidTicket, workflowState: $workflowState, pricingOptions: $pricingOptions, productPricingOptions: $productPricingOptions, selectedPricingOptionIds: $selectedPricingOptionIds, selectedProductPricingOption: $selectedProductPricingOption, isSearchingProducts: $isSearchingProducts, productSearchParam: $productSearchParam, isSearchingProductBooking: $isSearchingProductBooking, productBookingSearchParam: $productBookingSearchParam, selectedProductStatusFilter: $selectedProductStatusFilter, selectedBooking: $selectedBooking, selectedBookingTickets: $selectedBookingTickets, pickedPricingOption: $pickedPricingOption, ticketTypes: $ticketTypes, selectedTicketType: $selectedTicketType, currentPricingBreakdown: $currentPricingBreakdown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HostStateImpl &&
            const DeepCollectionEquality().equals(other.products, products) &&
            (identical(other.currentProduct, currentProduct) ||
                other.currentProduct == currentProduct) &&
            (identical(other.selectedProduct, selectedProduct) ||
                other.selectedProduct == selectedProduct) &&
            const DeepCollectionEquality()
                .equals(other.productCategories, productCategories) &&
            const DeepCollectionEquality()
                .equals(other.productSubCategories, productSubCategories) &&
            (identical(other.locationPerms, locationPerms) ||
                other.locationPerms == locationPerms) &&
            (identical(other.selectedLocation, selectedLocation) ||
                other.selectedLocation == selectedLocation) &&
            (identical(other.selectedSchedule, selectedSchedule) ||
                other.selectedSchedule == selectedSchedule) &&
            const DeepCollectionEquality()
                .equals(other.currencies, currencies) &&
            (identical(other.selectedCurrency, selectedCurrency) ||
                other.selectedCurrency == selectedCurrency) &&
            (identical(other.selectedPricingTier, selectedPricingTier) ||
                other.selectedPricingTier == selectedPricingTier) &&
            (identical(other.selectedProductPricing, selectedProductPricing) ||
                other.selectedProductPricing == selectedProductPricing) &&
            (identical(other.currentScannedTicketID, currentScannedTicketID) ||
                other.currentScannedTicketID == currentScannedTicketID) &&
            (identical(other.isValidTicket, isValidTicket) ||
                other.isValidTicket == isValidTicket) &&
            (identical(other.workflowState, workflowState) ||
                other.workflowState == workflowState) &&
            const DeepCollectionEquality()
                .equals(other.pricingOptions, pricingOptions) &&
            const DeepCollectionEquality()
                .equals(other.productPricingOptions, productPricingOptions) &&
            const DeepCollectionEquality().equals(
                other.selectedPricingOptionIds, selectedPricingOptionIds) &&
            (identical(other.selectedProductPricingOption,
                    selectedProductPricingOption) ||
                other.selectedProductPricingOption ==
                    selectedProductPricingOption) &&
            (identical(other.isSearchingProducts, isSearchingProducts) ||
                other.isSearchingProducts == isSearchingProducts) &&
            (identical(other.productSearchParam, productSearchParam) ||
                other.productSearchParam == productSearchParam) &&
            (identical(other.isSearchingProductBooking, isSearchingProductBooking) ||
                other.isSearchingProductBooking == isSearchingProductBooking) &&
            (identical(other.productBookingSearchParam, productBookingSearchParam) ||
                other.productBookingSearchParam == productBookingSearchParam) &&
            (identical(other.selectedProductStatusFilter, selectedProductStatusFilter) ||
                other.selectedProductStatusFilter ==
                    selectedProductStatusFilter) &&
            (identical(other.selectedBooking, selectedBooking) ||
                other.selectedBooking == selectedBooking) &&
            const DeepCollectionEquality()
                .equals(other.selectedBookingTickets, selectedBookingTickets) &&
            (identical(other.pickedPricingOption, pickedPricingOption) ||
                other.pickedPricingOption == pickedPricingOption) &&
            const DeepCollectionEquality()
                .equals(other.ticketTypes, ticketTypes) &&
            (identical(other.selectedTicketType, selectedTicketType) ||
                other.selectedTicketType == selectedTicketType) &&
            (identical(
                    other.currentPricingBreakdown, currentPricingBreakdown) ||
                other.currentPricingBreakdown == currentPricingBreakdown));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(products),
        currentProduct,
        selectedProduct,
        const DeepCollectionEquality().hash(productCategories),
        const DeepCollectionEquality().hash(productSubCategories),
        locationPerms,
        selectedLocation,
        selectedSchedule,
        const DeepCollectionEquality().hash(currencies),
        selectedCurrency,
        selectedPricingTier,
        selectedProductPricing,
        currentScannedTicketID,
        isValidTicket,
        workflowState,
        const DeepCollectionEquality().hash(pricingOptions),
        const DeepCollectionEquality().hash(productPricingOptions),
        const DeepCollectionEquality().hash(selectedPricingOptionIds),
        selectedProductPricingOption,
        isSearchingProducts,
        productSearchParam,
        isSearchingProductBooking,
        productBookingSearchParam,
        selectedProductStatusFilter,
        selectedBooking,
        const DeepCollectionEquality().hash(selectedBookingTickets),
        pickedPricingOption,
        const DeepCollectionEquality().hash(ticketTypes),
        selectedTicketType,
        currentPricingBreakdown
      ]);

  /// Create a copy of HostState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HostStateImplCopyWith<_$HostStateImpl> get copyWith =>
      __$$HostStateImplCopyWithImpl<_$HostStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HostStateImplToJson(
      this,
    );
  }
}

abstract class _HostState implements HostState {
  factory _HostState(
      {final List<Product?>? products,
      final Product? currentProduct,
      final Product? selectedProduct,
      final List<ProductCategory>? productCategories,
      final List<ProductCategory>? productSubCategories,
      final LocationPermsResult? locationPerms,
      final ProductLocation? selectedLocation,
      final ProductSchedule? selectedSchedule,
      final List<Currency?>? currencies,
      final Currency? selectedCurrency,
      final String? selectedPricingTier,
      final ProductPricing? selectedProductPricing,
      final String? currentScannedTicketID,
      final bool? isValidTicket,
      final WorkflowState? workflowState,
      final List<PricingOption?>? pricingOptions,
      final List<ProductPricingOption?>? productPricingOptions,
      final List<String?>? selectedPricingOptionIds,
      final ProductPricingOption? selectedProductPricingOption,
      final bool? isSearchingProducts,
      final String? productSearchParam,
      final bool? isSearchingProductBooking,
      final String? productBookingSearchParam,
      final ProductStatus? selectedProductStatusFilter,
      final Booking? selectedBooking,
      final List<Ticket?>? selectedBookingTickets,
      final PricingOption? pickedPricingOption,
      final List<TicketType?>? ticketTypes,
      final TicketType? selectedTicketType,
      final PricingBreakdown? currentPricingBreakdown}) = _$HostStateImpl;

  factory _HostState.fromJson(Map<String, dynamic> json) =
      _$HostStateImpl.fromJson;

  @override
  List<Product?>? get products;
  @override
  Product? get currentProduct;
  @override
  Product? get selectedProduct;
  @override
  List<ProductCategory>? get productCategories;
  @override
  List<ProductCategory>? get productSubCategories;
  @override
  LocationPermsResult? get locationPerms; // Used during product setup
  @override
  ProductLocation? get selectedLocation;
  @override
  ProductSchedule? get selectedSchedule;
  @override
  List<Currency?>? get currencies;
  @override
  Currency? get selectedCurrency;
  @override
  String? get selectedPricingTier;
  @override
  ProductPricing? get selectedProductPricing; // Ticket scanning
  @override
  String? get currentScannedTicketID;
  @override
  bool? get isValidTicket; // Tracks editing and viewing
  @override
  WorkflowState? get workflowState; // Modes of access
  @override
  List<PricingOption?>? get pricingOptions;
  @override
  List<ProductPricingOption?>? get productPricingOptions;
  @override
  List<String?>? get selectedPricingOptionIds;
  @override
  ProductPricingOption? get selectedProductPricingOption; // Search products
  @override
  bool? get isSearchingProducts;
  @override
  String? get productSearchParam; // Search product booking
  @override
  bool? get isSearchingProductBooking;
  @override
  String? get productBookingSearchParam; // Filter chips on product details page
  @override
  ProductStatus? get selectedProductStatusFilter; // Bookings page
  @override
  Booking? get selectedBooking;
  @override
  List<Ticket?>? get selectedBookingTickets; // Add modes of access bottom sheet
  @override
  PricingOption? get pickedPricingOption; // Pricing page
  @override
  List<TicketType?>? get ticketTypes;
  @override
  TicketType? get selectedTicketType;
  @override
  PricingBreakdown? get currentPricingBreakdown;

  /// Create a copy of HostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HostStateImplCopyWith<_$HostStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
