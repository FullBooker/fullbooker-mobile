import 'dart:convert';
import 'dart:io';

import 'package:fullbooker/database/db.dart';
import 'package:fullbooker/config/environments.dart';
import 'package:fullbooker/core/exceptions.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:http/http.dart' as http;

import 'package:fullbooker/core/models.dart';
import 'package:sembast/sembast.dart';

class CRUDRepository<T extends Model> {
  String path;
  String host = env.apiHost;
  String listDataKey;
  Serializer<T> serializer;
  late EntityStore<T> store;
  late HttpClient client;
  RepositoryMode mode;

  List<int> pagesFetched = <int>[];

  CRUDRepository(
    this.path,
    this.serializer, {
    this.listDataKey = 'results',
    this.mode = RepositoryMode.onlineFirst,
  }) {
    client = HttpClient();
    store = EntityStore<T>(env.db, serializer, serializer.getIdKeyName());
  }

  Map<String, String> setupHeaders() {
    final Map<String, String> headers = <String, String>{};
    if (currentToken != null) {
      headers['Authorization'] = 'Bearer ${currentToken!.accessToken}';
    }
    return headers;
  }

  Future<List<T>> pullMultiple(
    int page,
    int pageSize, {
    bool processResponseAsPage = true,
    Map<String, dynamic> filters = const <String, dynamic>{},
  }) async {
    if (pagesFetched.contains(page) && mode == RepositoryMode.offlineFirst) {
      final List<T> storedRecords = await store
          .fetchMultiple(Finder(filter: Filter.equals('page', page)));
      if (storedRecords.isNotEmpty) return storedRecords;
    }
    final Uri url = Uri.https(this.host, this.path, filters);
    final http.Response response = await http.get(url, headers: setupHeaders());
    handleResponse(response);
    final List<dynamic> results = processResponseAsPage
        ? jsonDecode(response.body)[listDataKey]
        : jsonDecode(response.body);
    final List<T> serializedResults = <T>[];
    for (dynamic result in results) {
      result['page'] = page;
      store.setData(result, serializer.getIdKeyName());
      serializedResults.add(serializer.fromJson(result));
    }
    return serializedResults;
  }

  Future<T> pull(String id) async {
    if (mode == RepositoryMode.offlineFirst) {
      final dynamic storedRecord = await store.fetchById(id);
      if (storedRecord != null) return storedRecord;
    }
    final Uri url = Uri.https(this.host, '${this.path}/$id/');
    final http.Response response = await http.get(url);
    handleResponse(response);
    final dynamic obj = serializer.fromJson(jsonDecode(response.body));
    store.replace(obj);
    return obj;
  }

  Future<T> create(T obj) async {
    final Uri url = Uri.https(this.host, this.path);
    final http.Response response = await http.post(
      url,
      headers: <String, String>{},
      body: serializer.toJson(obj),
    );
    handleResponse(response);
    final dynamic objFromApi = serializer.fromJson(jsonDecode(response.body));
    store.replace(objFromApi);
    return objFromApi;
  }

  Future<T> update(T obj, String id) async {
    final Uri url = Uri.https(this.host, '${this.path}/$id/');
    final http.Response response = await http.patch(
      url,
      headers: <String, String>{},
      body: serializer.toJson(obj),
    );
    handleResponse(response);
    final dynamic objFromApi = serializer.fromJson(jsonDecode(response.body));
    store.replace(objFromApi);
    return objFromApi;
  }

  Future<T> delete(T obj, String id) async {
    final Uri url = Uri.https(this.host, '${this.path}/$id/');
    final http.Response response = await http.delete(
      url,
      headers: <String, String>{},
      body: serializer.toJson(obj),
    );
    handleResponse(response);
    return serializer.fromJson(jsonDecode(response.body));
  }

  Future<dynamic> post(
    Map<String, Object?> data,
    String path, {
    bool serialize = false,
    bool withHeaders = true,
  }) async {
    /**
     * Entity agnostic posting to the API, still
     * benefits from unified error handling and serialization
     * if necessary.
     */
    final Uri url = Uri.https(this.host, path);
    final Map<String, String> headers =
        withHeaders ? setupHeaders() : <String, String>{};
    headers.addAll(<String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    final http.Response response =
        await http.post(url, body: json.encode(data), headers: headers);
    handleResponse(response);
    final dynamic decodedJson = json.decode(response.body);
    if (!serialize) return decodedJson;
    return serializer.fromJson(decodedJson);
  }

  Future<dynamic> postWithImages(
    Map<String, String> data,
    List<File> images,
    String path, {
    bool serialize = false,
  }) async {
    final Uri url = Uri.https(this.host, path);
    final Map<String, String> headers = setupHeaders();
    headers['Content-Type'] = 'multipart/form-data';
    final http.MultipartRequest request = http.MultipartRequest('POST', url)
      ..headers.addAll(headers)
      ..fields.addAll(data);
    for (File image in images) {
      final http.MultipartFile multiPartFile =
          await http.MultipartFile.fromPath('file', image.path);
      request.files.add(multiPartFile);
    }
    final http.StreamedResponse streamedResponse = await request.send();
    final http.Response response =
        await http.Response.fromStream(streamedResponse);
    handleResponse(response);
    final dynamic decodedJson = json.decode(response.body);
    if (!serialize) return decodedJson;
    return serializer.fromJson(decodedJson);
  }
}
