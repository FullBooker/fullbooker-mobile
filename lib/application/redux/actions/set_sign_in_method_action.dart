import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/shared/entities/enums.dart';

class SetSignInMethodAction extends ReduxAction<AppState> {
  SetSignInMethodAction({this.signInMethod});

  SignInMethod? signInMethod;

  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.onboardingState?.call(
      signInMethod: signInMethod ?? state.onboardingState!.signInMethod,
    );

    return newState;
  }
}
