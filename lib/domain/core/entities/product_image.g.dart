// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImageImpl _$$ProductImageImplFromJson(Map<String, dynamic> json) =>
    _$ProductImageImpl(
      id: json['id'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      active: json['active'] as bool,
      host: json['host'] as String,
      mediaType: json['media_type'] as String,
      file: json['file'] as String,
      uploadedAt: json['uploaded_at'] as String,
    );

Map<String, dynamic> _$$ProductImageImplToJson(_$ProductImageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'active': instance.active,
      'host': instance.host,
      'media_type': instance.mediaType,
      'file': instance.file,
      'uploaded_at': instance.uploadedAt,
    };
