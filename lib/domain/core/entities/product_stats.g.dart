// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductStatsImpl _$$ProductStatsImplFromJson(Map<String, dynamic> json) =>
    _$ProductStatsImpl(
      bookings: (json['bookings'] as num?)?.toInt() ?? 0,
      revenue: json['revenue'] as String? ?? UNKNOWN,
    );

Map<String, dynamic> _$$ProductStatsImplToJson(_$ProductStatsImpl instance) =>
    <String, dynamic>{
      'bookings': instance.bookings,
      'revenue': instance.revenue,
    };
