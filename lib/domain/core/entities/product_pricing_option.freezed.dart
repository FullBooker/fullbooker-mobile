// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_pricing_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductPricingOption _$ProductPricingOptionFromJson(Map<String, dynamic> json) {
  return _ProductPricingOption.fromJson(json);
}

/// @nodoc
mixin _$ProductPricingOption {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  String? get host => throw _privateConstructorUsedError;
  String? get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'pricing_option')
  String? get pricingOptionID => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String? get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'pricing_option_name')
  String? get pricingOptionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'pricing_option_type')
  String? get pricingOptionType => throw _privateConstructorUsedError;

  /// Serializes this ProductPricingOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductPricingOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductPricingOptionCopyWith<ProductPricingOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductPricingOptionCopyWith<$Res> {
  factory $ProductPricingOptionCopyWith(ProductPricingOption value,
          $Res Function(ProductPricingOption) then) =
      _$ProductPricingOptionCopyWithImpl<$Res, ProductPricingOption>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      bool? active,
      String? host,
      String? product,
      @JsonKey(name: 'pricing_option') String? pricingOptionID,
      @JsonKey(name: 'product_name') String? productName,
      @JsonKey(name: 'pricing_option_name') String? pricingOptionName,
      @JsonKey(name: 'pricing_option_type') String? pricingOptionType});
}

/// @nodoc
class _$ProductPricingOptionCopyWithImpl<$Res,
        $Val extends ProductPricingOption>
    implements $ProductPricingOptionCopyWith<$Res> {
  _$ProductPricingOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductPricingOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? active = freezed,
    Object? host = freezed,
    Object? product = freezed,
    Object? pricingOptionID = freezed,
    Object? productName = freezed,
    Object? pricingOptionName = freezed,
    Object? pricingOptionType = freezed,
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
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String?,
      pricingOptionID: freezed == pricingOptionID
          ? _value.pricingOptionID
          : pricingOptionID // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      pricingOptionName: freezed == pricingOptionName
          ? _value.pricingOptionName
          : pricingOptionName // ignore: cast_nullable_to_non_nullable
              as String?,
      pricingOptionType: freezed == pricingOptionType
          ? _value.pricingOptionType
          : pricingOptionType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductPricingOptionImplCopyWith<$Res>
    implements $ProductPricingOptionCopyWith<$Res> {
  factory _$$ProductPricingOptionImplCopyWith(_$ProductPricingOptionImpl value,
          $Res Function(_$ProductPricingOptionImpl) then) =
      __$$ProductPricingOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      bool? active,
      String? host,
      String? product,
      @JsonKey(name: 'pricing_option') String? pricingOptionID,
      @JsonKey(name: 'product_name') String? productName,
      @JsonKey(name: 'pricing_option_name') String? pricingOptionName,
      @JsonKey(name: 'pricing_option_type') String? pricingOptionType});
}

/// @nodoc
class __$$ProductPricingOptionImplCopyWithImpl<$Res>
    extends _$ProductPricingOptionCopyWithImpl<$Res, _$ProductPricingOptionImpl>
    implements _$$ProductPricingOptionImplCopyWith<$Res> {
  __$$ProductPricingOptionImplCopyWithImpl(_$ProductPricingOptionImpl _value,
      $Res Function(_$ProductPricingOptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductPricingOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? active = freezed,
    Object? host = freezed,
    Object? product = freezed,
    Object? pricingOptionID = freezed,
    Object? productName = freezed,
    Object? pricingOptionName = freezed,
    Object? pricingOptionType = freezed,
  }) {
    return _then(_$ProductPricingOptionImpl(
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
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String?,
      pricingOptionID: freezed == pricingOptionID
          ? _value.pricingOptionID
          : pricingOptionID // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      pricingOptionName: freezed == pricingOptionName
          ? _value.pricingOptionName
          : pricingOptionName // ignore: cast_nullable_to_non_nullable
              as String?,
      pricingOptionType: freezed == pricingOptionType
          ? _value.pricingOptionType
          : pricingOptionType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ProductPricingOptionImpl implements _ProductPricingOption {
  _$ProductPricingOptionImpl(
      {this.id = UNKNOWN,
      @JsonKey(name: 'created_at') this.createdAt = UNKNOWN,
      @JsonKey(name: 'updated_at') this.updatedAt = UNKNOWN,
      this.active = false,
      this.host = UNKNOWN,
      this.product = UNKNOWN,
      @JsonKey(name: 'pricing_option') this.pricingOptionID = UNKNOWN,
      @JsonKey(name: 'product_name') this.productName = UNKNOWN,
      @JsonKey(name: 'pricing_option_name') this.pricingOptionName = UNKNOWN,
      @JsonKey(name: 'pricing_option_type') this.pricingOptionType = UNKNOWN});

  factory _$ProductPricingOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductPricingOptionImplFromJson(json);

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
  final String? product;
  @override
  @JsonKey(name: 'pricing_option')
  final String? pricingOptionID;
  @override
  @JsonKey(name: 'product_name')
  final String? productName;
  @override
  @JsonKey(name: 'pricing_option_name')
  final String? pricingOptionName;
  @override
  @JsonKey(name: 'pricing_option_type')
  final String? pricingOptionType;

  @override
  String toString() {
    return 'ProductPricingOption(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, active: $active, host: $host, product: $product, pricingOptionID: $pricingOptionID, productName: $productName, pricingOptionName: $pricingOptionName, pricingOptionType: $pricingOptionType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductPricingOptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.pricingOptionID, pricingOptionID) ||
                other.pricingOptionID == pricingOptionID) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.pricingOptionName, pricingOptionName) ||
                other.pricingOptionName == pricingOptionName) &&
            (identical(other.pricingOptionType, pricingOptionType) ||
                other.pricingOptionType == pricingOptionType));
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
      product,
      pricingOptionID,
      productName,
      pricingOptionName,
      pricingOptionType);

  /// Create a copy of ProductPricingOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductPricingOptionImplCopyWith<_$ProductPricingOptionImpl>
      get copyWith =>
          __$$ProductPricingOptionImplCopyWithImpl<_$ProductPricingOptionImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductPricingOptionImplToJson(
      this,
    );
  }
}

abstract class _ProductPricingOption implements ProductPricingOption {
  factory _ProductPricingOption(
      {final String? id,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt,
      final bool? active,
      final String? host,
      final String? product,
      @JsonKey(name: 'pricing_option') final String? pricingOptionID,
      @JsonKey(name: 'product_name') final String? productName,
      @JsonKey(name: 'pricing_option_name') final String? pricingOptionName,
      @JsonKey(name: 'pricing_option_type')
      final String? pricingOptionType}) = _$ProductPricingOptionImpl;

  factory _ProductPricingOption.fromJson(Map<String, dynamic> json) =
      _$ProductPricingOptionImpl.fromJson;

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
  String? get product;
  @override
  @JsonKey(name: 'pricing_option')
  String? get pricingOptionID;
  @override
  @JsonKey(name: 'product_name')
  String? get productName;
  @override
  @JsonKey(name: 'pricing_option_name')
  String? get pricingOptionName;
  @override
  @JsonKey(name: 'pricing_option_type')
  String? get pricingOptionType;

  /// Create a copy of ProductPricingOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductPricingOptionImplCopyWith<_$ProductPricingOptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
