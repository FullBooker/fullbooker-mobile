// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_pricing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductPricingImpl _$$ProductPricingImplFromJson(Map<String, dynamic> json) =>
    _$ProductPricingImpl(
      id: json['id'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      active: json['active'] as bool,
      host: json['host'] as String,
      name: json['name'] as String?,
      product: json['product'] as String,
      currency: json['currency'] as String,
      cost: json['cost'] as String,
      type: json['type'] as String,
      ticketTier: json['ticket_tier'] as String,
      maxTickets: (json['maximum_number_of_tickets'] as num).toInt(),
      remainingTickets: (json['remaining_tickets'] as num).toInt(),
      soldTickets: (json['sold_tickets'] as num).toInt(),
    );

Map<String, dynamic> _$$ProductPricingImplToJson(
        _$ProductPricingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'active': instance.active,
      'host': instance.host,
      'name': instance.name,
      'product': instance.product,
      'currency': instance.currency,
      'cost': instance.cost,
      'type': instance.type,
      'ticket_tier': instance.ticketTier,
      'maximum_number_of_tickets': instance.maxTickets,
      'remaining_tickets': instance.remainingTickets,
      'sold_tickets': instance.soldTickets,
    };
