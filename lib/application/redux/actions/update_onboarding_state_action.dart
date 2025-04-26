import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';

class UpdateOnboardingStateAction extends ReduxAction<AppState> {
  UpdateOnboardingStateAction({
    // Login
    this.emailAddress,
    this.password,
    this.hidePassword,

    // Create account
    this.firstName,
    this.lastName,
    this.newPhone,
    this.newEmailAddress,
    this.newPassword,
    this.hideNewPassword,
    this.newConfirmPassword,
    this.hideNewConfirmPassword,

    // Reset password
    this.resetPasswordOTP,
    this.resetEmailAddress,
    this.hideResetPassword,
    this.hideResetConfirmPassword,
    this.resetPasswordDebugOTP,
    this.resetPassword,
    this.resetPasswordConfirm,

    // Update password
    this.currentPassword,
    this.changePassword,
    this.changePasswordConfirm,
    this.hideCurrentPassword,
    this.hideChangePassword,
    this.hideChangeConfirmPassword,
  });

  // Login
  final String? emailAddress;
  final String? password;
  final bool? hidePassword;

  // Create account
  final String? firstName;
  final String? lastName;
  final String? newPhone;
  final String? newEmailAddress;
  final String? newPassword;
  final bool? hideNewPassword;
  final String? newConfirmPassword;
  final bool? hideNewConfirmPassword;

  // Reset password
  final String? resetPasswordOTP;
  final String? resetPasswordDebugOTP;
  final String? resetEmailAddress;
  final bool? hideResetPassword;
  final bool? hideResetConfirmPassword;
  final String? resetPassword;
  final String? resetPasswordConfirm;

  // Update password
  final String? currentPassword;
  final String? changePassword;
  final String? changePasswordConfirm;
  final bool? hideCurrentPassword;
  final bool? hideChangePassword;
  final bool? hideChangeConfirmPassword;

  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.onboardingState?.call(
      // Login
      emailAddress: emailAddress ?? state.onboardingState!.emailAddress,
      password: password ?? state.onboardingState!.password,
      hidePassword: hidePassword ?? state.onboardingState!.hidePassword,

      // Create account
      firstName: firstName ?? state.onboardingState!.firstName,
      lastName: lastName ?? state.onboardingState!.lastName,
      newEmailAddress:
          newEmailAddress ?? state.onboardingState!.newEmailAddress,
      newPassword: newPassword ?? state.onboardingState!.newPassword,
      hideNewPassword:
          hideNewPassword ?? state.onboardingState!.hideNewPassword,
      newConfirmPassword:
          newConfirmPassword ?? state.onboardingState!.newConfirmPassword,
      hideNewConfirmPassword: hideNewConfirmPassword ??
          state.onboardingState!.hideNewConfirmPassword,
      resetPasswordOTP:
          resetPasswordOTP ?? state.onboardingState!.resetPasswordOTP,
      resetPasswordDebugOTP:
          resetPasswordDebugOTP ?? state.onboardingState!.resetPasswordDebugOTP,
      resetEmailAddress:
          resetEmailAddress ?? state.onboardingState!.resetEmailAddress,
      hideResetPassword:
          hideResetPassword ?? state.onboardingState!.hideResetPassword,
      hideResetConfirmPassword: hideResetConfirmPassword ??
          state.onboardingState!.hideResetConfirmPassword,
      resetPassword: resetPassword ?? state.onboardingState!.resetPassword,
      resetPasswordConfirm:
          resetPasswordConfirm ?? state.onboardingState!.resetPasswordConfirm,
      phoneNumber: newPhone ?? state.onboardingState!.phoneNumber,

      // Update password
      currentPassword:
          currentPassword ?? state.onboardingState!.currentPassword,
      changePassword: changePassword ?? state.onboardingState!.changePassword,
      changePasswordConfirm:
          changePasswordConfirm ?? state.onboardingState!.changePasswordConfirm,
      hideCurrentPassword:
          hideCurrentPassword ?? state.onboardingState!.hideCurrentPassword,
      hideChangePassword:
          hideChangePassword ?? state.onboardingState!.hideChangePassword,
      hideChangeConfirmPassword: hideChangeConfirmPassword ??
          state.onboardingState!.hideChangeConfirmPassword,
    );

    return newState;
  }
}
