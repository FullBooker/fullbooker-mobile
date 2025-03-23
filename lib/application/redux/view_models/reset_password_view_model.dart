import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';

class ResetPasswordViewModel extends Vm {
  ResetPasswordViewModel({
    required this.resetEmailAddress,
    required this.password,
    required this.hideResetPassword,
    required this.hideResetConfirmPassword,
    required this.resetPasswordOTP,
    required this.resetPasswordDebugOTP,
  }) : super(
          equals: <Object?>[
            resetEmailAddress,
            password,
            hideResetPassword,
            hideResetConfirmPassword,
            resetPasswordOTP,
            resetPasswordDebugOTP,
          ],
        );

  final String resetEmailAddress;
  final String? password;
  final bool hideResetPassword;
  final bool hideResetConfirmPassword;
  final String resetPasswordOTP;
  final String resetPasswordDebugOTP;

  static ResetPasswordViewModel fromState(AppState state) {
    return ResetPasswordViewModel(
      resetEmailAddress: state.onboardingState?.resetEmailAddress ?? '',
      password: state.onboardingState?.password,
      hideResetPassword: state.onboardingState!.hideResetPassword,
      hideResetConfirmPassword: state.onboardingState!.hideResetConfirmPassword,
      resetPasswordOTP: state.onboardingState!.resetPasswordOTP,
      resetPasswordDebugOTP: state.onboardingState!.resetPasswordDebugOTP,
    );
  }
}
