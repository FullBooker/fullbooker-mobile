import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';

class ResetPasswordViewModel extends Vm {
  ResetPasswordViewModel({
    required this.resetEmailAddress,
    required this.password,
    required this.hideResetPassword,
    required this.hideResetConfirmPassword,
  }) : super(
          equals: <Object?>[
            resetEmailAddress,
            password,
            hideResetPassword,
            hideResetConfirmPassword,
          ],
        );

  final String resetEmailAddress;
  final String? password;
  final bool hideResetPassword;
  final bool hideResetConfirmPassword;

  static ResetPasswordViewModel fromState(AppState state) {
    return ResetPasswordViewModel(
      resetEmailAddress: state.onboardingState?.resetEmailAddress ?? '',
      password: state.onboardingState?.password,
      hideResetPassword: state.onboardingState!.hideResetPassword,
      hideResetConfirmPassword: state.onboardingState!.hideResetConfirmPassword,
    );
  }
}
