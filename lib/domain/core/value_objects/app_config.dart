import 'package:fullbooker/shared/entities/enums.dart';

class AppConfig {
  AppConfig({
    required this.appContext,
    required this.applicationName,
    required this.sentryDsn,
    required this.databaseName,
    required this.environment,
  });

  /// The context the app is running in
  final AppContext appContext;

  /// The name of the application
  final String applicationName;

  /// The Sentry DSN (Data Source Name) for error reporting
  final String sentryDsn;

  // Local DB name
  final String databaseName;

  /// The environment (e.g., 'dev', 'prod')
  final String environment;
}
