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

var development = Flavour.withDB("fullbooker-dev-be-sm.nbh4jqg707y8y."
    "eu-central-1.cs.amazonlightsail.com");

late Flavour env;

class BuildEnvironment {
  FlavourType type;

  BuildEnvironment(this.type);

  Future setEnv() async {
    switch (type) {
      case FlavourType.development:
        env = await development;
        break;
      default:
        env = await development;
    }
  }
}
