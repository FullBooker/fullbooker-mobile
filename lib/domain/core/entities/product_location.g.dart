// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductLocationImpl _$$ProductLocationImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductLocationImpl(
      id: json['id'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      active: json['active'] as bool,
      host: json['host'] as String,
      product: json['product'] as String,
      coordinates: json['coordinates'] as String,
      address: json['address'] as String,
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
