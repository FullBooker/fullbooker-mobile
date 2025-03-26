import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';

class HostingHomeViewModel extends Vm {
  HostingHomeViewModel({
    required this.emailAddress,
    required this.password,
    required this.hidePassword,
  }) : super(equals: <Object?>[emailAddress, password, hidePassword]);

  final String? emailAddress;
  final String? password;
  final bool hidePassword;

  static HostingHomeViewModel fromState(AppState state) {
    return HostingHomeViewModel(
      emailAddress: state.onboardingState?.emailAddress,
      password: state.onboardingState?.password,
      hidePassword: state.onboardingState!.hidePassword,
    );
  }
}
