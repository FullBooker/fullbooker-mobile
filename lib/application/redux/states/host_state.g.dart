// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HostStateImpl _$$HostStateImplFromJson(Map<String, dynamic> json) =>
    _$HostStateImpl(
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : Product.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Product>[],
      currentProduct: json['currentProduct'] == null
          ? null
          : Product.fromJson(json['currentProduct'] as Map<String, dynamic>),
      selectedProduct: json['selectedProduct'] == null
          ? null
          : Product.fromJson(json['selectedProduct'] as Map<String, dynamic>),
      productCategories: (json['productCategories'] as List<dynamic>?)
              ?.map((e) => ProductCategory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductCategory>[],
      locationPerms: json['locationPerms'] == null
          ? null
          : LocationPermsResult.fromJson(
              json['locationPerms'] as Map<String, dynamic>),
      draftProductMedia: (json['draftProductMedia'] as List<dynamic>?)
              ?.map((e) => ProductMedia.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductMedia>[],
    );

Map<String, dynamic> _$$HostStateImplToJson(_$HostStateImpl instance) =>
    <String, dynamic>{
      'products': instance.products?.map((e) => e?.toJson()).toList(),
      'currentProduct': instance.currentProduct?.toJson(),
      'selectedProduct': instance.selectedProduct?.toJson(),
      'productCategories':
          instance.productCategories?.map((e) => e.toJson()).toList(),
      'locationPerms': instance.locationPerms?.toJson(),
      'draftProductMedia':
          instance.draftProductMedia?.map((e) => e.toJson()).toList(),
    };
