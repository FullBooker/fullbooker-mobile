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
      repeatType: json['repeat'] as String? ?? kNoRepeatSchedule,
      weekStartsOn: json['week_starts_on'] as String? ?? 'sunday',
      duration: (json['duration'] as num?)?.toInt() ?? 0,
      openDays: json['open_days'] as List<dynamic>? ?? const <dynamic>[],
      closedDates: json['closed_dates'] as List<dynamic>? ?? const <dynamic>[],
      repeatWeekly: (json['repeat_on_days_of_week'] as List<dynamic>?)
              ?.map((e) =>
                  RepeatWeeklySchedule.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <RepeatWeeklySchedule>[],
      repeatMonthly: (json['repeat_on_date_of_month'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const <int>[],
      repeatYearly: (json['repeat_on_month_of_year'] as List<dynamic>?)
              ?.map((e) =>
                  RepeatYearlySchedule.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <RepeatYearlySchedule>[],
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
      'repeat_on_days_of_week':
          instance.repeatWeekly?.map((e) => e.toJson()).toList(),
      'repeat_on_date_of_month': instance.repeatMonthly,
      'repeat_on_month_of_year':
          instance.repeatYearly?.map((e) => e.toJson()).toList(),
    };

_$RepeatWeeklyScheduleImpl _$$RepeatWeeklyScheduleImplFromJson(
        Map<String, dynamic> json) =>
    _$RepeatWeeklyScheduleImpl(
      day: json['day'] as String? ?? UNKNOWN,
      startTime: json['start_time'] as String? ?? UNKNOWN,
      endTime: json['end_time'] as String? ?? UNKNOWN,
    );

Map<String, dynamic> _$$RepeatWeeklyScheduleImplToJson(
        _$RepeatWeeklyScheduleImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
    };

_$RepeatYearlyScheduleImpl _$$RepeatYearlyScheduleImplFromJson(
        Map<String, dynamic> json) =>
    _$RepeatYearlyScheduleImpl(
      month: json['month'] as String? ?? UNKNOWN,
      repeatOnDateOfMonth: (json['repeat_on_date_of_month'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const <int>[],
    );

Map<String, dynamic> _$$RepeatYearlyScheduleImplToJson(
        _$RepeatYearlyScheduleImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'repeat_on_date_of_month': instance.repeatOnDateOfMonth,
    };
