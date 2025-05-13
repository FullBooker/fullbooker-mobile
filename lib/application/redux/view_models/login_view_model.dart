import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';

class LoginPageViewModel extends Vm {
  LoginPageViewModel({
    required this.emailAddress,
    required this.password,
    required this.hidePassword,
  }) : super(equals: <Object?>[emailAddress, password, hidePassword]);

  final String? emailAddress;
  final String? password;
  final bool hidePassword;

  static LoginPageViewModel fromStore(Store<AppState> store) {
    return LoginPageViewModel(
      emailAddress: store.state.onboardingState?.emailAddress,
      password: store.state.onboardingState?.password,
      hidePassword: store.state.onboardingState!.hidePassword,
    );
  }
}
