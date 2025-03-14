import 'dart:io';

import 'package:fullbooker/core/models.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

Future<Database> setupDB(String env) async {
  final Directory dir = await getApplicationDocumentsDirectory();
  await dir.create(recursive: true);
  final String dbPath = join(dir.path, '$env.db');
  return databaseFactoryIo.openDatabase(dbPath);
}

class EntityStore<T extends Model> {
  Serializer<T> serializer;
  Database db;
  String idKey;

  StoreRef<String, Map<String, Object?>> store =
      stringMapStoreFactory.store('$T-store');

  EntityStore(this.db, this.serializer, this.idKey);

  Future<List<T>> fetchMultiple(Finder? query) async {
    final List<T> records = <T>[];
    final List<RecordSnapshot<String, Map<String, Object?>>> snapshot =
        await store.find(db, finder: query);
    for (RecordSnapshot<String, Map<String, Object?>> flatData in snapshot) {
      records.add(serializer.fromJson(flatData.value));
    }
    return records;
  }

  Future<dynamic> fetchById(String id) async {
    final Map<String, Object?>? map = await store.record(id).get(db);
    return map == null ? null : serializer.fromJson(map);
  }

  Future<void> replace(T obj) async {
    final Map<String, Object?> flatObj = serializer.toJson(obj);
    await store.record(obj.getId()).put(db, flatObj, merge: true);
  }

  Future<void> setData(Map<String, Object?> data, String idKey) async {
    await store.record(data[idKey]!.toString()).put(db, data, merge: true);
  }

  Future<void> set(T obj) async {
    final Map<String, Object?> flatObj = serializer.toJson(obj);
    await store.record(obj.getId()).put(db, flatObj, ifNotExists: true);
  }

  Future<void> delete(T obj) async {
    await store.record(obj.getId()).delete(db);
  }
}
