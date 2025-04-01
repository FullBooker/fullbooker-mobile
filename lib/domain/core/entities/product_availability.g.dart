// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_availability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductAvailabilityImpl _$$ProductAvailabilityImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductAvailabilityImpl(
      id: json['id'] as String,
      product: json['product'] as String,
      productName: json['product_name'] as String,
      start: json['start'] as String,
      end: json['end'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      duration: (json['duration'] as num?)?.toInt(),
      openDays: json['open_days'] as List<dynamic>? ?? const <dynamic>[],
      closedDates: json['closed_dates'] as List<dynamic>? ?? const <dynamic>[],
    );

Map<String, dynamic> _$$ProductAvailabilityImplToJson(
        _$ProductAvailabilityImpl instance) =>
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
