import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/core/common/constants.dart';

part 'product_schedule.freezed.dart';
part 'product_schedule.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ProductSchedule with _$ProductSchedule {
  @JsonSerializable(explicitToJson: true)
  factory ProductSchedule({
    @Default(UNKNOWN) String? id,
    @Default(UNKNOWN) String? product,
    @Default(UNKNOWN) @JsonKey(name: 'product_name') String? productName,
    @Default(UNKNOWN) @JsonKey(name: 'start_date') String? startDate,
    @Default(UNKNOWN) @JsonKey(name: 'start_time') String? startTime,
    @Default(UNKNOWN) @JsonKey(name: 'end_date') String? endDate,
    @Default(UNKNOWN) @JsonKey(name: 'end_time') String? endTime,
    @Default(false) @JsonKey(name: 'is_all_day') bool? isAllDay,
    @Default(false) bool? repeats,
    @Default('daily') @JsonKey(name: 'repeat') String? repeatType,
    @Default('sunday') @JsonKey(name: 'week_starts_on') String? weekStartsOn,
    @Default(0) int? duration,
    @Default(<dynamic>[]) @JsonKey(name: 'open_days') List<dynamic>? openDays,
    @Default(<dynamic>[])
    @JsonKey(name: 'closed_dates')
    List<dynamic>? closedDates,

    // Other fields used for setup
    @JsonKey(name: 'repeat_on_days_of_week')
    @Default(<RepeatWeeklySchedule>[])
    final List<RepeatWeeklySchedule>? repeatOnDaysOfWeek,
    @JsonKey(name: 'repeat_on_date_of_month')
    @Default(<int>[])
    List<int>? repeatMonthDates,
    @JsonKey(name: 'repeat_on_month_of_year')
    @Default(<RepeatYearlySchedule>[])
    List<RepeatYearlySchedule>? repeatYearDates,
  }) = _ProductSchedule;

  factory ProductSchedule.initial() => ProductSchedule();

  factory ProductSchedule.fromJson(Map<String, dynamic> json) =>
      _$ProductScheduleFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class RepeatWeeklySchedule with _$RepeatWeeklySchedule {
  @JsonSerializable(explicitToJson: true)
  factory RepeatWeeklySchedule({
    @Default(UNKNOWN) @JsonKey(name: 'day') String? day,
    @Default(UNKNOWN) @JsonKey(name: 'start_time') String? startTime,
    @Default(UNKNOWN) @JsonKey(name: 'end_time') String? endTime,
  }) = _RepeatWeeklySchedule;

  factory RepeatWeeklySchedule.initial() => RepeatWeeklySchedule();

  factory RepeatWeeklySchedule.fromJson(Map<String, dynamic> json) =>
      _$RepeatWeeklyScheduleFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class RepeatYearlySchedule with _$RepeatYearlySchedule {
  @JsonSerializable(explicitToJson: true)
  factory RepeatYearlySchedule({
    @Default(UNKNOWN) @JsonKey(name: 'month') String? month,
    @Default(<int>[])
    @JsonKey(name: 'repeat_on_date_of_month')
    List<int>? repeatOnDateOfMonth,
  }) = _RepeatYearlySchedule;

  factory RepeatYearlySchedule.initial() => RepeatYearlySchedule();

  factory RepeatYearlySchedule.fromJson(Map<String, dynamic> json) =>
      _$RepeatYearlyScheduleFromJson(json);
}
