import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/states/user_state.dart';

class UpdateUserStateAction extends ReduxAction<AppState> {
  UpdateUserStateAction({
    this.user,
  });

  final UserState? user;

  @override
  AppState? reduce() {
    final AppState newState = state.copyWith.call(
      userState: user ?? state.userState,
    );

    return newState;
  }
}
