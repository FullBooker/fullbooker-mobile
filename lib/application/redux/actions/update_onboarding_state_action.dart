import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';

class UpdateOnboardingStateAction extends ReduxAction<AppState> {
  UpdateOnboardingStateAction({this.emailAddress, this.password});

  final String? emailAddress;
  final String? password;

  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.onboardingState?.call(
      emailAddress: emailAddress ?? state.onboardingState!.emailAddress,
      password: password ?? state.onboardingState!.password,
    );

    return newState;
  }
}
