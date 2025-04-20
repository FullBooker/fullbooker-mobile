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
      status: json['status'] as String? ?? UNKNOWN,
      totalCost: json['total_cost'] as String? ?? UNKNOWN,
      totalTicketsCount: (json['total_tickets_count'] as num?)?.toInt() ?? 0,
      user: json['user_details'] == null
          ? null
          : UserState.fromJson(json['user_details'] as Map<String, dynamic>),
      confirmedOn: json['confirmed_on'] as String?,
    );

Map<String, dynamic> _$$BookingImplToJson(_$BookingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'active': instance.active,
      'host': instance.host,
      'product': instance.product,
      'status': instance.status,
      'total_cost': instance.totalCost,
      'total_tickets_count': instance.totalTicketsCount,
      'user_details': instance.user?.toJson(),
      'confirmed_on': instance.confirmedOn,
    };
