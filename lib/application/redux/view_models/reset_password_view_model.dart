import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';

class ResetPasswordViewModel extends Vm {
  ResetPasswordViewModel({
    required this.resetEmailAddress,
    required this.password,
    required this.hidePassword,
  }) : super(equals: <Object?>[resetEmailAddress, password, hidePassword]);

  final String resetEmailAddress;
  final String? password;
  final bool hidePassword;

  static ResetPasswordViewModel fromState(AppState state) {
    return ResetPasswordViewModel(
      resetEmailAddress: state.onboardingState?.resetEmailAddress ?? '',
      password: state.onboardingState?.password,
      hidePassword: state.onboardingState!.hidePassword,
    );
  }
}
