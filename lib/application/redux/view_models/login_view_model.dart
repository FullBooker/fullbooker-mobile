import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';

class LoginPageViewModel extends Vm {
  LoginPageViewModel({
    required this.emailAddress,
    required this.password,
  }) : super(equals: <Object?>[emailAddress, password]);

  final String? emailAddress;
  final String? password;

  static LoginPageViewModel fromState(AppState state) {
    return LoginPageViewModel(
      emailAddress: state.onboardingState?.emailAddress,
      password: state.onboardingState?.password,
    );
  }
}
