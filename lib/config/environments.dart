import 'package:fullbooker/domain/core/value_objects/endpoints.dart';
import 'package:fullbooker/features/auth/models/login.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:sembast/sembast_io.dart';
import '../database/db.dart';

// ================= Remove everything below this line when done
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

// TODO(abiud): this should come from
Future<Flavour> development = Flavour.withDB(devAPIBaseURL);

late Flavour env;

// TODO(abiud): remove this once the refactor is complete
Token? currentToken;

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
