// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OnboardingStateImpl _$$OnboardingStateImplFromJson(
        Map<String, dynamic> json) =>
    _$OnboardingStateImpl(
      emailAddress: json['emailAddress'] as String? ?? '',
      password: json['password'] as String? ?? '',
      invalidCredentials: json['invalidCredentials'] as bool? ?? false,
      invalidOTP: json['invalidOTP'] as bool? ?? false,
    );

Map<String, dynamic> _$$OnboardingStateImplToJson(
        _$OnboardingStateImpl instance) =>
    <String, dynamic>{
      'emailAddress': instance.emailAddress,
      'password': instance.password,
      'invalidCredentials': instance.invalidCredentials,
      'invalidOTP': instance.invalidOTP,
    };
