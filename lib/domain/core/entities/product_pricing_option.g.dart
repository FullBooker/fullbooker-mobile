// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_pricing_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductPricingOptionImpl _$$ProductPricingOptionImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductPricingOptionImpl(
      id: json['id'] as String? ?? UNKNOWN,
      createdAt: json['created_at'] as String? ?? UNKNOWN,
      updatedAt: json['updated_at'] as String? ?? UNKNOWN,
      active: json['active'] as bool? ?? false,
      host: json['host'] as String? ?? UNKNOWN,
      product: json['product'] as String? ?? UNKNOWN,
      pricingOptionID: json['pricing_option'] as String? ?? UNKNOWN,
      productName: json['product_name'] as String? ?? UNKNOWN,
      pricingOptionName: json['pricing_option_name'] as String? ?? UNKNOWN,
      pricingOptionDescription:
          json['pricing_option_description'] as String? ?? UNKNOWN,
      pricingOptionType: json['pricing_option_type'] as String? ?? UNKNOWN,
    );

Map<String, dynamic> _$$ProductPricingOptionImplToJson(
        _$ProductPricingOptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'active': instance.active,
      'host': instance.host,
      'product': instance.product,
      'pricing_option': instance.pricingOptionID,
      'product_name': instance.productName,
      'pricing_option_name': instance.pricingOptionName,
      'pricing_option_description': instance.pricingOptionDescription,
      'pricing_option_type': instance.pricingOptionType,
    };
