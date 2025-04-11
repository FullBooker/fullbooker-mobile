// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_availability.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductAvailability _$ProductAvailabilityFromJson(Map<String, dynamic> json) {
  return _ProductAvailability.fromJson(json);
}

/// @nodoc
mixin _$ProductAvailability {
  String? get id => throw _privateConstructorUsedError;
  String? get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String? get productName => throw _privateConstructorUsedError;
  String? get start => throw _privateConstructorUsedError;
  String? get end => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String? get endTime => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'open_days')
  List<dynamic>? get openDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'closed_dates')
  List<dynamic>? get closedDates => throw _privateConstructorUsedError;

  /// Serializes this ProductAvailability to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductAvailability
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductAvailabilityCopyWith<ProductAvailability> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductAvailabilityCopyWith<$Res> {
  factory $ProductAvailabilityCopyWith(
          ProductAvailability value, $Res Function(ProductAvailability) then) =
      _$ProductAvailabilityCopyWithImpl<$Res, ProductAvailability>;
  @useResult
  $Res call(
      {String? id,
      String? product,
      @JsonKey(name: 'product_name') String? productName,
      String? start,
      String? end,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      int? duration,
      @JsonKey(name: 'open_days') List<dynamic>? openDays,
      @JsonKey(name: 'closed_dates') List<dynamic>? closedDates});
}

/// @nodoc
class _$ProductAvailabilityCopyWithImpl<$Res, $Val extends ProductAvailability>
    implements $ProductAvailabilityCopyWith<$Res> {
  _$ProductAvailabilityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductAvailability
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? product = freezed,
    Object? productName = freezed,
    Object? start = freezed,
    Object? end = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? duration = freezed,
    Object? openDays = freezed,
    Object? closedDates = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      openDays: freezed == openDays
          ? _value.openDays
          : openDays // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      closedDates: freezed == closedDates
          ? _value.closedDates
          : closedDates // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductAvailabilityImplCopyWith<$Res>
    implements $ProductAvailabilityCopyWith<$Res> {
  factory _$$ProductAvailabilityImplCopyWith(_$ProductAvailabilityImpl value,
          $Res Function(_$ProductAvailabilityImpl) then) =
      __$$ProductAvailabilityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? product,
      @JsonKey(name: 'product_name') String? productName,
      String? start,
      String? end,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      int? duration,
      @JsonKey(name: 'open_days') List<dynamic>? openDays,
      @JsonKey(name: 'closed_dates') List<dynamic>? closedDates});
}

/// @nodoc
class __$$ProductAvailabilityImplCopyWithImpl<$Res>
    extends _$ProductAvailabilityCopyWithImpl<$Res, _$ProductAvailabilityImpl>
    implements _$$ProductAvailabilityImplCopyWith<$Res> {
  __$$ProductAvailabilityImplCopyWithImpl(_$ProductAvailabilityImpl _value,
      $Res Function(_$ProductAvailabilityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductAvailability
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? product = freezed,
    Object? productName = freezed,
    Object? start = freezed,
    Object? end = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? duration = freezed,
    Object? openDays = freezed,
    Object? closedDates = freezed,
  }) {
    return _then(_$ProductAvailabilityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      openDays: freezed == openDays
          ? _value.openDays
          : openDays // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      closedDates: freezed == closedDates
          ? _value.closedDates
          : closedDates // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ProductAvailabilityImpl implements _ProductAvailability {
  _$ProductAvailabilityImpl(
      {this.id = UNKNOWN,
      this.product = UNKNOWN,
      @JsonKey(name: 'product_name') this.productName = UNKNOWN,
      this.start = UNKNOWN,
      this.end = UNKNOWN,
      @JsonKey(name: 'start_time') this.startTime = UNKNOWN,
      @JsonKey(name: 'end_time') this.endTime = UNKNOWN,
      this.duration = 0,
      @JsonKey(name: 'open_days') this.openDays = const <dynamic>[],
      @JsonKey(name: 'closed_dates') this.closedDates = const <dynamic>[]});

  factory _$ProductAvailabilityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductAvailabilityImplFromJson(json);

  @override
  @JsonKey()
  final String? id;
  @override
  @JsonKey()
  final String? product;
  @override
  @JsonKey(name: 'product_name')
  final String? productName;
  @override
  @JsonKey()
  final String? start;
  @override
  @JsonKey()
  final String? end;
  @override
  @JsonKey(name: 'start_time')
  final String? startTime;
  @override
  @JsonKey(name: 'end_time')
  final String? endTime;
  @override
  @JsonKey()
  final int? duration;
  @override
  @JsonKey(name: 'open_days')
  final List<dynamic>? openDays;
  @override
  @JsonKey(name: 'closed_dates')
  final List<dynamic>? closedDates;

  @override
  String toString() {
    return 'ProductAvailability(id: $id, product: $product, productName: $productName, start: $start, end: $end, startTime: $startTime, endTime: $endTime, duration: $duration, openDays: $openDays, closedDates: $closedDates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductAvailabilityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality().equals(other.openDays, openDays) &&
            const DeepCollectionEquality()
                .equals(other.closedDates, closedDates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      product,
      productName,
      start,
      end,
      startTime,
      endTime,
      duration,
      const DeepCollectionEquality().hash(openDays),
      const DeepCollectionEquality().hash(closedDates));

  /// Create a copy of ProductAvailability
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductAvailabilityImplCopyWith<_$ProductAvailabilityImpl> get copyWith =>
      __$$ProductAvailabilityImplCopyWithImpl<_$ProductAvailabilityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductAvailabilityImplToJson(
      this,
    );
  }
}

abstract class _ProductAvailability implements ProductAvailability {
  factory _ProductAvailability(
          {final String? id,
          final String? product,
          @JsonKey(name: 'product_name') final String? productName,
          final String? start,
          final String? end,
          @JsonKey(name: 'start_time') final String? startTime,
          @JsonKey(name: 'end_time') final String? endTime,
          final int? duration,
          @JsonKey(name: 'open_days') final List<dynamic>? openDays,
          @JsonKey(name: 'closed_dates') final List<dynamic>? closedDates}) =
      _$ProductAvailabilityImpl;

  factory _ProductAvailability.fromJson(Map<String, dynamic> json) =
      _$ProductAvailabilityImpl.fromJson;

  @override
  String? get id;
  @override
  String? get product;
  @override
  @JsonKey(name: 'product_name')
  String? get productName;
  @override
  String? get start;
  @override
  String? get end;
  @override
  @JsonKey(name: 'start_time')
  String? get startTime;
  @override
  @JsonKey(name: 'end_time')
  String? get endTime;
  @override
  int? get duration;
  @override
  @JsonKey(name: 'open_days')
  List<dynamic>? get openDays;
  @override
  @JsonKey(name: 'closed_dates')
  List<dynamic>? get closedDates;

  /// Create a copy of ProductAvailability
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductAvailabilityImplCopyWith<_$ProductAvailabilityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
