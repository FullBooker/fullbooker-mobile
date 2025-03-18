// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStateImpl _$$UserStateImplFromJson(Map<String, dynamic> json) =>
    _$UserStateImpl(
      userID: json['id'] as String? ?? UNKNOWN,
      phoneNumber: json['phone_number'] as String? ?? UNKNOWN,
      emailAddress: json['email'] as String? ?? UNKNOWN,
      firstName: json['first_name'] as String? ?? UNKNOWN,
      lastName: json['last_name'] as String? ?? UNKNOWN,
      active: json['is_active'] as bool? ?? false,
      isHost: json['is_host'] as bool? ?? false,
      profileURL: json['image'] as String? ?? UNKNOWN,
    );

Map<String, dynamic> _$$UserStateImplToJson(_$UserStateImpl instance) =>
    <String, dynamic>{
      'id': instance.userID,
      'phone_number': instance.phoneNumber,
      'email': instance.emailAddress,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'is_active': instance.active,
      'is_host': instance.isHost,
      'image': instance.profileURL,
    };
