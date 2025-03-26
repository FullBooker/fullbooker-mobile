// Dart imports:
import 'dart:async';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogoutAction extends ReduxAction<AppState> {
  LogoutAction({this.onDone});

  final Function()? onDone;

  @override
  Future<AppState?> reduce() async {
    final GoogleSignIn googleSignIn = GetIt.I.get<GoogleSignIn>();

    try {
      await googleSignIn.signOut();
    } catch (e) {
      onDone?.call();
      return AppState.initial();
    }

    onDone?.call();
    return AppState.initial();
  }
}
