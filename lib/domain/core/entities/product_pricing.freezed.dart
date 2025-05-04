// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_pricing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductPricing _$ProductPricingFromJson(Map<String, dynamic> json) {
  return _ProductPricing.fromJson(json);
}

/// @nodoc
mixin _$ProductPricing {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  String? get host => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get product => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency_code')
  String? get currencyCode => throw _privateConstructorUsedError;
  String? get cost => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'ticket_tier')
  String? get ticketTier => throw _privateConstructorUsedError;
  @JsonKey(name: 'maximum_number_of_tickets')
  int? get maxTickets => throw _privateConstructorUsedError;
  @JsonKey(name: 'remaining_tickets')
  int? get remainingTickets => throw _privateConstructorUsedError;
  @JsonKey(name: 'sold_tickets')
  int? get soldTickets => throw _privateConstructorUsedError;
  bool? get buyerPaysFee => throw _privateConstructorUsedError;

  /// Serializes this ProductPricing to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductPricing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductPricingCopyWith<ProductPricing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductPricingCopyWith<$Res> {
  factory $ProductPricingCopyWith(
          ProductPricing value, $Res Function(ProductPricing) then) =
      _$ProductPricingCopyWithImpl<$Res, ProductPricing>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      bool? active,
      String? host,
      String? name,
      String? product,
      String? currency,
      @JsonKey(name: 'currency_code') String? currencyCode,
      String? cost,
      String? type,
      @JsonKey(name: 'ticket_tier') String? ticketTier,
      @JsonKey(name: 'maximum_number_of_tickets') int? maxTickets,
      @JsonKey(name: 'remaining_tickets') int? remainingTickets,
      @JsonKey(name: 'sold_tickets') int? soldTickets,
      bool? buyerPaysFee});
}

/// @nodoc
class _$ProductPricingCopyWithImpl<$Res, $Val extends ProductPricing>
    implements $ProductPricingCopyWith<$Res> {
  _$ProductPricingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductPricing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? active = freezed,
    Object? host = freezed,
    Object? name = freezed,
    Object? product = freezed,
    Object? currency = freezed,
    Object? currencyCode = freezed,
    Object? cost = freezed,
    Object? type = freezed,
    Object? ticketTier = freezed,
    Object? maxTickets = freezed,
    Object? remainingTickets = freezed,
    Object? soldTickets = freezed,
    Object? buyerPaysFee = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      host: freezed == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketTier: freezed == ticketTier
          ? _value.ticketTier
          : ticketTier // ignore: cast_nullable_to_non_nullable
              as String?,
      maxTickets: freezed == maxTickets
          ? _value.maxTickets
          : maxTickets // ignore: cast_nullable_to_non_nullable
              as int?,
      remainingTickets: freezed == remainingTickets
          ? _value.remainingTickets
          : remainingTickets // ignore: cast_nullable_to_non_nullable
              as int?,
      soldTickets: freezed == soldTickets
          ? _value.soldTickets
          : soldTickets // ignore: cast_nullable_to_non_nullable
              as int?,
      buyerPaysFee: freezed == buyerPaysFee
          ? _value.buyerPaysFee
          : buyerPaysFee // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductPricingImplCopyWith<$Res>
    implements $ProductPricingCopyWith<$Res> {
  factory _$$ProductPricingImplCopyWith(_$ProductPricingImpl value,
          $Res Function(_$ProductPricingImpl) then) =
      __$$ProductPricingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      bool? active,
      String? host,
      String? name,
      String? product,
      String? currency,
      @JsonKey(name: 'currency_code') String? currencyCode,
      String? cost,
      String? type,
      @JsonKey(name: 'ticket_tier') String? ticketTier,
      @JsonKey(name: 'maximum_number_of_tickets') int? maxTickets,
      @JsonKey(name: 'remaining_tickets') int? remainingTickets,
      @JsonKey(name: 'sold_tickets') int? soldTickets,
      bool? buyerPaysFee});
}

/// @nodoc
class __$$ProductPricingImplCopyWithImpl<$Res>
    extends _$ProductPricingCopyWithImpl<$Res, _$ProductPricingImpl>
    implements _$$ProductPricingImplCopyWith<$Res> {
  __$$ProductPricingImplCopyWithImpl(
      _$ProductPricingImpl _value, $Res Function(_$ProductPricingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductPricing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? active = freezed,
    Object? host = freezed,
    Object? name = freezed,
    Object? product = freezed,
    Object? currency = freezed,
    Object? currencyCode = freezed,
    Object? cost = freezed,
    Object? type = freezed,
    Object? ticketTier = freezed,
    Object? maxTickets = freezed,
    Object? remainingTickets = freezed,
    Object? soldTickets = freezed,
    Object? buyerPaysFee = freezed,
  }) {
    return _then(_$ProductPricingImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      host: freezed == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketTier: freezed == ticketTier
          ? _value.ticketTier
          : ticketTier // ignore: cast_nullable_to_non_nullable
              as String?,
      maxTickets: freezed == maxTickets
          ? _value.maxTickets
          : maxTickets // ignore: cast_nullable_to_non_nullable
              as int?,
      remainingTickets: freezed == remainingTickets
          ? _value.remainingTickets
          : remainingTickets // ignore: cast_nullable_to_non_nullable
              as int?,
      soldTickets: freezed == soldTickets
          ? _value.soldTickets
          : soldTickets // ignore: cast_nullable_to_non_nullable
              as int?,
      buyerPaysFee: freezed == buyerPaysFee
          ? _value.buyerPaysFee
          : buyerPaysFee // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ProductPricingImpl implements _ProductPricing {
  _$ProductPricingImpl(
      {this.id = UNKNOWN,
      @JsonKey(name: 'created_at') this.createdAt = UNKNOWN,
      @JsonKey(name: 'updated_at') this.updatedAt = UNKNOWN,
      this.active = false,
      this.host = UNKNOWN,
      this.name = UNKNOWN,
      this.product = UNKNOWN,
      this.currency = UNKNOWN,
      @JsonKey(name: 'currency_code') this.currencyCode = UNKNOWN,
      this.cost = UNKNOWN,
      this.type = 'ticket',
      @JsonKey(name: 'ticket_tier') this.ticketTier = kStandardTier,
      @JsonKey(name: 'maximum_number_of_tickets') this.maxTickets = 0,
      @JsonKey(name: 'remaining_tickets') this.remainingTickets = 0,
      @JsonKey(name: 'sold_tickets') this.soldTickets = 0,
      this.buyerPaysFee = false});

  factory _$ProductPricingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductPricingImplFromJson(json);

  @override
  @JsonKey()
  final String? id;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  @JsonKey()
  final bool? active;
  @override
  @JsonKey()
  final String? host;
  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey()
  final String? product;
  @override
  @JsonKey()
  final String? currency;
  @override
  @JsonKey(name: 'currency_code')
  final String? currencyCode;
  @override
  @JsonKey()
  final String? cost;
  @override
  @JsonKey()
  final String? type;
  @override
  @JsonKey(name: 'ticket_tier')
  final String? ticketTier;
  @override
  @JsonKey(name: 'maximum_number_of_tickets')
  final int? maxTickets;
  @override
  @JsonKey(name: 'remaining_tickets')
  final int? remainingTickets;
  @override
  @JsonKey(name: 'sold_tickets')
  final int? soldTickets;
  @override
  @JsonKey()
  final bool? buyerPaysFee;

  @override
  String toString() {
    return 'ProductPricing(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, active: $active, host: $host, name: $name, product: $product, currency: $currency, currencyCode: $currencyCode, cost: $cost, type: $type, ticketTier: $ticketTier, maxTickets: $maxTickets, remainingTickets: $remainingTickets, soldTickets: $soldTickets, buyerPaysFee: $buyerPaysFee)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductPricingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.ticketTier, ticketTier) ||
                other.ticketTier == ticketTier) &&
            (identical(other.maxTickets, maxTickets) ||
                other.maxTickets == maxTickets) &&
            (identical(other.remainingTickets, remainingTickets) ||
                other.remainingTickets == remainingTickets) &&
            (identical(other.soldTickets, soldTickets) ||
                other.soldTickets == soldTickets) &&
            (identical(other.buyerPaysFee, buyerPaysFee) ||
                other.buyerPaysFee == buyerPaysFee));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updatedAt,
      active,
      host,
      name,
      product,
      currency,
      currencyCode,
      cost,
      type,
      ticketTier,
      maxTickets,
      remainingTickets,
      soldTickets,
      buyerPaysFee);

  /// Create a copy of ProductPricing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductPricingImplCopyWith<_$ProductPricingImpl> get copyWith =>
      __$$ProductPricingImplCopyWithImpl<_$ProductPricingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductPricingImplToJson(
      this,
    );
  }
}

abstract class _ProductPricing implements ProductPricing {
  factory _ProductPricing(
      {final String? id,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt,
      final bool? active,
      final String? host,
      final String? name,
      final String? product,
      final String? currency,
      @JsonKey(name: 'currency_code') final String? currencyCode,
      final String? cost,
      final String? type,
      @JsonKey(name: 'ticket_tier') final String? ticketTier,
      @JsonKey(name: 'maximum_number_of_tickets') final int? maxTickets,
      @JsonKey(name: 'remaining_tickets') final int? remainingTickets,
      @JsonKey(name: 'sold_tickets') final int? soldTickets,
      final bool? buyerPaysFee}) = _$ProductPricingImpl;

  factory _ProductPricing.fromJson(Map<String, dynamic> json) =
      _$ProductPricingImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  bool? get active;
  @override
  String? get host;
  @override
  String? get name;
  @override
  String? get product;
  @override
  String? get currency;
  @override
  @JsonKey(name: 'currency_code')
  String? get currencyCode;
  @override
  String? get cost;
  @override
  String? get type;
  @override
  @JsonKey(name: 'ticket_tier')
  String? get ticketTier;
  @override
  @JsonKey(name: 'maximum_number_of_tickets')
  int? get maxTickets;
  @override
  @JsonKey(name: 'remaining_tickets')
  int? get remainingTickets;
  @override
  @JsonKey(name: 'sold_tickets')
  int? get soldTickets;
  @override
  bool? get buyerPaysFee;

  /// Create a copy of ProductPricing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductPricingImplCopyWith<_$ProductPricingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
