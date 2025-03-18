import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/states/auth_state.dart';
import 'package:fullbooker/application/redux/states/bottom_nav_state.dart';
import 'package:fullbooker/application/redux/states/onboarding_state.dart';
import 'package:fullbooker/application/redux/states/user_state.dart';
import 'package:fullbooker/infrastructure/repository/database_base.dart';
import 'package:fullbooker/infrastructure/repository/database_mobile.dart';
import 'package:fullbooker/infrastructure/repository/initialize_db.dart';
import 'package:fullbooker/infrastructure/repository/tables.dart';
import 'package:sqflite/sqflite.dart';

class StateDatabase implements PersistorPrinterDecorator<AppState> {
  StateDatabase({
    Duration throttle = const Duration(seconds: 2),
    Duration saveDuration = Duration.zero,
    required this.dataBaseName,
  })  : _throttle = throttle,
        _saveDuration = saveDuration;

  final String dataBaseName;

  final Duration? _saveDuration;
  final Duration? _throttle;

  /// initialize the database
  Future<void> init() async {
    await DatabaseMobile<Database>(
      initializeDB: InitializeDB<Database>(dbName: this.dataBaseName),
    ).database;

    /// Check and create missing tables dynamically
    /// This prevents the need for uninstalling and reinstalling the app every time there is an update in the database
    for (final Tables table in Tables.values) {
      final bool exists = await DatabaseMobile<Database>(
        initializeDB: InitializeDB<Database>(dbName: this.dataBaseName),
      ).tableExists(table.name);
      if (!exists) {
        await DatabaseMobile<Database>(
          initializeDB: InitializeDB<Database>(dbName: this.dataBaseName),
        ).createTable(table.name);
      }
    }
  }

  @override
  Future<void> deleteState() async {
    await DatabaseMobile<Database>(
      initializeDB: InitializeDB<Database>(dbName: this.dataBaseName),
    ).clearDatabase();
  }

  @override
  Future<void> persistDifference({
    AppState? lastPersistedState,
    required AppState newState,
  }) async {
    await Future<dynamic>.delayed(saveDuration!);

    if (lastPersistedState == null ||
        lastPersistedState.authState != newState.authState ||
        lastPersistedState.userState != newState.userState ||
        lastPersistedState.bottomNavState != newState.bottomNavState ||
        lastPersistedState.onboardingState != newState.onboardingState) {
      await persistState(
        newState,
        DatabaseMobile<Database>(
          initializeDB: InitializeDB<Database>(dbName: this.dataBaseName),
        ),
      );
    }
  }

  @override
  Future<AppState> readState() async {
    if (await DatabaseMobile<Database>(
      initializeDB: InitializeDB<Database>(dbName: this.dataBaseName),
    ).isDatabaseEmpty()) {
      return AppState.initial();
    } else {
      return retrieveState(
        DatabaseMobile<Database>(
          initializeDB: InitializeDB<Database>(dbName: this.dataBaseName),
        ),
      );
    }
  }

  @override
  Future<void> saveInitialState(AppState state) async {
    return persistDifference(newState: state);
  }

  @override
  Duration? get throttle => _throttle;

  Duration? get saveDuration => _saveDuration;

  Future<void> persistState(
    AppState newState,
    DatabaseBase<dynamic> database,
  ) async {
    try {
      await database.saveState(
        data: newState.authState!.toJson(),
        table: Tables.authState,
      );

      await database.saveState(
        data: newState.bottomNavState!.toJson(),
        table: Tables.bottomNavState,
      );

      await database.saveState(
        data: newState.userState!.toJson(),
        table: Tables.userState,
      );

      await database.saveState(
        data: newState.onboardingState!.toJson(),
        table: Tables.onboardingState,
      );
    } catch (e) {
      // TODO(abiud): report error to sentry
      // reportErrorToSentry(
      //   exception: e,
      //   state: newState,
      //   hint: e.toString(),
      // );
    }
  }

  Future<AppState> retrieveState(DatabaseBase<dynamic> database) async {
    try {
      return const AppState().copyWith(
        authState:
            AuthState.fromJson(await database.retrieveState(Tables.authState)),
        bottomNavState: BottomNavState.fromJson(
          await database.retrieveState(Tables.bottomNavState),
        ),
        userState:
            UserState.fromJson(await database.retrieveState(Tables.userState)),
        onboardingState: OnboardingState.fromJson(
          await database.retrieveState(Tables.onboardingState),
        ),
      );
    } catch (e) {
      // TODO(abiud): report error to Sentry
      // reportErrorToSentry(
      //   exception: e,
      //   state: AppState.initial(),
      //   hint: e.toString(),
      // );
      return AppState.initial();
    }
  }
}
