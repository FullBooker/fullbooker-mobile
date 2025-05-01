// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PricingOptionImpl _$$PricingOptionImplFromJson(Map<String, dynamic> json) =>
    _$PricingOptionImpl(
      id: json['id'] as String? ?? UNKNOWN,
      createdAt: json['created_at'] as String? ?? UNKNOWN,
      updatedAt: json['updated_at'] as String? ?? UNKNOWN,
      active: json['active'] as bool? ?? false,
      name: json['name'] as String? ?? UNKNOWN,
      description: json['description'] as String? ?? UNKNOWN,
      pricingOptionType: json['type'] as String? ?? UNKNOWN,
    );

Map<String, dynamic> _$$PricingOptionImplToJson(_$PricingOptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'active': instance.active,
      'name': instance.name,
      'description': instance.description,
      'type': instance.pricingOptionType,
    };
