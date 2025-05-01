// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_option_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PricingOptionResponseImpl _$$PricingOptionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PricingOptionResponseImpl(
      count: (json['count'] as num?)?.toInt() ?? 0,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PricingOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PricingOptionResponseImplToJson(
        _$PricingOptionResponseImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results?.map((e) => e?.toJson()).toList(),
    };
