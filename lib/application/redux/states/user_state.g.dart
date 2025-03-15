// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStateImpl _$$UserStateImplFromJson(Map<String, dynamic> json) =>
    _$UserStateImpl(
      firstName: json['first_name'] as String? ?? UNKNOWN,
      lastName: json['last_name'] as String? ?? UNKNOWN,
      emailAddress: json['email'] as String? ?? UNKNOWN,
      phoneNumber: json['phone_number'] as String? ?? UNKNOWN,
    );

Map<String, dynamic> _$$UserStateImplToJson(_$UserStateImpl instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.emailAddress,
      'phone_number': instance.phoneNumber,
    };
