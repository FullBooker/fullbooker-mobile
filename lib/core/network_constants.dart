import 'dart:io';

class NetworkConstants {
  static const String baseURL = 'https://jsonplaceholder.typicode.com/';

  static const Map<String, String> headers = <String, String>{
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.contentTypeHeader: 'application/json',
  };
}
