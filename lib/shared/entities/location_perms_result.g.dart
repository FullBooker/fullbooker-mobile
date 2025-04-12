// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_perms_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationPermsResultImpl _$$LocationPermsResultImplFromJson(
        Map<String, dynamic> json) =>
    _$LocationPermsResultImpl(
      denied: json['denied'] as bool? ?? false,
      deniedForever: json['deniedForever'] as bool? ?? false,
    );

Map<String, dynamic> _$$LocationPermsResultImplToJson(
        _$LocationPermsResultImpl instance) =>
    <String, dynamic>{
      'denied': instance.denied,
      'deniedForever': instance.deniedForever,
    };
