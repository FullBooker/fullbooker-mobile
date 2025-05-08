// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Ticket _$TicketFromJson(Map<String, dynamic> json) {
  return _Ticket.fromJson(json);
}

/// @nodoc
mixin _$Ticket {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  String? get host => throw _privateConstructorUsedError;
  String? get number => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_number')
  String? get idNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get start => throw _privateConstructorUsedError;
  String? get end => throw _privateConstructorUsedError;
  String? get booking => throw _privateConstructorUsedError;
  String? get pricing => throw _privateConstructorUsedError;
  @JsonKey(name: 'qr_code')
  String? get qrCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'pricing_details')
  ProductPricing? get pricingDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency_code')
  String? get currencyCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_valid')
  bool? get isValid => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String? get productName => throw _privateConstructorUsedError;

  /// Serializes this Ticket to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketCopyWith<Ticket> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketCopyWith<$Res> {
  factory $TicketCopyWith(Ticket value, $Res Function(Ticket) then) =
      _$TicketCopyWithImpl<$Res, Ticket>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      bool? active,
      String? host,
      String? number,
      String? url,
      String? name,
      @JsonKey(name: 'id_number') String? idNumber,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      String? email,
      String? start,
      String? end,
      String? booking,
      String? pricing,
      @JsonKey(name: 'qr_code') String? qrCode,
      @JsonKey(name: 'pricing_details') ProductPricing? pricingDetails,
      @JsonKey(name: 'currency_code') String? currencyCode,
      @JsonKey(name: 'is_valid') bool? isValid,
      @JsonKey(name: 'product_name') String? productName});

  $ProductPricingCopyWith<$Res>? get pricingDetails;
}

/// @nodoc
class _$TicketCopyWithImpl<$Res, $Val extends Ticket>
    implements $TicketCopyWith<$Res> {
  _$TicketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? active = freezed,
    Object? host = freezed,
    Object? number = freezed,
    Object? url = freezed,
    Object? name = freezed,
    Object? idNumber = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? start = freezed,
    Object? end = freezed,
    Object? booking = freezed,
    Object? pricing = freezed,
    Object? qrCode = freezed,
    Object? pricingDetails = freezed,
    Object? currencyCode = freezed,
    Object? isValid = freezed,
    Object? productName = freezed,
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
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      idNumber: freezed == idNumber
          ? _value.idNumber
          : idNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String?,
      booking: freezed == booking
          ? _value.booking
          : booking // ignore: cast_nullable_to_non_nullable
              as String?,
      pricing: freezed == pricing
          ? _value.pricing
          : pricing // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCode: freezed == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String?,
      pricingDetails: freezed == pricingDetails
          ? _value.pricingDetails
          : pricingDetails // ignore: cast_nullable_to_non_nullable
              as ProductPricing?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isValid: freezed == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductPricingCopyWith<$Res>? get pricingDetails {
    if (_value.pricingDetails == null) {
      return null;
    }

    return $ProductPricingCopyWith<$Res>(_value.pricingDetails!, (value) {
      return _then(_value.copyWith(pricingDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TicketImplCopyWith<$Res> implements $TicketCopyWith<$Res> {
  factory _$$TicketImplCopyWith(
          _$TicketImpl value, $Res Function(_$TicketImpl) then) =
      __$$TicketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      bool? active,
      String? host,
      String? number,
      String? url,
      String? name,
      @JsonKey(name: 'id_number') String? idNumber,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      String? email,
      String? start,
      String? end,
      String? booking,
      String? pricing,
      @JsonKey(name: 'qr_code') String? qrCode,
      @JsonKey(name: 'pricing_details') ProductPricing? pricingDetails,
      @JsonKey(name: 'currency_code') String? currencyCode,
      @JsonKey(name: 'is_valid') bool? isValid,
      @JsonKey(name: 'product_name') String? productName});

  @override
  $ProductPricingCopyWith<$Res>? get pricingDetails;
}

/// @nodoc
class __$$TicketImplCopyWithImpl<$Res>
    extends _$TicketCopyWithImpl<$Res, _$TicketImpl>
    implements _$$TicketImplCopyWith<$Res> {
  __$$TicketImplCopyWithImpl(
      _$TicketImpl _value, $Res Function(_$TicketImpl) _then)
      : super(_value, _then);

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? active = freezed,
    Object? host = freezed,
    Object? number = freezed,
    Object? url = freezed,
    Object? name = freezed,
    Object? idNumber = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? start = freezed,
    Object? end = freezed,
    Object? booking = freezed,
    Object? pricing = freezed,
    Object? qrCode = freezed,
    Object? pricingDetails = freezed,
    Object? currencyCode = freezed,
    Object? isValid = freezed,
    Object? productName = freezed,
  }) {
    return _then(_$TicketImpl(
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
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      idNumber: freezed == idNumber
          ? _value.idNumber
          : idNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String?,
      booking: freezed == booking
          ? _value.booking
          : booking // ignore: cast_nullable_to_non_nullable
              as String?,
      pricing: freezed == pricing
          ? _value.pricing
          : pricing // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCode: freezed == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String?,
      pricingDetails: freezed == pricingDetails
          ? _value.pricingDetails
          : pricingDetails // ignore: cast_nullable_to_non_nullable
              as ProductPricing?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isValid: freezed == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$TicketImpl implements _Ticket {
  _$TicketImpl(
      {this.id = UNKNOWN,
      @JsonKey(name: 'created_at') this.createdAt = UNKNOWN,
      @JsonKey(name: 'updated_at') this.updatedAt = UNKNOWN,
      this.active = false,
      this.host = UNKNOWN,
      this.number = UNKNOWN,
      this.url = UNKNOWN,
      this.name = UNKNOWN,
      @JsonKey(name: 'id_number') this.idNumber = UNKNOWN,
      @JsonKey(name: 'phone_number') this.phoneNumber = UNKNOWN,
      this.email = UNKNOWN,
      this.start = UNKNOWN,
      this.end = UNKNOWN,
      this.booking = UNKNOWN,
      this.pricing = UNKNOWN,
      @JsonKey(name: 'qr_code') this.qrCode = UNKNOWN,
      @JsonKey(name: 'pricing_details') this.pricingDetails,
      @JsonKey(name: 'currency_code') this.currencyCode = UNKNOWN,
      @JsonKey(name: 'is_valid') this.isValid = false,
      @JsonKey(name: 'product_name') this.productName = UNKNOWN});

  factory _$TicketImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketImplFromJson(json);

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
  final String? number;
  @override
  @JsonKey()
  final String? url;
  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey(name: 'id_number')
  final String? idNumber;
  @override
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @override
  @JsonKey()
  final String? email;
  @override
  @JsonKey()
  final String? start;
  @override
  @JsonKey()
  final String? end;
  @override
  @JsonKey()
  final String? booking;
  @override
  @JsonKey()
  final String? pricing;
  @override
  @JsonKey(name: 'qr_code')
  final String? qrCode;
  @override
  @JsonKey(name: 'pricing_details')
  final ProductPricing? pricingDetails;
  @override
  @JsonKey(name: 'currency_code')
  final String? currencyCode;
  @override
  @JsonKey(name: 'is_valid')
  final bool? isValid;
  @override
  @JsonKey(name: 'product_name')
  final String? productName;

  @override
  String toString() {
    return 'Ticket(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, active: $active, host: $host, number: $number, url: $url, name: $name, idNumber: $idNumber, phoneNumber: $phoneNumber, email: $email, start: $start, end: $end, booking: $booking, pricing: $pricing, qrCode: $qrCode, pricingDetails: $pricingDetails, currencyCode: $currencyCode, isValid: $isValid, productName: $productName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.idNumber, idNumber) ||
                other.idNumber == idNumber) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.booking, booking) || other.booking == booking) &&
            (identical(other.pricing, pricing) || other.pricing == pricing) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.pricingDetails, pricingDetails) ||
                other.pricingDetails == pricingDetails) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.productName, productName) ||
                other.productName == productName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        createdAt,
        updatedAt,
        active,
        host,
        number,
        url,
        name,
        idNumber,
        phoneNumber,
        email,
        start,
        end,
        booking,
        pricing,
        qrCode,
        pricingDetails,
        currencyCode,
        isValid,
        productName
      ]);

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketImplCopyWith<_$TicketImpl> get copyWith =>
      __$$TicketImplCopyWithImpl<_$TicketImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketImplToJson(
      this,
    );
  }
}

abstract class _Ticket implements Ticket {
  factory _Ticket(
      {final String? id,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt,
      final bool? active,
      final String? host,
      final String? number,
      final String? url,
      final String? name,
      @JsonKey(name: 'id_number') final String? idNumber,
      @JsonKey(name: 'phone_number') final String? phoneNumber,
      final String? email,
      final String? start,
      final String? end,
      final String? booking,
      final String? pricing,
      @JsonKey(name: 'qr_code') final String? qrCode,
      @JsonKey(name: 'pricing_details') final ProductPricing? pricingDetails,
      @JsonKey(name: 'currency_code') final String? currencyCode,
      @JsonKey(name: 'is_valid') final bool? isValid,
      @JsonKey(name: 'product_name') final String? productName}) = _$TicketImpl;

  factory _Ticket.fromJson(Map<String, dynamic> json) = _$TicketImpl.fromJson;

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
  String? get number;
  @override
  String? get url;
  @override
  String? get name;
  @override
  @JsonKey(name: 'id_number')
  String? get idNumber;
  @override
  @JsonKey(name: 'phone_number')
  String? get phoneNumber;
  @override
  String? get email;
  @override
  String? get start;
  @override
  String? get end;
  @override
  String? get booking;
  @override
  String? get pricing;
  @override
  @JsonKey(name: 'qr_code')
  String? get qrCode;
  @override
  @JsonKey(name: 'pricing_details')
  ProductPricing? get pricingDetails;
  @override
  @JsonKey(name: 'currency_code')
  String? get currencyCode;
  @override
  @JsonKey(name: 'is_valid')
  bool? get isValid;
  @override
  @JsonKey(name: 'product_name')
  String? get productName;

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketImplCopyWith<_$TicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
