// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductLocationImpl _$$ProductLocationImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductLocationImpl(
      id: json['id'] as String? ?? UNKNOWN,
      createdAt: json['created_at'] as String? ?? UNKNOWN,
      updatedAt: json['updated_at'] as String? ?? UNKNOWN,
      active: json['active'] as bool? ?? false,
      host: json['host'] as String? ?? UNKNOWN,
      product: json['product'] as String? ?? UNKNOWN,
      coordinates: json['coordinates'] as String? ?? UNKNOWN,
      address: json['address'] as String? ?? UNKNOWN,
    );

Map<String, dynamic> _$$ProductLocationImplToJson(
        _$ProductLocationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'active': instance.active,
      'host': instance.host,
      'product': instance.product,
      'coordinates': instance.coordinates,
      'address': instance.address,
    };
