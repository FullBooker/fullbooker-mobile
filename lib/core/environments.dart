import 'package:flutter/material.dart';
import 'package:fullbooker/features/auth/models/login.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sembast/sembast_io.dart';
import 'db.dart';

class Flavour {
  final String apiHost;
  final AppEnvironment appEnv;
  final Database db;

  const Flavour(
    this.apiHost,
    this.db, {
    this.appEnv = AppEnvironment.dev,
  });

  static Future<Flavour> withDB(
    String apiHost, {
    AppEnvironment type = AppEnvironment.dev,
  }) async {
    final Database db = await setupDB(type.toString());
    return Flavour(apiHost, db, appEnv: type);
  }
}

Future<Flavour> development = Flavour.withDB('api.dev.fullbooker.co.ke');
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

late Flavour env;
Token? currentToken;

GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class BuildEnvironment {
  AppEnvironment type;

  BuildEnvironment(this.type);

  Future<void> setExistingToken() async {
    final StoreRef<String, Map<String, Object?>> store =
        stringMapStoreFactory.store('$Token-store');
    final Map<String, Object?>? record =
        await store.record('currentToken').get(env.db);
    if (record != null) {
      currentToken = TokenSerializer().fromJson(record);
    }
  }

  Future<void> setEnv() async {
    switch (type) {
      case AppEnvironment.dev:
        env = await development;
        break;
      default:
        env = await development;
    }
    await setExistingToken();
  }
}
