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
  String get id => throw _privateConstructorUsedError;
  String get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  String get start => throw _privateConstructorUsedError;
  String get end => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String get endTime => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'open_days')
  List<dynamic> get openDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'closed_dates')
  List<dynamic> get closedDates => throw _privateConstructorUsedError;

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
      {String id,
      String product,
      @JsonKey(name: 'product_name') String productName,
      String start,
      String end,
      @JsonKey(name: 'start_time') String startTime,
      @JsonKey(name: 'end_time') String endTime,
      int? duration,
      @JsonKey(name: 'open_days') List<dynamic> openDays,
      @JsonKey(name: 'closed_dates') List<dynamic> closedDates});
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
    Object? id = null,
    Object? product = null,
    Object? productName = null,
    Object? start = null,
    Object? end = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? duration = freezed,
    Object? openDays = null,
    Object? closedDates = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      openDays: null == openDays
          ? _value.openDays
          : openDays // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      closedDates: null == closedDates
          ? _value.closedDates
          : closedDates // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
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
      {String id,
      String product,
      @JsonKey(name: 'product_name') String productName,
      String start,
      String end,
      @JsonKey(name: 'start_time') String startTime,
      @JsonKey(name: 'end_time') String endTime,
      int? duration,
      @JsonKey(name: 'open_days') List<dynamic> openDays,
      @JsonKey(name: 'closed_dates') List<dynamic> closedDates});
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
    Object? id = null,
    Object? product = null,
    Object? productName = null,
    Object? start = null,
    Object? end = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? duration = freezed,
    Object? openDays = null,
    Object? closedDates = null,
  }) {
    return _then(_$ProductAvailabilityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      openDays: null == openDays
          ? _value._openDays
          : openDays // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      closedDates: null == closedDates
          ? _value._closedDates
          : closedDates // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductAvailabilityImpl implements _ProductAvailability {
  _$ProductAvailabilityImpl(
      {required this.id,
      required this.product,
      @JsonKey(name: 'product_name') required this.productName,
      required this.start,
      required this.end,
      @JsonKey(name: 'start_time') required this.startTime,
      @JsonKey(name: 'end_time') required this.endTime,
      this.duration,
      @JsonKey(name: 'open_days')
      final List<dynamic> openDays = const <dynamic>[],
      @JsonKey(name: 'closed_dates')
      final List<dynamic> closedDates = const <dynamic>[]})
      : _openDays = openDays,
        _closedDates = closedDates;

  factory _$ProductAvailabilityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductAvailabilityImplFromJson(json);

  @override
  final String id;
  @override
  final String product;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  final String start;
  @override
  final String end;
  @override
  @JsonKey(name: 'start_time')
  final String startTime;
  @override
  @JsonKey(name: 'end_time')
  final String endTime;
  @override
  final int? duration;
  final List<dynamic> _openDays;
  @override
  @JsonKey(name: 'open_days')
  List<dynamic> get openDays {
    if (_openDays is EqualUnmodifiableListView) return _openDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_openDays);
  }

  final List<dynamic> _closedDates;
  @override
  @JsonKey(name: 'closed_dates')
  List<dynamic> get closedDates {
    if (_closedDates is EqualUnmodifiableListView) return _closedDates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_closedDates);
  }

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
            const DeepCollectionEquality().equals(other._openDays, _openDays) &&
            const DeepCollectionEquality()
                .equals(other._closedDates, _closedDates));
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
      const DeepCollectionEquality().hash(_openDays),
      const DeepCollectionEquality().hash(_closedDates));

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
          {required final String id,
          required final String product,
          @JsonKey(name: 'product_name') required final String productName,
          required final String start,
          required final String end,
          @JsonKey(name: 'start_time') required final String startTime,
          @JsonKey(name: 'end_time') required final String endTime,
          final int? duration,
          @JsonKey(name: 'open_days') final List<dynamic> openDays,
          @JsonKey(name: 'closed_dates') final List<dynamic> closedDates}) =
      _$ProductAvailabilityImpl;

  factory _ProductAvailability.fromJson(Map<String, dynamic> json) =
      _$ProductAvailabilityImpl.fromJson;

  @override
  String get id;
  @override
  String get product;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  String get start;
  @override
  String get end;
  @override
  @JsonKey(name: 'start_time')
  String get startTime;
  @override
  @JsonKey(name: 'end_time')
  String get endTime;
  @override
  int? get duration;
  @override
  @JsonKey(name: 'open_days')
  List<dynamic> get openDays;
  @override
  @JsonKey(name: 'closed_dates')
  List<dynamic> get closedDates;

  /// Create a copy of ProductAvailability
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductAvailabilityImplCopyWith<_$ProductAvailabilityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
