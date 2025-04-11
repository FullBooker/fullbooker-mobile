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
      user: json['user'] == null
          ? null
          : UserState.fromJson(json['user'] as Map<String, dynamic>),
      bookingType: json['bookingType'] as String? ?? UNKNOWN,
      verified: json['verified'] as bool? ?? false,
      bookedOn: json['bookedOn'] as String? ?? UNKNOWN,
      price: (json['price'] as num?)?.toDouble() ?? 0,
      status: json['status'] as String? ?? UNKNOWN,
    );

Map<String, dynamic> _$$BookingImplToJson(_$BookingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'active': instance.active,
      'user': instance.user?.toJson(),
      'bookingType': instance.bookingType,
      'verified': instance.verified,
      'bookedOn': instance.bookedOn,
      'price': instance.price,
      'status': instance.status,
    };
