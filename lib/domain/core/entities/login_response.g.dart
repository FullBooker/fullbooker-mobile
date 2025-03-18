// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      accessToken: json['access'] as String? ?? UNKNOWN,
      refreshToken: json['refresh'] as String? ?? UNKNOWN,
      expiresAt: json['expires_at'] as String? ?? UNKNOWN,
      user: json['user'] == null
          ? null
          : UserState.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'access': instance.accessToken,
      'refresh': instance.refreshToken,
      'expires_at': instance.expiresAt,
      'user': instance.user?.toJson(),
    };
