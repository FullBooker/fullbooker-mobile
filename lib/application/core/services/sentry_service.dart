import 'dart:async';

import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:http/http.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SentryService {
  factory SentryService() => _instance;

  SentryService._();

  static final SentryService _instance = SentryService._();

  Future<void> init({
    required String dsn,
    required String environment,
    bool enableNativeCrashHandling = true,
    double tracesSampleRate = 1.0,
    required FutureOr<void> Function()? appRunner,
  }) async {
    await SentryFlutter.init(
      (SentryFlutterOptions options) {
        options
          ..dsn = dsn
          ..environment = environment
          ..enableNativeCrashHandling = enableNativeCrashHandling
          ..tracesSampleRate = tracesSampleRate;
      },
      appRunner: appRunner,
    );
  }

  /// Reports an error to Sentry, adding metadata to a Context called `"custom"`.
  Future<SentryId> reportError({
    required String hint,
    AppState? state,
    Response? response,
    String? route,
    Object? exception,
    StackTrace? stackTrace,
    Map<String, dynamic>? variables,
    String? userEmailOverride,
  }) {
    final Map<String, Object?> extras = <String, Object?>{
      'hint': hint,
      if (route != null) 'route': route,
      if (variables != null) 'request_body': variables,
    };

    if (response != null) {
      extras.addAll(<String, Object?>{
        'http_url': response.request?.url.toString(),
        'params': variables ?? <String, dynamic>{},
        'http_body': response.body,
        'response_status': response.statusCode,
      });
    }

    final bool signedIn = state?.authState?.isSignedIn ?? false;

    if (signedIn) {
      extras['user_email'] = state!.userState?.emailAddress;
    }

    return Sentry.captureException(
      exception ?? '<no exception provided>',
      stackTrace: stackTrace,
      hint: Hint.withMap(extras),
      withScope: (Scope scope) {
        final String? email = extras['user_email'] as String?;
        if (email != null && email.isNotEmpty) {
          scope.setUser(SentryUser(email: email));
        }

        if (route != null) scope.setTag('route', route);

        scope.setContexts('custom', extras);
      },
    );
  }
}
