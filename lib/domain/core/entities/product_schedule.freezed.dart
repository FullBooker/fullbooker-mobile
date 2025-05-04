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
  @JsonKey(name: 'start_date')
  String? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  String? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String? get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_all_day')
  bool? get isAllDay => throw _privateConstructorUsedError;
  bool? get repeats => throw _privateConstructorUsedError;
  @JsonKey(name: 'repeat')
  String? get repeatType => throw _privateConstructorUsedError;
  @JsonKey(name: 'week_starts_on')
  String? get weekStartsOn => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'open_days')
  List<dynamic>? get openDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'closed_dates')
  List<dynamic>? get closedDates =>
      throw _privateConstructorUsedError; // Other fields used for setup
  @JsonKey(name: 'repeat_on_days_of_week')
  List<RepeatWeeklySchedule>? get repeatOnDaysOfWeek =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'repeat_on_date_of_month')
  List<int>? get repeatMonthDates => throw _privateConstructorUsedError;
  @JsonKey(name: 'repeat_on_month_of_year')
  List<RepeatYearlySchedule>? get repeatYearDates =>
      throw _privateConstructorUsedError;

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
      @JsonKey(name: 'start_date') String? startDate,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_date') String? endDate,
      @JsonKey(name: 'end_time') String? endTime,
      @JsonKey(name: 'is_all_day') bool? isAllDay,
      bool? repeats,
      @JsonKey(name: 'repeat') String? repeatType,
      @JsonKey(name: 'week_starts_on') String? weekStartsOn,
      int? duration,
      @JsonKey(name: 'open_days') List<dynamic>? openDays,
      @JsonKey(name: 'closed_dates') List<dynamic>? closedDates,
      @JsonKey(name: 'repeat_on_days_of_week')
      List<RepeatWeeklySchedule>? repeatOnDaysOfWeek,
      @JsonKey(name: 'repeat_on_date_of_month') List<int>? repeatMonthDates,
      @JsonKey(name: 'repeat_on_month_of_year')
      List<RepeatYearlySchedule>? repeatYearDates});
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
    Object? startDate = freezed,
    Object? startTime = freezed,
    Object? endDate = freezed,
    Object? endTime = freezed,
    Object? isAllDay = freezed,
    Object? repeats = freezed,
    Object? repeatType = freezed,
    Object? weekStartsOn = freezed,
    Object? duration = freezed,
    Object? openDays = freezed,
    Object? closedDates = freezed,
    Object? repeatOnDaysOfWeek = freezed,
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
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
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
      weekStartsOn: freezed == weekStartsOn
          ? _value.weekStartsOn
          : weekStartsOn // ignore: cast_nullable_to_non_nullable
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
      repeatOnDaysOfWeek: freezed == repeatOnDaysOfWeek
          ? _value.repeatOnDaysOfWeek
          : repeatOnDaysOfWeek // ignore: cast_nullable_to_non_nullable
              as List<RepeatWeeklySchedule>?,
      repeatMonthDates: freezed == repeatMonthDates
          ? _value.repeatMonthDates
          : repeatMonthDates // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      repeatYearDates: freezed == repeatYearDates
          ? _value.repeatYearDates
          : repeatYearDates // ignore: cast_nullable_to_non_nullable
              as List<RepeatYearlySchedule>?,
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
      @JsonKey(name: 'start_date') String? startDate,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_date') String? endDate,
      @JsonKey(name: 'end_time') String? endTime,
      @JsonKey(name: 'is_all_day') bool? isAllDay,
      bool? repeats,
      @JsonKey(name: 'repeat') String? repeatType,
      @JsonKey(name: 'week_starts_on') String? weekStartsOn,
      int? duration,
      @JsonKey(name: 'open_days') List<dynamic>? openDays,
      @JsonKey(name: 'closed_dates') List<dynamic>? closedDates,
      @JsonKey(name: 'repeat_on_days_of_week')
      List<RepeatWeeklySchedule>? repeatOnDaysOfWeek,
      @JsonKey(name: 'repeat_on_date_of_month') List<int>? repeatMonthDates,
      @JsonKey(name: 'repeat_on_month_of_year')
      List<RepeatYearlySchedule>? repeatYearDates});
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
    Object? startDate = freezed,
    Object? startTime = freezed,
    Object? endDate = freezed,
    Object? endTime = freezed,
    Object? isAllDay = freezed,
    Object? repeats = freezed,
    Object? repeatType = freezed,
    Object? weekStartsOn = freezed,
    Object? duration = freezed,
    Object? openDays = freezed,
    Object? closedDates = freezed,
    Object? repeatOnDaysOfWeek = freezed,
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
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
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
      weekStartsOn: freezed == weekStartsOn
          ? _value.weekStartsOn
          : weekStartsOn // ignore: cast_nullable_to_non_nullable
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
      repeatOnDaysOfWeek: freezed == repeatOnDaysOfWeek
          ? _value.repeatOnDaysOfWeek
          : repeatOnDaysOfWeek // ignore: cast_nullable_to_non_nullable
              as List<RepeatWeeklySchedule>?,
      repeatMonthDates: freezed == repeatMonthDates
          ? _value.repeatMonthDates
          : repeatMonthDates // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      repeatYearDates: freezed == repeatYearDates
          ? _value.repeatYearDates
          : repeatYearDates // ignore: cast_nullable_to_non_nullable
              as List<RepeatYearlySchedule>?,
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
      @JsonKey(name: 'start_date') this.startDate = UNKNOWN,
      @JsonKey(name: 'start_time') this.startTime = UNKNOWN,
      @JsonKey(name: 'end_date') this.endDate = UNKNOWN,
      @JsonKey(name: 'end_time') this.endTime = UNKNOWN,
      @JsonKey(name: 'is_all_day') this.isAllDay = false,
      this.repeats = false,
      @JsonKey(name: 'repeat') this.repeatType = 'daily',
      @JsonKey(name: 'week_starts_on') this.weekStartsOn = 'sunday',
      this.duration = 0,
      @JsonKey(name: 'open_days') this.openDays = const <dynamic>[],
      @JsonKey(name: 'closed_dates') this.closedDates = const <dynamic>[],
      @JsonKey(name: 'repeat_on_days_of_week')
      this.repeatOnDaysOfWeek = const <RepeatWeeklySchedule>[],
      @JsonKey(name: 'repeat_on_date_of_month')
      this.repeatMonthDates = const <int>[],
      @JsonKey(name: 'repeat_on_month_of_year')
      this.repeatYearDates = const <RepeatYearlySchedule>[]});

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
  @JsonKey(name: 'start_date')
  final String? startDate;
  @override
  @JsonKey(name: 'start_time')
  final String? startTime;
  @override
  @JsonKey(name: 'end_date')
  final String? endDate;
  @override
  @JsonKey(name: 'end_time')
  final String? endTime;
  @override
  @JsonKey(name: 'is_all_day')
  final bool? isAllDay;
  @override
  @JsonKey()
  final bool? repeats;
  @override
  @JsonKey(name: 'repeat')
  final String? repeatType;
  @override
  @JsonKey(name: 'week_starts_on')
  final String? weekStartsOn;
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
  @JsonKey(name: 'repeat_on_days_of_week')
  final List<RepeatWeeklySchedule>? repeatOnDaysOfWeek;
  @override
  @JsonKey(name: 'repeat_on_date_of_month')
  final List<int>? repeatMonthDates;
  @override
  @JsonKey(name: 'repeat_on_month_of_year')
  final List<RepeatYearlySchedule>? repeatYearDates;

  @override
  String toString() {
    return 'ProductSchedule(id: $id, product: $product, productName: $productName, startDate: $startDate, startTime: $startTime, endDate: $endDate, endTime: $endTime, isAllDay: $isAllDay, repeats: $repeats, repeatType: $repeatType, weekStartsOn: $weekStartsOn, duration: $duration, openDays: $openDays, closedDates: $closedDates, repeatOnDaysOfWeek: $repeatOnDaysOfWeek, repeatMonthDates: $repeatMonthDates, repeatYearDates: $repeatYearDates)';
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
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.isAllDay, isAllDay) ||
                other.isAllDay == isAllDay) &&
            (identical(other.repeats, repeats) || other.repeats == repeats) &&
            (identical(other.repeatType, repeatType) ||
                other.repeatType == repeatType) &&
            (identical(other.weekStartsOn, weekStartsOn) ||
                other.weekStartsOn == weekStartsOn) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality().equals(other.openDays, openDays) &&
            const DeepCollectionEquality()
                .equals(other.closedDates, closedDates) &&
            const DeepCollectionEquality()
                .equals(other.repeatOnDaysOfWeek, repeatOnDaysOfWeek) &&
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
      startDate,
      startTime,
      endDate,
      endTime,
      isAllDay,
      repeats,
      repeatType,
      weekStartsOn,
      duration,
      const DeepCollectionEquality().hash(openDays),
      const DeepCollectionEquality().hash(closedDates),
      const DeepCollectionEquality().hash(repeatOnDaysOfWeek),
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
          @JsonKey(name: 'start_date') final String? startDate,
          @JsonKey(name: 'start_time') final String? startTime,
          @JsonKey(name: 'end_date') final String? endDate,
          @JsonKey(name: 'end_time') final String? endTime,
          @JsonKey(name: 'is_all_day') final bool? isAllDay,
          final bool? repeats,
          @JsonKey(name: 'repeat') final String? repeatType,
          @JsonKey(name: 'week_starts_on') final String? weekStartsOn,
          final int? duration,
          @JsonKey(name: 'open_days') final List<dynamic>? openDays,
          @JsonKey(name: 'closed_dates') final List<dynamic>? closedDates,
          @JsonKey(name: 'repeat_on_days_of_week')
          final List<RepeatWeeklySchedule>? repeatOnDaysOfWeek,
          @JsonKey(name: 'repeat_on_date_of_month')
          final List<int>? repeatMonthDates,
          @JsonKey(name: 'repeat_on_month_of_year')
          final List<RepeatYearlySchedule>? repeatYearDates}) =
      _$ProductScheduleImpl;

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
  @JsonKey(name: 'start_date')
  String? get startDate;
  @override
  @JsonKey(name: 'start_time')
  String? get startTime;
  @override
  @JsonKey(name: 'end_date')
  String? get endDate;
  @override
  @JsonKey(name: 'end_time')
  String? get endTime;
  @override
  @JsonKey(name: 'is_all_day')
  bool? get isAllDay;
  @override
  bool? get repeats;
  @override
  @JsonKey(name: 'repeat')
  String? get repeatType;
  @override
  @JsonKey(name: 'week_starts_on')
  String? get weekStartsOn;
  @override
  int? get duration;
  @override
  @JsonKey(name: 'open_days')
  List<dynamic>? get openDays;
  @override
  @JsonKey(name: 'closed_dates')
  List<dynamic>? get closedDates; // Other fields used for setup
  @override
  @JsonKey(name: 'repeat_on_days_of_week')
  List<RepeatWeeklySchedule>? get repeatOnDaysOfWeek;
  @override
  @JsonKey(name: 'repeat_on_date_of_month')
  List<int>? get repeatMonthDates;
  @override
  @JsonKey(name: 'repeat_on_month_of_year')
  List<RepeatYearlySchedule>? get repeatYearDates;

  /// Create a copy of ProductSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductScheduleImplCopyWith<_$ProductScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RepeatWeeklySchedule _$RepeatWeeklyScheduleFromJson(Map<String, dynamic> json) {
  return _RepeatWeeklySchedule.fromJson(json);
}

/// @nodoc
mixin _$RepeatWeeklySchedule {
  @JsonKey(name: 'day')
  String? get day => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String? get endTime => throw _privateConstructorUsedError;

  /// Serializes this RepeatWeeklySchedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RepeatWeeklySchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepeatWeeklyScheduleCopyWith<RepeatWeeklySchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepeatWeeklyScheduleCopyWith<$Res> {
  factory $RepeatWeeklyScheduleCopyWith(RepeatWeeklySchedule value,
          $Res Function(RepeatWeeklySchedule) then) =
      _$RepeatWeeklyScheduleCopyWithImpl<$Res, RepeatWeeklySchedule>;
  @useResult
  $Res call(
      {@JsonKey(name: 'day') String? day,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime});
}

/// @nodoc
class _$RepeatWeeklyScheduleCopyWithImpl<$Res,
        $Val extends RepeatWeeklySchedule>
    implements $RepeatWeeklyScheduleCopyWith<$Res> {
  _$RepeatWeeklyScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepeatWeeklySchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_value.copyWith(
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepeatWeeklyScheduleImplCopyWith<$Res>
    implements $RepeatWeeklyScheduleCopyWith<$Res> {
  factory _$$RepeatWeeklyScheduleImplCopyWith(_$RepeatWeeklyScheduleImpl value,
          $Res Function(_$RepeatWeeklyScheduleImpl) then) =
      __$$RepeatWeeklyScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'day') String? day,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime});
}

/// @nodoc
class __$$RepeatWeeklyScheduleImplCopyWithImpl<$Res>
    extends _$RepeatWeeklyScheduleCopyWithImpl<$Res, _$RepeatWeeklyScheduleImpl>
    implements _$$RepeatWeeklyScheduleImplCopyWith<$Res> {
  __$$RepeatWeeklyScheduleImplCopyWithImpl(_$RepeatWeeklyScheduleImpl _value,
      $Res Function(_$RepeatWeeklyScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of RepeatWeeklySchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_$RepeatWeeklyScheduleImpl(
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RepeatWeeklyScheduleImpl implements _RepeatWeeklySchedule {
  _$RepeatWeeklyScheduleImpl(
      {@JsonKey(name: 'day') this.day = UNKNOWN,
      @JsonKey(name: 'start_time') this.startTime = UNKNOWN,
      @JsonKey(name: 'end_time') this.endTime = UNKNOWN});

  factory _$RepeatWeeklyScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepeatWeeklyScheduleImplFromJson(json);

  @override
  @JsonKey(name: 'day')
  final String? day;
  @override
  @JsonKey(name: 'start_time')
  final String? startTime;
  @override
  @JsonKey(name: 'end_time')
  final String? endTime;

  @override
  String toString() {
    return 'RepeatWeeklySchedule(day: $day, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepeatWeeklyScheduleImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, day, startTime, endTime);

  /// Create a copy of RepeatWeeklySchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepeatWeeklyScheduleImplCopyWith<_$RepeatWeeklyScheduleImpl>
      get copyWith =>
          __$$RepeatWeeklyScheduleImplCopyWithImpl<_$RepeatWeeklyScheduleImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepeatWeeklyScheduleImplToJson(
      this,
    );
  }
}

abstract class _RepeatWeeklySchedule implements RepeatWeeklySchedule {
  factory _RepeatWeeklySchedule(
          {@JsonKey(name: 'day') final String? day,
          @JsonKey(name: 'start_time') final String? startTime,
          @JsonKey(name: 'end_time') final String? endTime}) =
      _$RepeatWeeklyScheduleImpl;

  factory _RepeatWeeklySchedule.fromJson(Map<String, dynamic> json) =
      _$RepeatWeeklyScheduleImpl.fromJson;

  @override
  @JsonKey(name: 'day')
  String? get day;
  @override
  @JsonKey(name: 'start_time')
  String? get startTime;
  @override
  @JsonKey(name: 'end_time')
  String? get endTime;

  /// Create a copy of RepeatWeeklySchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepeatWeeklyScheduleImplCopyWith<_$RepeatWeeklyScheduleImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RepeatYearlySchedule _$RepeatYearlyScheduleFromJson(Map<String, dynamic> json) {
  return _RepeatYearlySchedule.fromJson(json);
}

/// @nodoc
mixin _$RepeatYearlySchedule {
  @JsonKey(name: 'month')
  String? get month => throw _privateConstructorUsedError;
  @JsonKey(name: 'repeat_on_date_of_month')
  List<int>? get repeatOnDateOfMonth => throw _privateConstructorUsedError;

  /// Serializes this RepeatYearlySchedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RepeatYearlySchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepeatYearlyScheduleCopyWith<RepeatYearlySchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepeatYearlyScheduleCopyWith<$Res> {
  factory $RepeatYearlyScheduleCopyWith(RepeatYearlySchedule value,
          $Res Function(RepeatYearlySchedule) then) =
      _$RepeatYearlyScheduleCopyWithImpl<$Res, RepeatYearlySchedule>;
  @useResult
  $Res call(
      {@JsonKey(name: 'month') String? month,
      @JsonKey(name: 'repeat_on_date_of_month')
      List<int>? repeatOnDateOfMonth});
}

/// @nodoc
class _$RepeatYearlyScheduleCopyWithImpl<$Res,
        $Val extends RepeatYearlySchedule>
    implements $RepeatYearlyScheduleCopyWith<$Res> {
  _$RepeatYearlyScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepeatYearlySchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = freezed,
    Object? repeatOnDateOfMonth = freezed,
  }) {
    return _then(_value.copyWith(
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String?,
      repeatOnDateOfMonth: freezed == repeatOnDateOfMonth
          ? _value.repeatOnDateOfMonth
          : repeatOnDateOfMonth // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepeatYearlyScheduleImplCopyWith<$Res>
    implements $RepeatYearlyScheduleCopyWith<$Res> {
  factory _$$RepeatYearlyScheduleImplCopyWith(_$RepeatYearlyScheduleImpl value,
          $Res Function(_$RepeatYearlyScheduleImpl) then) =
      __$$RepeatYearlyScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'month') String? month,
      @JsonKey(name: 'repeat_on_date_of_month')
      List<int>? repeatOnDateOfMonth});
}

/// @nodoc
class __$$RepeatYearlyScheduleImplCopyWithImpl<$Res>
    extends _$RepeatYearlyScheduleCopyWithImpl<$Res, _$RepeatYearlyScheduleImpl>
    implements _$$RepeatYearlyScheduleImplCopyWith<$Res> {
  __$$RepeatYearlyScheduleImplCopyWithImpl(_$RepeatYearlyScheduleImpl _value,
      $Res Function(_$RepeatYearlyScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of RepeatYearlySchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = freezed,
    Object? repeatOnDateOfMonth = freezed,
  }) {
    return _then(_$RepeatYearlyScheduleImpl(
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String?,
      repeatOnDateOfMonth: freezed == repeatOnDateOfMonth
          ? _value.repeatOnDateOfMonth
          : repeatOnDateOfMonth // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RepeatYearlyScheduleImpl implements _RepeatYearlySchedule {
  _$RepeatYearlyScheduleImpl(
      {@JsonKey(name: 'month') this.month = UNKNOWN,
      @JsonKey(name: 'repeat_on_date_of_month')
      this.repeatOnDateOfMonth = const <int>[]});

  factory _$RepeatYearlyScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepeatYearlyScheduleImplFromJson(json);

  @override
  @JsonKey(name: 'month')
  final String? month;
  @override
  @JsonKey(name: 'repeat_on_date_of_month')
  final List<int>? repeatOnDateOfMonth;

  @override
  String toString() {
    return 'RepeatYearlySchedule(month: $month, repeatOnDateOfMonth: $repeatOnDateOfMonth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepeatYearlyScheduleImpl &&
            (identical(other.month, month) || other.month == month) &&
            const DeepCollectionEquality()
                .equals(other.repeatOnDateOfMonth, repeatOnDateOfMonth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, month,
      const DeepCollectionEquality().hash(repeatOnDateOfMonth));

  /// Create a copy of RepeatYearlySchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepeatYearlyScheduleImplCopyWith<_$RepeatYearlyScheduleImpl>
      get copyWith =>
          __$$RepeatYearlyScheduleImplCopyWithImpl<_$RepeatYearlyScheduleImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepeatYearlyScheduleImplToJson(
      this,
    );
  }
}

abstract class _RepeatYearlySchedule implements RepeatYearlySchedule {
  factory _RepeatYearlySchedule(
      {@JsonKey(name: 'month') final String? month,
      @JsonKey(name: 'repeat_on_date_of_month')
      final List<int>? repeatOnDateOfMonth}) = _$RepeatYearlyScheduleImpl;

  factory _RepeatYearlySchedule.fromJson(Map<String, dynamic> json) =
      _$RepeatYearlyScheduleImpl.fromJson;

  @override
  @JsonKey(name: 'month')
  String? get month;
  @override
  @JsonKey(name: 'repeat_on_date_of_month')
  List<int>? get repeatOnDateOfMonth;

  /// Create a copy of RepeatYearlySchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepeatYearlyScheduleImplCopyWith<_$RepeatYearlyScheduleImpl>
      get copyWith => throw _privateConstructorUsedError;
}
