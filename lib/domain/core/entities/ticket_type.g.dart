// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketTypeImpl _$$TicketTypeImplFromJson(Map<String, dynamic> json) =>
    _$TicketTypeImpl(
      id: json['id'] as String? ?? UNKNOWN,
      createdAt: json['created_at'] as String? ?? UNKNOWN,
      updatedAt: json['updated_at'] as String? ?? UNKNOWN,
      active: json['active'] as bool? ?? false,
      host: json['host'] as String? ?? UNKNOWN,
      name: json['name'] as String? ?? UNKNOWN,
      description: json['description'] as String? ?? UNKNOWN,
      pricingOption: json['pricing_option'] as String? ?? UNKNOWN,
      pricingOptionName: json['pricing_option_name'] as String? ?? UNKNOWN,
      pricingOptionType: json['pricing_option_type'] as String? ?? UNKNOWN,
    );

Map<String, dynamic> _$$TicketTypeImplToJson(_$TicketTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'active': instance.active,
      'host': instance.host,
      'name': instance.name,
      'description': instance.description,
      'pricing_option': instance.pricingOption,
      'pricing_option_name': instance.pricingOptionName,
      'pricing_option_type': instance.pricingOptionType,
    };
