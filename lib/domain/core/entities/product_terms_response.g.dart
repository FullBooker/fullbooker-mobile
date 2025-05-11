// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_terms_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductTermsResponseImpl _$$ProductTermsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductTermsResponseImpl(
      id: json['id'] as String? ?? UNKNOWN,
      createdAt: json['created_at'] as String? ?? UNKNOWN,
      updatedAt: json['updated_at'] as String? ?? UNKNOWN,
      active: json['active'] as bool? ?? false,
      host: json['host'] as String? ?? UNKNOWN,
      product: json['product'] as String? ?? UNKNOWN,
      accepted: json['accepted'] as bool? ?? false,
      acceptedAt: json['accepted_at'] as String? ?? UNKNOWN,
      termsUrl: json['terms_url'] as String? ?? UNKNOWN,
    );

Map<String, dynamic> _$$ProductTermsResponseImplToJson(
        _$ProductTermsResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'active': instance.active,
      'host': instance.host,
      'product': instance.product,
      'accepted': instance.accepted,
      'accepted_at': instance.acceptedAt,
      'terms_url': instance.termsUrl,
    };
