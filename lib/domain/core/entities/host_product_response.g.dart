// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HostProductResponseImpl _$$HostProductResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$HostProductResponseImpl(
      count: (json['count'] as num?)?.toInt() ?? 0,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: productsFromApiJson(json['results'] as List?),
    );

Map<String, dynamic> _$$HostProductResponseImplToJson(
        _$HostProductResponseImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results?.map((e) => e?.toJson()).toList(),
    };
