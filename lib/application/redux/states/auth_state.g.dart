// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthStateImpl _$$AuthStateImplFromJson(Map<String, dynamic> json) =>
    _$AuthStateImpl(
      isSignedIn: json['isSignedIn'] as bool? ?? false,
      idToken: json['idToken'] as String? ?? UNKNOWN,
      authCredentials: json['authCredentials'] == null
          ? null
          : AuthCredentials.fromJson(
              json['authCredentials'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AuthStateImplToJson(_$AuthStateImpl instance) =>
    <String, dynamic>{
      'isSignedIn': instance.isSignedIn,
      'idToken': instance.idToken,
      'authCredentials': instance.authCredentials?.toJson(),
    };
