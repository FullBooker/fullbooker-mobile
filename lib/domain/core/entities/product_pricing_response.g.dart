// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_pricing_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductPricingResponseImpl _$$ProductPricingResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductPricingResponseImpl(
      count: (json['count'] as num?)?.toInt() ?? 0,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ProductPricing.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductPricingResponseImplToJson(
        _$ProductPricingResponseImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results?.map((e) => e?.toJson()).toList(),
    };
