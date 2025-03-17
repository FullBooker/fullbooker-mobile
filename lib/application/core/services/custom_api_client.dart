import 'dart:convert';

import 'package:fullbooker/core/common/constants.dart';
import 'package:http/http.dart';

abstract class ICustomClient extends BaseClient {
  late String endpoint;
  late String idToken;

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    request.headers.addAll(buildHeaders());
    return request.send();
  }

  /// Converts a dynamic URI or string to a `Uri` instance
  Uri fromUriOrString(dynamic uri) =>
      uri is String ? Uri.parse(uri) : uri as Uri;

  /// Constructs default request headers, optionally excluding the
  /// Authorization header
  Map<String, String> buildHeaders({
    bool authenticated = true,
    Map<String, String>? customHeaders,
  }) {
    final Map<String, String> headers = <String, String>{
      if (authenticated) 'Authorization': 'Bearer $idToken',
      'Accept': 'application/json',
      'content-type': 'application/json',
      if (customHeaders != null) ...customHeaders,
    };

    return headers;
  }

  /// Makes an unauthenticated REST API call with the [method] passed
  Future<Response> callRESTAPI({
    required String endpoint,
    required String method,
    Map<String, dynamic>? variables,
    Map<String, dynamic>? queryParams,
    Duration? timeout,
    Map<String, String>? customHeaders,
  }) async {
    Uri uri = fromUriOrString(endpoint);
    if (queryParams != null) {
      uri = uri.replace(queryParameters: queryParams);
    }

    final Request request = Request(method, uri)
      ..headers.addAll(customHeaders ?? <String, String>{});

    if (variables != null) {
      request.body = json.encode(variables);
    }

    return Response.fromStream(
      await send(request).timeout(
        timeout ?? const Duration(seconds: kRequestTimeoutSeconds),
        onTimeout: () {
          final String timeoutBody = json.encode(kTimeoutResponsePayload);
          return StreamedResponse(
            ByteStream.fromBytes(utf8.encode(timeoutBody)),
            408,
            headers: buildHeaders(customHeaders: customHeaders),
          );
        },
      ),
    );
  }

  /// Parses error messages from a GraphQL response body.
  String? parseError(Map<String, dynamic>? body) {
    if (body == null) return null;

    final Object? error = body['errors'] ?? body['error'];

    if (error is List) {
      return (error.first as Map<String, dynamic>)['message'] as String?;
    }

    if (error is String) {
      return error.contains(RegExp('ID token', caseSensitive: false))
          ? kLoginLogoutPrompt
          : error;
    }

    return null;
  }
}
