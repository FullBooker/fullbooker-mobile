// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingImpl _$$BookingImplFromJson(Map<String, dynamic> json) =>
    _$BookingImpl(
      id: json['id'] as String? ?? UNKNOWN,
      createdAt: json['created_at'] as String? ?? UNKNOWN,
      updatedAt: json['updated_at'] as String? ?? UNKNOWN,
      active: json['active'] as bool? ?? false,
      host: json['host'] as String? ?? UNKNOWN,
      product: json['product'] as String? ?? UNKNOWN,
      user: json['user'] as String? ?? UNKNOWN,
      status: json['status'] as String? ?? UNKNOWN,
      totalCost: json['total_cost'] as String? ?? UNKNOWN,
      totalTicketsCount: (json['total_tickets_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$BookingImplToJson(_$BookingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'active': instance.active,
      'host': instance.host,
      'product': instance.product,
      'user': instance.user,
      'status': instance.status,
      'total_cost': instance.totalCost,
      'total_tickets_count': instance.totalTicketsCount,
    };
