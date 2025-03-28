// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/states/user_state.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';

class ProfileViewModel extends Vm {
  ProfileViewModel({
    required this.user,
    required this.fullName,
  }) : super(equals: <dynamic>[user, fullName]);

  factory ProfileViewModel.fromStore(Store<AppState> store) {
    final String firstName = store.state.userState?.firstName ?? noName;
    final String lastName = store.state.userState?.lastName ?? noName;

    final String name = getFullName(firstName, lastName);

    return ProfileViewModel(
      user: store.state.userState,
      fullName: name,
    );
  }

  final UserState? user;
  final String fullName;
}
