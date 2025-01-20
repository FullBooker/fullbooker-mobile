import 'dart:convert';
import 'dart:io';

import 'package:fullbooker/core/db.dart';
import 'package:fullbooker/core/environments.dart';
import 'package:fullbooker/core/exceptions.dart';
import 'package:http/http.dart' as http;

import 'package:fullbooker/core/models.dart';
import 'package:sembast/sembast.dart';

enum RepositoryMode { onlineFirst, offlineFirst }

class CRUDRepository<T extends Model> {
  String path;
  String host = env.apiHost;
  String listDataKey;
  Serializer<T> serializer;
  late EntityStore<T> store;
  late HttpClient client;
  RepositoryMode mode;

  List<int> pagesFetched = [];

  CRUDRepository(this.path, this.serializer,
      {this.listDataKey = "results", this.mode = RepositoryMode.onlineFirst}) {
    client = HttpClient();
    store = EntityStore<T>(env.db, serializer, serializer.getIdKeyName());
  }

  Future<List<T>> pullMultiple(int page, int pageSize) async {
    if (pagesFetched.contains(page) && mode == RepositoryMode.offlineFirst) {
      var storedRecords = await store
          .fetchMultiple(Finder(filter: Filter.equals("page", page)));
      if (storedRecords.isNotEmpty) return storedRecords;
    }
    var url = Uri.https(this.host, this.path);
    var response = await http.get(url);
    handleResponse(response);
    List<Map<String, Object?>> results = jsonDecode(response.body)[listDataKey];
    List<T> serializedResults = [];
    for (var result in results) {
      result["page"] = page;
      store.setData(result, serializer.getIdKeyName());
      serializedResults.add(serializer.fromJson(result));
    }
    return serializedResults;
  }

  Future<T> pull(String id) async {
    if (mode == RepositoryMode.offlineFirst) {
      var storedRecord = await store.fetchById(id);
      if (storedRecord != null) return storedRecord;
    }
    var url = Uri.https(this.host, "${this.path}/$id/");
    var response = await http.get(url);
    handleResponse(response);
    var obj = serializer.fromJson(jsonDecode(response.body));
    store.replace(obj);
    return obj;
  }

  Future<T> create(T obj) async {
    var url = Uri.https(this.host, this.path);
    var response =
        await http.post(url, headers: {}, body: serializer.toJson(obj));
    handleResponse(response);
    var objFromApi = serializer.fromJson(jsonDecode(response.body));
    store.replace(objFromApi);
    return objFromApi;
  }

  Future<T> update(T obj, String id) async {
    var url = Uri.https(this.host, "${this.path}/$id/");
    var response =
        await http.patch(url, headers: {}, body: serializer.toJson(obj));
    handleResponse(response);
    var objFromApi = serializer.fromJson(jsonDecode(response.body));
    store.replace(objFromApi);
    return objFromApi;
  }

  Future<T> delete(T obj, String id) async {
    var url = Uri.https(this.host, "${this.path}/$id/");
    var response =
        await http.delete(url, headers: {}, body: serializer.toJson(obj));
    handleResponse(response);
    return serializer.fromJson(jsonDecode(response.body));
  }

  Future<dynamic> post(Map<String, Object?> data, String path,
      {bool serialize = false}) async {
    /**
     * Antity agnostic posting to the API, still
     * benefits from unified error handling and serialization
     * if necessary.
     */
    var url = Uri.https(this.host, path);
    var response = await http.post(url, body: data);
    handleResponse(response);
    var decodedJson = json.decode(response.body);
    if (!serialize) return decodedJson;
    return serializer.fromJson(decodedJson);
  }
}
