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
    this.newEmailAddress,
    this.newPassword,
    this.hideNewPassword,
    this.newConfirmPassword,
    this.hideNewConfirmPassword,
    this.resetPasswordOTP,
  });

  // Login
  final String? emailAddress;
  final String? password;
  final bool? hidePassword;

  // Create account
  final String? firstName;
  final String? lastName;
  final String? newEmailAddress;
  final String? newPassword;
  final bool? hideNewPassword;
  final String? newConfirmPassword;
  final bool? hideNewConfirmPassword;

  // Reset password
  final String? resetPasswordOTP;

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
    );

    return newState;
  }
}
