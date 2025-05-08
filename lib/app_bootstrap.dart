import 'dart:async';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fullbooker/app_entry_point.dart';
import 'package:fullbooker/application/core/services/analytics_service.dart';
import 'package:fullbooker/application/core/services/sentry_service.dart';
import 'package:fullbooker/application/redux/observers/custom_observer.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/global_keys.dart';
import 'package:fullbooker/firebase_options.dart';
import 'package:fullbooker/infrastructure/repository/state_persistor.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> appBootStrap() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    const String appEnv = String.fromEnvironment('ENV');

    final AppConfig appConfig = getAppConfig(appEnv);

    // Force portrait orientation on devices
    await SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp],
    );

    final StateDatabase stateDB =
        StateDatabase(dataBaseName: appConfig.databaseName);

    await stateDB.init();

    final AppState initialState = await stateDB.readState();

    if (initialState == AppState.initial()) {
      await stateDB.saveInitialState(initialState);
    }

    final Store<AppState> store = Store<AppState>(
      initialState: initialState,
      defaultDistinct: true,
      persistor: PersistorPrinterDecorator<AppState>(stateDB),
      actionObservers: <ActionObserver<AppState>>[CustomActionObserver()],
    );

    GetIt.I.registerSingleton<AppConfig>(appConfig);
    GetIt.I.registerSingleton<GoogleSignIn>(GoogleSignIn());

    await Firebase.initializeApp(
      name: appConfig.applicationName,
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await AnalyticsService().init(environment: appConfig.environment);

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    NavigateAction.setNavigatorKey(appGlobalNavigatorKey);

    SentryService().init(
      dsn: appConfig.sentryDsn,
      environment: appConfig.environment,
      appRunner: () => runApp(
        AppEntryPoint(
          appStore: store,
          appName: appConfig.applicationName,
        ),
      ),
    );
  }, (Object error, StackTrace stack) async {
    FirebaseCrashlytics.instance.recordError(error, stack);
    await SentryService().reportError(
      hint: fatalPlatformError,
      exception: error,
    );
  });
}
