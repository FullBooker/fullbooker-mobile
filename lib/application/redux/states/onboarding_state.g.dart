// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OnboardingStateImpl _$$OnboardingStateImplFromJson(
        Map<String, dynamic> json) =>
    _$OnboardingStateImpl(
      signInMethod:
          $enumDecodeNullable(_$SignInMethodEnumMap, json['signInMethod']) ??
              SignInMethod.EMAIL,
      emailAddress: json['emailAddress'] as String? ?? UNKNOWN,
      password: json['password'] as String? ?? UNKNOWN,
      invalidCredentials: json['invalidCredentials'] as bool? ?? false,
      hidePassword: json['hidePassword'] as bool? ?? true,
      firstName: json['firstName'] as String? ?? UNKNOWN,
      lastName: json['lastName'] as String? ?? UNKNOWN,
      newEmailAddress: json['newEmailAddress'] as String? ?? UNKNOWN,
      phoneNumber: json['phoneNumber'] as String? ?? UNKNOWN,
      newPassword: json['newPassword'] as String? ?? UNKNOWN,
      hideNewPassword: json['hideNewPassword'] as bool? ?? true,
      newConfirmPassword: json['newConfirmPassword'] as String? ?? UNKNOWN,
      hideNewConfirmPassword: json['hideNewConfirmPassword'] as bool? ?? true,
      invalidOTP: json['invalidOTP'] as bool? ?? false,
      resetEmailAddress: json['resetEmailAddress'] as String? ?? UNKNOWN,
      resetPasswordOTP: json['resetPasswordOTP'] as String? ?? UNKNOWN,
      resetPasswordDebugOTP:
          json['resetPasswordDebugOTP'] as String? ?? UNKNOWN,
      resetPassword: json['resetPassword'] as String? ?? UNKNOWN,
      resetPasswordConfirm: json['resetPasswordConfirm'] as String? ?? UNKNOWN,
      hideResetPassword: json['hideResetPassword'] as bool? ?? true,
      hideResetConfirmPassword:
          json['hideResetConfirmPassword'] as bool? ?? true,
    );

Map<String, dynamic> _$$OnboardingStateImplToJson(
        _$OnboardingStateImpl instance) =>
    <String, dynamic>{
      'signInMethod': _$SignInMethodEnumMap[instance.signInMethod]!,
      'emailAddress': instance.emailAddress,
      'password': instance.password,
      'invalidCredentials': instance.invalidCredentials,
      'hidePassword': instance.hidePassword,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'newEmailAddress': instance.newEmailAddress,
      'phoneNumber': instance.phoneNumber,
      'newPassword': instance.newPassword,
      'hideNewPassword': instance.hideNewPassword,
      'newConfirmPassword': instance.newConfirmPassword,
      'hideNewConfirmPassword': instance.hideNewConfirmPassword,
      'invalidOTP': instance.invalidOTP,
      'resetEmailAddress': instance.resetEmailAddress,
      'resetPasswordOTP': instance.resetPasswordOTP,
      'resetPasswordDebugOTP': instance.resetPasswordDebugOTP,
      'resetPassword': instance.resetPassword,
      'resetPasswordConfirm': instance.resetPasswordConfirm,
      'hideResetPassword': instance.hideResetPassword,
      'hideResetConfirmPassword': instance.hideResetConfirmPassword,
    };

const _$SignInMethodEnumMap = {
  SignInMethod.EMAIL: 'EMAIL',
  SignInMethod.GOOGLE: 'GOOGLE',
};
