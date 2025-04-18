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
    @Default(UNKNOWN) String? start,
    @Default(UNKNOWN) String? end,
    @Default(UNKNOWN) @JsonKey(name: 'start_time') String? startTime,
    @Default(UNKNOWN) @JsonKey(name: 'end_time') String? endTime,
    @Default(0) int? duration,
    @Default(<dynamic>[]) @JsonKey(name: 'open_days') List<dynamic>? openDays,
    @Default(<dynamic>[])
    @JsonKey(name: 'closed_dates')
    List<dynamic>? closedDates,

    // Other fields used for setup
    @Default(false) @JsonKey(name: 'all_day') bool? isAllDay,
    @Default(false) bool? repeats,
    @Default('Daily')
    @JsonKey(name: 'repeat_type')
    String? repeatType, // Daily, Weekly, Monthly, Yearly
    final Map<String, Map<String, String>>? repeatOnDaysOfWeek,
    @Default(<int>[]) List<int>? repeatMonthDates, // [5, 8, 21]
    @Default(<String>[]) List<String>? repeatYearDates, // ['2025-03-08']
  }) = _ProductSchedule;

  factory ProductSchedule.initial() => ProductSchedule();

  factory ProductSchedule.fromJson(Map<String, dynamic> json) =>
      _$ProductScheduleFromJson(json);
}
