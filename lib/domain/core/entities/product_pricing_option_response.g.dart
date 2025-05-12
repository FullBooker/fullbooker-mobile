// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_pricing_option_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductPricingOptionResponseImpl _$$ProductPricingOptionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductPricingOptionResponseImpl(
      count: (json['count'] as num?)?.toInt() ?? 0,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ProductPricingOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductPricingOptionResponseImplToJson(
        _$ProductPricingOptionResponseImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results?.map((e) => e?.toJson()).toList(),
    };
