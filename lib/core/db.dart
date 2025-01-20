import 'package:fullbooker/core/models.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

Future<Database> setupDB(String env) async {
  var dir = await getApplicationDocumentsDirectory();
  await dir.create(recursive: true);
  var dbPath = join(dir.path, '$env.db');
  return await databaseFactoryIo.openDatabase(dbPath);
}

class EntityStore<T extends Model> {
  Serializer<T> serializer;
  Database db;
  String idKey;

  var store = stringMapStoreFactory.store("$T-store");

  EntityStore(this.db, this.serializer, this.idKey);

  Future<List<T>> fetchMultiple(Finder? query) async {
    List<T> records = [];
    var snapshot = await store.find(db, finder: query);
    for (var flatData in snapshot) {
      records.add(serializer.fromJson(flatData.value));
    }
    return records;
  }

  Future<T?> fetchById(String id) async {
    var map = await store.record(id).get(db);
    return map == null ? null : serializer.fromJson(map);
  }

  Future replace(T obj) async {
    var flatObj = serializer.toJson(obj);
    await store.record(obj.getId()).put(db, flatObj, merge: true);
  }

  Future setData(Map<String, Object?> data, String idKey) async {
    await store.record(data[idKey]!.toString()).put(db, data, merge: true);
  }

  Future set(T obj) async {
    var flatObj = serializer.toJson(obj);
    await store.record(obj.getId()).put(db, flatObj, ifNotExists: true);
  }

  Future delete(T obj) async {
    await store.record(obj.getId()).delete(db);
  }
}
