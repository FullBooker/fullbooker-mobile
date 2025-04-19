// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as String? ?? UNKNOWN,
      createdAt: json['created_at'] as String? ?? UNKNOWN,
      updatedAt: json['updated_at'] as String? ?? UNKNOWN,
      active: json['active'] as bool? ?? false,
      host: json['host'] == null
          ? null
          : UserState.fromJson(json['host'] as Map<String, dynamic>),
      name: json['name'] as String? ?? UNKNOWN,
      description: json['description'] as String? ?? UNKNOWN,
      number: json['number'] as String? ?? UNKNOWN,
      category: json['category'] as String? ?? UNKNOWN,
      subcategory: json['subcategory'] as String? ?? UNKNOWN,
      scheduleID: json['schedule'] as String? ?? UNKNOWN,
      schedule: json['new_schedule'] == null
          ? null
          : ProductSchedule.fromJson(
              json['new_schedule'] as Map<String, dynamic>),
      pricing: (json['pricing'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : ProductPricing.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductPricing>[],
      image: json['image'] == null
          ? null
          : ProductMedia.fromJson(json['image'] as Map<String, dynamic>),
      video: json['video'] == null
          ? null
          : ProductMedia.fromJson(json['video'] as Map<String, dynamic>),
      locations: (json['locations'] as List<dynamic>?)
              ?.map((e) => ProductLocation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductLocation>[],
      completed: json['completed'] as bool? ?? false,
      productMedia: (json['productMedia'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : ProductMedia.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductMedia>[],
      bookings: (json['bookings'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : Booking.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Booking>[],
      selectedProductCategory: json['selectedProductCategory'] == null
          ? null
          : ProductCategory.fromJson(
              json['selectedProductCategory'] as Map<String, dynamic>),
      selectedProductSubCategory: json['selectedProductSubCategory'] == null
          ? null
          : ProductCategory.fromJson(
              json['selectedProductSubCategory'] as Map<String, dynamic>),
      stats: json['stats'] == null
          ? null
          : ProductStats.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'active': instance.active,
      'host': instance.host?.toJson(),
      'name': instance.name,
      'description': instance.description,
      'number': instance.number,
      'category': instance.category,
      'subcategory': instance.subcategory,
      'schedule': instance.scheduleID,
      'new_schedule': instance.schedule?.toJson(),
      'pricing': instance.pricing?.map((e) => e?.toJson()).toList(),
      'image': instance.image?.toJson(),
      'video': instance.video?.toJson(),
      'locations': instance.locations?.map((e) => e.toJson()).toList(),
      'completed': instance.completed,
      'productMedia': instance.productMedia?.map((e) => e?.toJson()).toList(),
      'bookings': instance.bookings?.map((e) => e?.toJson()).toList(),
      'selectedProductCategory': instance.selectedProductCategory?.toJson(),
      'selectedProductSubCategory':
          instance.selectedProductSubCategory?.toJson(),
      'stats': instance.stats?.toJson(),
    };
