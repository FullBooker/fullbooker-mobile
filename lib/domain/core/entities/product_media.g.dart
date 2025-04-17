// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductMediaImpl _$$ProductMediaImplFromJson(Map<String, dynamic> json) =>
    _$ProductMediaImpl(
      id: json['id'] as String? ?? UNKNOWN,
      createdAt: json['created_at'] as String? ?? UNKNOWN,
      updatedAt: json['updated_at'] as String? ?? UNKNOWN,
      active: json['active'] as bool? ?? false,
      host: json['host'] as String? ?? UNKNOWN,
      mediaType: json['media_type'] as String? ?? UNKNOWN,
      file: json['file'] as String? ?? UNKNOWN,
      uploadedAt: json['uploaded_at'] as String? ?? UNKNOWN,
    );

Map<String, dynamic> _$$ProductMediaImplToJson(_$ProductMediaImpl instance) =>
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
