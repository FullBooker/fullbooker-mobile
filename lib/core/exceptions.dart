import 'dart:convert';

import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:http/http.dart' as http;

class AuthenticationException implements Exception {
  AuthenticationException(this.cause);

  String cause;

  @override
  String toString() => cause;
}

class PermissionsException implements Exception {
  PermissionsException(this.cause);

  String cause;

  @override
  String toString() => cause;
}

class UnprocessableEntity implements Exception {
  UnprocessableEntity(this.cause);

  String cause;

  @override
  String toString() => cause;
}

class ServerError implements Exception {
  ServerError(this.cause);

  String cause;

  @override
  String toString() => cause;
}

class ClientError implements Exception {
  ClientError(this.cause);

  String cause;

  @override
  String toString() => cause;
}

class NotFoundException implements Exception {
  NotFoundException(this.cause);

  String cause;

  @override
  String toString() => cause;
}

void handleResponse(http.Response response) {
  final Map<String, dynamic> responseData = jsonDecode(response.body);

  final dynamic errorMessage =
      responseData.isNotEmpty ? responseData[responseData.keys.first] : '';
  String error;

  if (errorMessage.runtimeType == List<dynamic>) {
    error = errorMessage[0];
  } else {
    error = '$errorMessage';
  }

  error = '${error[0].toUpperCase()}${error.substring(1).toLowerCase()}';

  switch (response.statusCode) {
    case 401:
      if (response.request != null &&
          !response.request!.url.toString().contains('signin')) {
        // TODO(abiud): remove this way of navigation
        // navigatorKey.currentState!.push(
        //   MaterialPageRoute<Login>(
        //     builder: (_) => const Login(goBackToOrigin: true),
        //   ),
        // );
      }
      throw AuthenticationException(youWereLoggedOutString);
    case 403:
      throw PermissionsException(permissionDeniedString);
    case 404:
      throw NotFoundException(notFoundString);
    case 422:
      throw UnprocessableEntity(error);
    case >= 500:
      throw ServerError(serverError);
    case >= 400 && < 500:
      throw ClientError(error);
    default:
      break;
  }
}
