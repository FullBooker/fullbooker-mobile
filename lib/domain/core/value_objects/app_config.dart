import 'package:fullbooker/shared/entities/enums.dart';

class AppConfig {
  AppConfig({
    required this.appContext,
    required this.applicationName,
    required this.sentryDsn,
    required this.databaseName,
    required this.environment,
    required this.loginEndpoint,
    required this.createAccountEndpoint,
    required this.googleSignInEndpoint,
    required this.requestOTPEndpoint,
  });

  /// The context the app is running in
  final AppContext appContext;

  /// The name of the application
  final String applicationName;

  /// The Sentry DSN (Data Source Name) for error reporting
  final String sentryDsn;

  // Local DB name
  final String databaseName;

  /// The environment ('dev', 'prod')
  final String environment;

  /// App endpoints
  final String loginEndpoint;
  final String createAccountEndpoint;
  final String googleSignInEndpoint;
  final String requestOTPEndpoint;

  // ---- Implemented
  // TODO(abiud): add the rest of the endpoints
}
