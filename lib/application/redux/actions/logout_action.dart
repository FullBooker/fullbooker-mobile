// Dart imports:
import 'dart:async';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';

class LogoutAction extends ReduxAction<AppState> {
  LogoutAction({this.onDone});

  final Function()? onDone;

  @override
  Future<AppState?> reduce() async {
    return AppState.initial();
  }
}
