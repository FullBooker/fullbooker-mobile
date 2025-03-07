import 'package:flutter/material.dart';
import 'package:fullbooker/features/auth/models/login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sembast/sembast_io.dart';
import 'db.dart';

enum FlavourType { development, production }

class Flavour {
  final String apiHost;
  final FlavourType type;
  final Database db;

  const Flavour(this.apiHost, this.db, {this.type = FlavourType.development});

  static Future<Flavour> withDB(String apiHost,
      {FlavourType type = FlavourType.development}) async {
    var db = await setupDB(type.toString());
    return Flavour(apiHost, db, type: type);
  }
}

var development = Flavour.withDB("api.dev.fullbooker.co.ke");
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

late Flavour env;
Token? currentToken;

GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly'],
);

class BuildEnvironment {
  FlavourType type;

  BuildEnvironment(this.type);

  Future setExistingToken() async {
    var store = stringMapStoreFactory.store("$Token-store");
    var record = await store.record("currentToken").get(env.db);
    if (record != null) {
      currentToken = TokenSerializer().fromJson(record);
    }
  }

  Future setEnv() async {
    switch (type) {
      case FlavourType.development:
        env = await development;
        break;
      default:
        env = await development;
    }
    await setExistingToken();
  }
}
