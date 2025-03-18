// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthCredentialsImpl _$$AuthCredentialsImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthCredentialsImpl(
      accessToken: json['access'] as String? ?? UNKNOWN,
      refreshToken: json['refresh'] as String? ?? UNKNOWN,
      expiresAt: json['expires_at'] as String? ?? UNKNOWN,
      expiresIn: json['expires_in'] as String? ?? kDefaultTokenExpiry,
    );

Map<String, dynamic> _$$AuthCredentialsImplToJson(
        _$AuthCredentialsImpl instance) =>
    <String, dynamic>{
      'access': instance.accessToken,
      'refresh': instance.refreshToken,
      'expires_at': instance.expiresAt,
      'expires_in': instance.expiresIn,
    };
