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

  Map<String, String> setupHeaders() {
    Map<String, String> headers = {};
    if (currentToken != null) {
      headers["Authorization"] = "Bearer ${currentToken!.accessToken}";
    }
    return headers;
  }

  Future<List<T>> pullMultiple(int page, int pageSize,
      {bool processResponseAsPage = false,
      Map<String, dynamic> filters = const {}}) async {
    if (pagesFetched.contains(page) && mode == RepositoryMode.offlineFirst) {
      var storedRecords = await store
          .fetchMultiple(Finder(filter: Filter.equals("page", page)));
      if (storedRecords.isNotEmpty) return storedRecords;
    }
    var url = Uri.https(this.host, this.path, filters);
    var response = await http.get(url, headers: setupHeaders());
    handleResponse(response);
    List<dynamic> results = processResponseAsPage
        ? jsonDecode(response.body)[listDataKey]
        : jsonDecode(response.body);
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
      {bool serialize = false, bool withHeaders = true}) async {
    /**
     * Entity agnostic posting to the API, still
     * benefits from unified error handling and serialization
     * if necessary.
     */
    var url = Uri.https(this.host, path);
    Map<String, String> headers = withHeaders ? setupHeaders() : {};
    headers.addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    var response =
        await http.post(url, body: json.encode(data), headers: headers);
    handleResponse(response);
    var decodedJson = json.decode(response.body);
    if (!serialize) return decodedJson;
    return serializer.fromJson(decodedJson);
  }

  Future<dynamic> postWithImages(
      Map<String, String> data, List<File> images, String path,
      {bool serialize = false}) async {
    var url = Uri.https(this.host, path);
    var headers = setupHeaders();
    headers["Content-Type"] = "multipart/form-data";
    var request = http.MultipartRequest("POST", url)
      ..headers.addAll(headers)
      ..fields.addAll(data);
    for (var image in images) {
      var multiPartFile = await http.MultipartFile.fromPath("file", image.path);
      request.files.add(multiPartFile);
    }
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    handleResponse(response);
    var decodedJson = json.decode(response.body);
    if (!serialize) return decodedJson;
    return serializer.fromJson(decodedJson);
  }
}
