// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/shared/entities/enums.dart';

part 'onboarding_state.freezed.dart';
part 'onboarding_state.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class OnboardingState with _$OnboardingState {
  @JsonSerializable(explicitToJson: true)
  const factory OnboardingState({
    @Default(SignInMethod.EMAIL) SignInMethod signInMethod,
    @Default(UNKNOWN) String emailAddress,
    @Default(UNKNOWN) String password,

    /// LOGIN VALUES
    @Default(false) bool invalidCredentials,
    @Default(true) bool hidePassword,

    /// CREATE ACCOUNT VALUES
    @Default(UNKNOWN) String firstName,
    @Default(UNKNOWN) String lastName,
    @Default(UNKNOWN) String newEmailAddress,
    @Default(UNKNOWN) String phoneNumber,
    @Default(UNKNOWN) String newPassword,
    @Default(true) bool hideNewPassword,
    @Default(UNKNOWN) String newConfirmPassword,
    @Default(true) bool hideNewConfirmPassword,

    /// RESET PASSWORD VALUES
    @Default(false) bool invalidOTP,
    @Default(UNKNOWN) String resetEmailAddress,
    @Default(UNKNOWN) String resetPasswordOTP,
    @Default(UNKNOWN) String resetPasswordDebugOTP,
    @Default(UNKNOWN) String resetPassword,
    @Default(UNKNOWN) String resetPasswordConfirm,
    @Default(true) bool hideResetPassword,
    @Default(true) bool hideResetConfirmPassword,

    /// WORKFLOW BOOLS
  }) = _OnboardingState;

  factory OnboardingState.initial() => const OnboardingState();

  factory OnboardingState.fromJson(Map<String, dynamic> json) =>
      _$OnboardingStateFromJson(json);
}
