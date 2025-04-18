// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_pricing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductPricingImpl _$$ProductPricingImplFromJson(Map<String, dynamic> json) =>
    _$ProductPricingImpl(
      id: json['id'] as String? ?? UNKNOWN,
      createdAt: json['created_at'] as String? ?? UNKNOWN,
      updatedAt: json['updated_at'] as String? ?? UNKNOWN,
      active: json['active'] as bool? ?? false,
      host: json['host'] as String? ?? UNKNOWN,
      name: json['name'] as String? ?? UNKNOWN,
      product: json['product'] as String? ?? UNKNOWN,
      currency: json['currency'] as String? ?? UNKNOWN,
      cost: json['cost'] as String? ?? UNKNOWN,
      type: json['type'] as String? ?? 'ticket',
      ticketTier: json['ticket_tier'] as String? ?? standardTier,
      maxTickets: (json['maximum_number_of_tickets'] as num?)?.toInt() ?? 0,
      remainingTickets: (json['remaining_tickets'] as num?)?.toInt() ?? 0,
      soldTickets: (json['sold_tickets'] as num?)?.toInt() ?? 0,
      buyerPaysFee: json['buyerPaysFee'] as bool? ?? true,
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
      'buyerPaysFee': instance.buyerPaysFee,
    };
