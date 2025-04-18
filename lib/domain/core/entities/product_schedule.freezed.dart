// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductSchedule _$ProductScheduleFromJson(Map<String, dynamic> json) {
  return _ProductSchedule.fromJson(json);
}

/// @nodoc
mixin _$ProductSchedule {
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
  List<dynamic>? get closedDates =>
      throw _privateConstructorUsedError; // Other fields used for setup
  @JsonKey(name: 'all_day')
  bool? get isAllDay => throw _privateConstructorUsedError;
  bool? get repeats => throw _privateConstructorUsedError;
  @JsonKey(name: 'repeat_type')
  String? get repeatType =>
      throw _privateConstructorUsedError; // Daily, Weekly, Monthly, Yearly
  List<String>? get repeatWeekdays =>
      throw _privateConstructorUsedError; // ['Mon', 'Wed']
  List<int>? get repeatMonthDates =>
      throw _privateConstructorUsedError; // [5, 8, 21]
  List<String>? get repeatYearDates => throw _privateConstructorUsedError;

  /// Serializes this ProductSchedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductScheduleCopyWith<ProductSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductScheduleCopyWith<$Res> {
  factory $ProductScheduleCopyWith(
          ProductSchedule value, $Res Function(ProductSchedule) then) =
      _$ProductScheduleCopyWithImpl<$Res, ProductSchedule>;
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
      @JsonKey(name: 'closed_dates') List<dynamic>? closedDates,
      @JsonKey(name: 'all_day') bool? isAllDay,
      bool? repeats,
      @JsonKey(name: 'repeat_type') String? repeatType,
      List<String>? repeatWeekdays,
      List<int>? repeatMonthDates,
      List<String>? repeatYearDates});
}

/// @nodoc
class _$ProductScheduleCopyWithImpl<$Res, $Val extends ProductSchedule>
    implements $ProductScheduleCopyWith<$Res> {
  _$ProductScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductSchedule
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
    Object? isAllDay = freezed,
    Object? repeats = freezed,
    Object? repeatType = freezed,
    Object? repeatWeekdays = freezed,
    Object? repeatMonthDates = freezed,
    Object? repeatYearDates = freezed,
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
      isAllDay: freezed == isAllDay
          ? _value.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool?,
      repeats: freezed == repeats
          ? _value.repeats
          : repeats // ignore: cast_nullable_to_non_nullable
              as bool?,
      repeatType: freezed == repeatType
          ? _value.repeatType
          : repeatType // ignore: cast_nullable_to_non_nullable
              as String?,
      repeatWeekdays: freezed == repeatWeekdays
          ? _value.repeatWeekdays
          : repeatWeekdays // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      repeatMonthDates: freezed == repeatMonthDates
          ? _value.repeatMonthDates
          : repeatMonthDates // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      repeatYearDates: freezed == repeatYearDates
          ? _value.repeatYearDates
          : repeatYearDates // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductScheduleImplCopyWith<$Res>
    implements $ProductScheduleCopyWith<$Res> {
  factory _$$ProductScheduleImplCopyWith(_$ProductScheduleImpl value,
          $Res Function(_$ProductScheduleImpl) then) =
      __$$ProductScheduleImplCopyWithImpl<$Res>;
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
      @JsonKey(name: 'closed_dates') List<dynamic>? closedDates,
      @JsonKey(name: 'all_day') bool? isAllDay,
      bool? repeats,
      @JsonKey(name: 'repeat_type') String? repeatType,
      List<String>? repeatWeekdays,
      List<int>? repeatMonthDates,
      List<String>? repeatYearDates});
}

/// @nodoc
class __$$ProductScheduleImplCopyWithImpl<$Res>
    extends _$ProductScheduleCopyWithImpl<$Res, _$ProductScheduleImpl>
    implements _$$ProductScheduleImplCopyWith<$Res> {
  __$$ProductScheduleImplCopyWithImpl(
      _$ProductScheduleImpl _value, $Res Function(_$ProductScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductSchedule
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
    Object? isAllDay = freezed,
    Object? repeats = freezed,
    Object? repeatType = freezed,
    Object? repeatWeekdays = freezed,
    Object? repeatMonthDates = freezed,
    Object? repeatYearDates = freezed,
  }) {
    return _then(_$ProductScheduleImpl(
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
      isAllDay: freezed == isAllDay
          ? _value.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool?,
      repeats: freezed == repeats
          ? _value.repeats
          : repeats // ignore: cast_nullable_to_non_nullable
              as bool?,
      repeatType: freezed == repeatType
          ? _value.repeatType
          : repeatType // ignore: cast_nullable_to_non_nullable
              as String?,
      repeatWeekdays: freezed == repeatWeekdays
          ? _value.repeatWeekdays
          : repeatWeekdays // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      repeatMonthDates: freezed == repeatMonthDates
          ? _value.repeatMonthDates
          : repeatMonthDates // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      repeatYearDates: freezed == repeatYearDates
          ? _value.repeatYearDates
          : repeatYearDates // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ProductScheduleImpl implements _ProductSchedule {
  _$ProductScheduleImpl(
      {this.id = UNKNOWN,
      this.product = UNKNOWN,
      @JsonKey(name: 'product_name') this.productName = UNKNOWN,
      this.start = UNKNOWN,
      this.end = UNKNOWN,
      @JsonKey(name: 'start_time') this.startTime = UNKNOWN,
      @JsonKey(name: 'end_time') this.endTime = UNKNOWN,
      this.duration = 0,
      @JsonKey(name: 'open_days') this.openDays = const <dynamic>[],
      @JsonKey(name: 'closed_dates') this.closedDates = const <dynamic>[],
      @JsonKey(name: 'all_day') this.isAllDay = false,
      this.repeats = false,
      @JsonKey(name: 'repeat_type') this.repeatType = 'Daily',
      this.repeatWeekdays = const <String>[],
      this.repeatMonthDates = const <int>[],
      this.repeatYearDates = const <String>[]});

  factory _$ProductScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductScheduleImplFromJson(json);

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
// Other fields used for setup
  @override
  @JsonKey(name: 'all_day')
  final bool? isAllDay;
  @override
  @JsonKey()
  final bool? repeats;
  @override
  @JsonKey(name: 'repeat_type')
  final String? repeatType;
// Daily, Weekly, Monthly, Yearly
  @override
  @JsonKey()
  final List<String>? repeatWeekdays;
// ['Mon', 'Wed']
  @override
  @JsonKey()
  final List<int>? repeatMonthDates;
// [5, 8, 21]
  @override
  @JsonKey()
  final List<String>? repeatYearDates;

  @override
  String toString() {
    return 'ProductSchedule(id: $id, product: $product, productName: $productName, start: $start, end: $end, startTime: $startTime, endTime: $endTime, duration: $duration, openDays: $openDays, closedDates: $closedDates, isAllDay: $isAllDay, repeats: $repeats, repeatType: $repeatType, repeatWeekdays: $repeatWeekdays, repeatMonthDates: $repeatMonthDates, repeatYearDates: $repeatYearDates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductScheduleImpl &&
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
                .equals(other.closedDates, closedDates) &&
            (identical(other.isAllDay, isAllDay) ||
                other.isAllDay == isAllDay) &&
            (identical(other.repeats, repeats) || other.repeats == repeats) &&
            (identical(other.repeatType, repeatType) ||
                other.repeatType == repeatType) &&
            const DeepCollectionEquality()
                .equals(other.repeatWeekdays, repeatWeekdays) &&
            const DeepCollectionEquality()
                .equals(other.repeatMonthDates, repeatMonthDates) &&
            const DeepCollectionEquality()
                .equals(other.repeatYearDates, repeatYearDates));
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
      const DeepCollectionEquality().hash(closedDates),
      isAllDay,
      repeats,
      repeatType,
      const DeepCollectionEquality().hash(repeatWeekdays),
      const DeepCollectionEquality().hash(repeatMonthDates),
      const DeepCollectionEquality().hash(repeatYearDates));

  /// Create a copy of ProductSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductScheduleImplCopyWith<_$ProductScheduleImpl> get copyWith =>
      __$$ProductScheduleImplCopyWithImpl<_$ProductScheduleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductScheduleImplToJson(
      this,
    );
  }
}

abstract class _ProductSchedule implements ProductSchedule {
  factory _ProductSchedule(
      {final String? id,
      final String? product,
      @JsonKey(name: 'product_name') final String? productName,
      final String? start,
      final String? end,
      @JsonKey(name: 'start_time') final String? startTime,
      @JsonKey(name: 'end_time') final String? endTime,
      final int? duration,
      @JsonKey(name: 'open_days') final List<dynamic>? openDays,
      @JsonKey(name: 'closed_dates') final List<dynamic>? closedDates,
      @JsonKey(name: 'all_day') final bool? isAllDay,
      final bool? repeats,
      @JsonKey(name: 'repeat_type') final String? repeatType,
      final List<String>? repeatWeekdays,
      final List<int>? repeatMonthDates,
      final List<String>? repeatYearDates}) = _$ProductScheduleImpl;

  factory _ProductSchedule.fromJson(Map<String, dynamic> json) =
      _$ProductScheduleImpl.fromJson;

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
  List<dynamic>? get closedDates; // Other fields used for setup
  @override
  @JsonKey(name: 'all_day')
  bool? get isAllDay;
  @override
  bool? get repeats;
  @override
  @JsonKey(name: 'repeat_type')
  String? get repeatType; // Daily, Weekly, Monthly, Yearly
  @override
  List<String>? get repeatWeekdays; // ['Mon', 'Wed']
  @override
  List<int>? get repeatMonthDates; // [5, 8, 21]
  @override
  List<String>? get repeatYearDates;

  /// Create a copy of ProductSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductScheduleImplCopyWith<_$ProductScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
