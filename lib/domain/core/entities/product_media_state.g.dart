// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_media_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductMediaStateImpl _$$ProductMediaStateImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductMediaStateImpl(
      media: (json['media'] as List<dynamic>?)
              ?.map((e) => ProductImage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductImage>[],
    );

Map<String, dynamic> _$$ProductMediaStateImplToJson(
        _$ProductMediaStateImpl instance) =>
    <String, dynamic>{
      'media': instance.media.map((e) => e.toJson()).toList(),
    };
