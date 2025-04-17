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
      start: json['start'] as String? ?? UNKNOWN,
      end: json['end'] as String? ?? UNKNOWN,
      startTime: json['start_time'] as String? ?? UNKNOWN,
      endTime: json['end_time'] as String? ?? UNKNOWN,
      duration: (json['duration'] as num?)?.toInt() ?? 0,
      openDays: json['open_days'] as List<dynamic>? ?? const <dynamic>[],
      closedDates: json['closed_dates'] as List<dynamic>? ?? const <dynamic>[],
    );

Map<String, dynamic> _$$ProductScheduleImplToJson(
        _$ProductScheduleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'product_name': instance.productName,
      'start': instance.start,
      'end': instance.end,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'duration': instance.duration,
      'open_days': instance.openDays,
      'closed_dates': instance.closedDates,
    };
