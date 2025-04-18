// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductScheduleImpl _$$ProductScheduleImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductScheduleImpl(
      id: json['id'] as String? ?? UNKNOWN,
      product: json['product'] as String? ?? UNKNOWN,
      productName: json['product_name'] as String? ?? UNKNOWN,
      startDate: json['start_date'] as String? ?? UNKNOWN,
      startTime: json['start_time'] as String? ?? UNKNOWN,
      endDate: json['end_date'] as String? ?? UNKNOWN,
      endTime: json['end_time'] as String? ?? UNKNOWN,
      isAllDay: json['is_all_day'] as bool? ?? false,
      repeats: json['repeats'] as bool? ?? false,
      repeatType: json['repeat'] as String? ?? 'daily',
      weekStartsOn: json['week_starts_on'] as String? ?? 'sunday',
      duration: (json['duration'] as num?)?.toInt() ?? 0,
      openDays: json['open_days'] as List<dynamic>? ?? const <dynamic>[],
      closedDates: json['closed_dates'] as List<dynamic>? ?? const <dynamic>[],
      repeatOnDaysOfWeek:
          (json['repeatOnDaysOfWeek'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Map<String, String>.from(e as Map)),
      ),
      repeatMonthDates: (json['repeatMonthDates'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const <int>[],
      repeatYearDates: (json['repeatYearDates'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$$ProductScheduleImplToJson(
        _$ProductScheduleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'product_name': instance.productName,
      'start_date': instance.startDate,
      'start_time': instance.startTime,
      'end_date': instance.endDate,
      'end_time': instance.endTime,
      'is_all_day': instance.isAllDay,
      'repeats': instance.repeats,
      'repeat': instance.repeatType,
      'week_starts_on': instance.weekStartsOn,
      'duration': instance.duration,
      'open_days': instance.openDays,
      'closed_dates': instance.closedDates,
      'repeatOnDaysOfWeek': instance.repeatOnDaysOfWeek,
      'repeatMonthDates': instance.repeatMonthDates,
      'repeatYearDates': instance.repeatYearDates,
    };
