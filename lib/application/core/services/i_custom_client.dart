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
      ..headers.addAll(customHeaders ?? defaultRequestHeaders);

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
            headers: buildHeaders(
              customHeaders: customHeaders ?? defaultRequestHeaders,
            ),
          );
        },
      ),
    );
  }

  /// Extracts an error message from the response body
  String? parseError(Map<String, dynamic>? body) {
    if (body == null || body.isEmpty) return null;

    // Handle non_field_errors
    final dynamic generalError = body['non_field_errors'];

    if (generalError is List && generalError.isNotEmpty) {
      final dynamic firstError = generalError.first;
      if (firstError is String) {
        return firstError.contains(RegExp('ID token', caseSensitive: false))
            ? kLoginLogoutPrompt
            : firstError;
      }
    }

    if (generalError is String) {
      return generalError.contains(RegExp('ID token', caseSensitive: false))
          ? kLoginLogoutPrompt
          : generalError;
    }

    // Field specific BE errors like {"email": ["error"]}
    for (final MapEntry<String, dynamic> entry in body.entries) {
      if (entry.value is List && (entry.value as List<dynamic>).isNotEmpty) {
        final dynamic firstFieldError = (entry.value as List<dynamic>).first;
        if (firstFieldError is String) return firstFieldError;
      }
      if (entry.value is String) {
        return entry.value as String;
      }
    }

    return null;
  }
}
