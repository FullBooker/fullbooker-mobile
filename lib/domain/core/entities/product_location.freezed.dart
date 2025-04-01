// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductLocation _$ProductLocationFromJson(Map<String, dynamic> json) {
  return _ProductLocation.fromJson(json);
}

/// @nodoc
mixin _$ProductLocation {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  String get host => throw _privateConstructorUsedError;
  String get product => throw _privateConstructorUsedError;
  String get coordinates => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  /// Serializes this ProductLocation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductLocationCopyWith<ProductLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductLocationCopyWith<$Res> {
  factory $ProductLocationCopyWith(
          ProductLocation value, $Res Function(ProductLocation) then) =
      _$ProductLocationCopyWithImpl<$Res, ProductLocation>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      bool active,
      String host,
      String product,
      String coordinates,
      String address});
}

/// @nodoc
class _$ProductLocationCopyWithImpl<$Res, $Val extends ProductLocation>
    implements $ProductLocationCopyWith<$Res> {
  _$ProductLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? active = null,
    Object? host = null,
    Object? product = null,
    Object? coordinates = null,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductLocationImplCopyWith<$Res>
    implements $ProductLocationCopyWith<$Res> {
  factory _$$ProductLocationImplCopyWith(_$ProductLocationImpl value,
          $Res Function(_$ProductLocationImpl) then) =
      __$$ProductLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      bool active,
      String host,
      String product,
      String coordinates,
      String address});
}

/// @nodoc
class __$$ProductLocationImplCopyWithImpl<$Res>
    extends _$ProductLocationCopyWithImpl<$Res, _$ProductLocationImpl>
    implements _$$ProductLocationImplCopyWith<$Res> {
  __$$ProductLocationImplCopyWithImpl(
      _$ProductLocationImpl _value, $Res Function(_$ProductLocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? active = null,
    Object? host = null,
    Object? product = null,
    Object? coordinates = null,
    Object? address = null,
  }) {
    return _then(_$ProductLocationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductLocationImpl implements _ProductLocation {
  _$ProductLocationImpl(
      {required this.id,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      required this.active,
      required this.host,
      required this.product,
      required this.coordinates,
      required this.address});

  factory _$ProductLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductLocationImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  final bool active;
  @override
  final String host;
  @override
  final String product;
  @override
  final String coordinates;
  @override
  final String address;

  @override
  String toString() {
    return 'ProductLocation(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, active: $active, host: $host, product: $product, coordinates: $coordinates, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductLocationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.coordinates, coordinates) ||
                other.coordinates == coordinates) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, updatedAt, active,
      host, product, coordinates, address);

  /// Create a copy of ProductLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductLocationImplCopyWith<_$ProductLocationImpl> get copyWith =>
      __$$ProductLocationImplCopyWithImpl<_$ProductLocationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductLocationImplToJson(
      this,
    );
  }
}

abstract class _ProductLocation implements ProductLocation {
  factory _ProductLocation(
      {required final String id,
      @JsonKey(name: 'created_at') required final String createdAt,
      @JsonKey(name: 'updated_at') required final String updatedAt,
      required final bool active,
      required final String host,
      required final String product,
      required final String coordinates,
      required final String address}) = _$ProductLocationImpl;

  factory _ProductLocation.fromJson(Map<String, dynamic> json) =
      _$ProductLocationImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  bool get active;
  @override
  String get host;
  @override
  String get product;
  @override
  String get coordinates;
  @override
  String get address;

  /// Create a copy of ProductLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductLocationImplCopyWith<_$ProductLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
