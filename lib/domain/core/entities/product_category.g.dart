// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductCategoryImpl _$$ProductCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductCategoryImpl(
      id: json['id'] as String? ?? UNKNOWN,
      createdAt: json['created_at'] as String? ?? UNKNOWN,
      updatedAt: json['updated_at'] as String? ?? UNKNOWN,
      active: json['active'] as bool? ?? false,
      name: json['name'] as String? ?? UNKNOWN,
      description: json['description'] as String? ?? UNKNOWN,
      category: json['category'] as String? ?? UNKNOWN,
      parent: json['parent'] as String? ?? UNKNOWN,
      subcategories: (json['children'] as List<dynamic>?)
          ?.map((e) => ProductCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ProductCategoryImplToJson(
        _$ProductCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'active': instance.active,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'parent': instance.parent,
      'children': instance.subcategories?.map((e) => e.toJson()).toList(),
      'tags': instance.tags,
    };
