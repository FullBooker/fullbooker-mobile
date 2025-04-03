// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductCategoryResponseImpl _$$ProductCategoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductCategoryResponseImpl(
      count: (json['count'] as num?)?.toInt() ?? 0,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ProductCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductCategoryResponseImplToJson(
        _$ProductCategoryResponseImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };
