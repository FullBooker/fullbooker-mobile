import 'dart:convert';

import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/processed_response.dart';
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

/// Processes an HTTP response and returns a ProcessedResponse object.
///
/// This function takes an HTTP response as input and evaluates its status code.
/// If the status code indicates success (200, 201, or 202), a `ProcessedResponse`
/// object is returned with the 'ok' field set to `true`. For other status codes,
/// the response body is decoded as JSON, and an error `ProcessedResponse` object
/// is returned. The `extractErrorCode` function is used to extract an error code,
/// and the `getUserFriendlyMsg` and `getErrorMessage` functions are used to generate
/// error messages based on the error code and status code.
///
/// @param response The HTTP response to be processed.
/// @return A ProcessedResponse object containing the processed information.
ProcessedResponse processHttpResponse(Response response) {
  if (<int>[200, 201, 202].contains(response.statusCode)) {
    return ProcessedResponse(ok: true, response: response, code: 200);
  }

  final Map<String, dynamic> body =
      json.decode(response.body) as Map<String, dynamic>;

  final int code = extractErrorCode(body);

  if (response.statusCode == 400 || response.statusCode == 500) {
    return ProcessedResponse(
      ok: false,
      response: response,
      message: getUserFriendlyMsg(code),
      code: code,
    );
  }

  if (response.statusCode == 408) {
    return ProcessedResponse(
      ok: false,
      response: response,
      message: getUserFriendlyMsg(0),
      code: 0,
    );
  }

  return ProcessedResponse(
    ok: false,
    response: response,
    message: getErrorMessage(),
    code: code,
  );
}

/// Retrieves a user-friendly error message based on an error code.
///
/// This function takes an error code as input and returns a user-friendly
/// error message associated with that code. It uses a switch-case structure
/// to map error codes to corresponding messages. If the provided code does
/// not match any known error code, a default error message is returned.
///
/// @param code The error code for which to retrieve a user-friendly message.
/// @return A user-friendly error message corresponding to the provided error code.
String getUserFriendlyMsg(int code) {
  switch (code) {
    case 0:
      return slowInternet;
    case 4:
    case 5:
      return userWithThatEmailExists;
    case 7:
    case 10:
      return userNotFound;
    case 8:
      return wrongLoginCredentials;
    case 48:
      return passwordHasExpired;
    // case 73:
    //   return tooManyAttemptsString;

    default:
      return defaultUserFriendlyMessage;
  }
}

/// Retrieves an error message based on an optional custom message.
///
/// This function takes an optional custom error message as input and returns an
/// error message based on that input. If the provided custom message is empty,
/// the function returns a default error message. Otherwise, it constructs and
/// returns an error message that includes the custom message along with a generic
/// error statement. This function is useful for generating informative error
/// messages for various scenarios.
///
/// @param message An optional custom error message describing the error scenario.
/// @return An error message based on the provided custom message, or a default message.
String getErrorMessage([String message = '']) {
  if (message.isEmpty) {
    return defaultUserFriendlyMessage;
  } else {
    return 'Sorry, an error occurred while $message.'
        ' Please try again later, or contact support center';
  }
}

/// Extracts an error code from a JSON response body.
///
/// This function takes a JSON response body as input and attempts to extract
/// an error code. If the input body is not null and contains a key named 'code',
/// the value associated with the 'code' key is extracted as a string. The extracted
/// string is then parsed to an integer using `int.tryParse`. If parsing is successful,
/// the integer value is returned. If parsing fails or the 'code' key is not present,
/// a default error code of 11 is returned.
///
/// @param body The JSON response body from which to extract the error code.
/// @return An integer error code extracted from the JSON response body, or a default value of 11.
int extractErrorCode(Map<String, dynamic>? body) {
  if (body != null && body.containsKey('code')) {
    final String code = body['code']?.toString() ?? '';
    return int.tryParse(code) ?? 11;
  } else {
    return 11;
  }
}
