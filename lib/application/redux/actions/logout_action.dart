// Dart imports:
import 'dart:async';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/sentry_service.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogoutAction extends ReduxAction<AppState> {
  LogoutAction({this.onDone});

  final VoidCallback? onDone;

  @override
  Future<AppState?> reduce() async {
    try {
      final SignInMethod? signInMethod = state.onboardingState?.signInMethod;

      if (signInMethod == SignInMethod.GOOGLE) {
        final GoogleSignIn googleSignIn = GetIt.I.get<GoogleSignIn>();
        if (await googleSignIn.isSignedIn()) {
          await googleSignIn.signOut();
        }
      }
    } catch (e) {
      await SentryService().reportError(
        hint: signOutFailed,
        state: state,
        stackTrace: StackTrace.fromString(signOutFailed),
      );
    } finally {
      onDone?.call();
    }

    return AppState.initial();
  }
}
