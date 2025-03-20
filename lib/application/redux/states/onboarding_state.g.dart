// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OnboardingStateImpl _$$OnboardingStateImplFromJson(
        Map<String, dynamic> json) =>
    _$OnboardingStateImpl(
      emailAddress: json['emailAddress'] as String? ?? UNKNOWN,
      password: json['password'] as String? ?? UNKNOWN,
      invalidCredentials: json['invalidCredentials'] as bool? ?? false,
      hidePassword: json['hidePassword'] as bool? ?? true,
      invalidOTP: json['invalidOTP'] as bool? ?? false,
    );

Map<String, dynamic> _$$OnboardingStateImplToJson(
        _$OnboardingStateImpl instance) =>
    <String, dynamic>{
      'emailAddress': instance.emailAddress,
      'password': instance.password,
      'invalidCredentials': instance.invalidCredentials,
      'hidePassword': instance.hidePassword,
      'invalidOTP': instance.invalidOTP,
    };
