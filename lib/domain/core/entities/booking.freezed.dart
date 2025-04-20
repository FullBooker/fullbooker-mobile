// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Booking _$BookingFromJson(Map<String, dynamic> json) {
  return _Booking.fromJson(json);
}

/// @nodoc
mixin _$Booking {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  String? get host => throw _privateConstructorUsedError;
  String? get product => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_cost')
  String? get totalCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_tickets_count')
  int? get totalTicketsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_details')
  UserState? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirmed_on')
  String? get confirmedOn => throw _privateConstructorUsedError;

  /// Serializes this Booking to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingCopyWith<Booking> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingCopyWith<$Res> {
  factory $BookingCopyWith(Booking value, $Res Function(Booking) then) =
      _$BookingCopyWithImpl<$Res, Booking>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      bool? active,
      String? host,
      String? product,
      String? status,
      @JsonKey(name: 'total_cost') String? totalCost,
      @JsonKey(name: 'total_tickets_count') int? totalTicketsCount,
      @JsonKey(name: 'user_details') UserState? user,
      @JsonKey(name: 'confirmed_on') String? confirmedOn});

  $UserStateCopyWith<$Res>? get user;
}

/// @nodoc
class _$BookingCopyWithImpl<$Res, $Val extends Booking>
    implements $BookingCopyWith<$Res> {
  _$BookingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Booking
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
    Object? status = freezed,
    Object? totalCost = freezed,
    Object? totalTicketsCount = freezed,
    Object? user = freezed,
    Object? confirmedOn = freezed,
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
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCost: freezed == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as String?,
      totalTicketsCount: freezed == totalTicketsCount
          ? _value.totalTicketsCount
          : totalTicketsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserState?,
      confirmedOn: freezed == confirmedOn
          ? _value.confirmedOn
          : confirmedOn // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserStateCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserStateCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookingImplCopyWith<$Res> implements $BookingCopyWith<$Res> {
  factory _$$BookingImplCopyWith(
          _$BookingImpl value, $Res Function(_$BookingImpl) then) =
      __$$BookingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      bool? active,
      String? host,
      String? product,
      String? status,
      @JsonKey(name: 'total_cost') String? totalCost,
      @JsonKey(name: 'total_tickets_count') int? totalTicketsCount,
      @JsonKey(name: 'user_details') UserState? user,
      @JsonKey(name: 'confirmed_on') String? confirmedOn});

  @override
  $UserStateCopyWith<$Res>? get user;
}

/// @nodoc
class __$$BookingImplCopyWithImpl<$Res>
    extends _$BookingCopyWithImpl<$Res, _$BookingImpl>
    implements _$$BookingImplCopyWith<$Res> {
  __$$BookingImplCopyWithImpl(
      _$BookingImpl _value, $Res Function(_$BookingImpl) _then)
      : super(_value, _then);

  /// Create a copy of Booking
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
    Object? status = freezed,
    Object? totalCost = freezed,
    Object? totalTicketsCount = freezed,
    Object? user = freezed,
    Object? confirmedOn = freezed,
  }) {
    return _then(_$BookingImpl(
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
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCost: freezed == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as String?,
      totalTicketsCount: freezed == totalTicketsCount
          ? _value.totalTicketsCount
          : totalTicketsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserState?,
      confirmedOn: freezed == confirmedOn
          ? _value.confirmedOn
          : confirmedOn // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$BookingImpl implements _Booking {
  _$BookingImpl(
      {this.id = UNKNOWN,
      @JsonKey(name: 'created_at') this.createdAt = UNKNOWN,
      @JsonKey(name: 'updated_at') this.updatedAt = UNKNOWN,
      this.active = false,
      this.host = UNKNOWN,
      this.product = UNKNOWN,
      this.status = UNKNOWN,
      @JsonKey(name: 'total_cost') this.totalCost = UNKNOWN,
      @JsonKey(name: 'total_tickets_count') this.totalTicketsCount = 0,
      @JsonKey(name: 'user_details') this.user,
      @JsonKey(name: 'confirmed_on') this.confirmedOn});

  factory _$BookingImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingImplFromJson(json);

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
  @JsonKey()
  final String? status;
  @override
  @JsonKey(name: 'total_cost')
  final String? totalCost;
  @override
  @JsonKey(name: 'total_tickets_count')
  final int? totalTicketsCount;
  @override
  @JsonKey(name: 'user_details')
  final UserState? user;
  @override
  @JsonKey(name: 'confirmed_on')
  final String? confirmedOn;

  @override
  String toString() {
    return 'Booking(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, active: $active, host: $host, product: $product, status: $status, totalCost: $totalCost, totalTicketsCount: $totalTicketsCount, user: $user, confirmedOn: $confirmedOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.totalTicketsCount, totalTicketsCount) ||
                other.totalTicketsCount == totalTicketsCount) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.confirmedOn, confirmedOn) ||
                other.confirmedOn == confirmedOn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, updatedAt, active,
      host, product, status, totalCost, totalTicketsCount, user, confirmedOn);

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingImplCopyWith<_$BookingImpl> get copyWith =>
      __$$BookingImplCopyWithImpl<_$BookingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingImplToJson(
      this,
    );
  }
}

abstract class _Booking implements Booking {
  factory _Booking(
          {final String? id,
          @JsonKey(name: 'created_at') final String? createdAt,
          @JsonKey(name: 'updated_at') final String? updatedAt,
          final bool? active,
          final String? host,
          final String? product,
          final String? status,
          @JsonKey(name: 'total_cost') final String? totalCost,
          @JsonKey(name: 'total_tickets_count') final int? totalTicketsCount,
          @JsonKey(name: 'user_details') final UserState? user,
          @JsonKey(name: 'confirmed_on') final String? confirmedOn}) =
      _$BookingImpl;

  factory _Booking.fromJson(Map<String, dynamic> json) = _$BookingImpl.fromJson;

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
  String? get status;
  @override
  @JsonKey(name: 'total_cost')
  String? get totalCost;
  @override
  @JsonKey(name: 'total_tickets_count')
  int? get totalTicketsCount;
  @override
  @JsonKey(name: 'user_details')
  UserState? get user;
  @override
  @JsonKey(name: 'confirmed_on')
  String? get confirmedOn;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingImplCopyWith<_$BookingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
