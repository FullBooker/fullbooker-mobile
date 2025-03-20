// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/states/user_state.dart';

class ProfileViewModel extends Vm {
  ProfileViewModel({
    required this.user,
  }) : super(equals: <dynamic>[user]);

  factory ProfileViewModel.fromStore(Store<AppState> store) {
    return ProfileViewModel(
      user: store.state.userState,
    );
  }

  final UserState? user;
}
