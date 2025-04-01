// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      active: json['active'] as bool,
      host: UserState.fromJson(json['host'] as Map<String, dynamic>),
      name: json['name'] as String,
      description: json['description'] as String,
      number: json['number'] as String,
      category: json['category'] as String,
      subcategory: json['subcategory'] as String,
      availability: ProductAvailability.fromJson(
          json['availability'] as Map<String, dynamic>),
      pricing: (json['pricing'] as List<dynamic>)
          .map((e) => ProductPricing.fromJson(e as Map<String, dynamic>))
          .toList(),
      image: json['image'] == null
          ? null
          : ProductImage.fromJson(json['image'] as Map<String, dynamic>),
      video: json['video'],
      locations: (json['locations'] as List<dynamic>)
          .map((e) => ProductLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'active': instance.active,
      'host': instance.host.toJson(),
      'name': instance.name,
      'description': instance.description,
      'number': instance.number,
      'category': instance.category,
      'subcategory': instance.subcategory,
      'availability': instance.availability.toJson(),
      'pricing': instance.pricing.map((e) => e.toJson()).toList(),
      'image': instance.image?.toJson(),
      'video': instance.video,
      'locations': instance.locations.map((e) => e.toJson()).toList(),
    };
