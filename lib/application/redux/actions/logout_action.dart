// Dart imports:
import 'dart:async';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogoutAction extends ReduxAction<AppState> {
  LogoutAction({this.onDone});

  final VoidCallback? onDone;

  @override
  Future<AppState?> reduce() async {
    final SignInMethod? signInMethod = state.onboardingState?.signInMethod;

    if (signInMethod == SignInMethod.GOOGLE) {
      await GetIt.I.get<GoogleSignIn>().signOut();
    }

    onDone?.call();
    return AppState.initial();
  }
}
