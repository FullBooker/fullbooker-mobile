import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fullbooker/core/environments.dart';
import 'package:fullbooker/features/auth/pages/login.dart';
import 'package:http/http.dart' as http;

class AuthenticationException implements Exception {
  String cause;
  AuthenticationException(this.cause);

  @override
  String toString() => cause;
}

class PermissionsException implements Exception {
  String cause;
  PermissionsException(this.cause);

  @override
  String toString() => cause;
}

class UnprocessableEntity implements Exception {
  String cause;
  UnprocessableEntity(this.cause);

  @override
  String toString() => cause;
}

class ServerError implements Exception {
  String cause;
  ServerError(this.cause);

  @override
  String toString() => cause;
}

class ClientError implements Exception {
  String cause;
  ClientError(this.cause);

  @override
  String toString() => cause;
}

class NotFoundException implements Exception {
  String cause;
  NotFoundException(this.cause);

  @override
  String toString() => cause;
}

void handleResponse(http.Response response) {
  Map<String, dynamic> responseData = jsonDecode(response.body);

  String errorMessage =
      responseData.isNotEmpty ? responseData[responseData.keys.first] : "";
  errorMessage =
      "${errorMessage[0].toUpperCase()}${errorMessage.substring(1).toLowerCase()}";

  switch (response.statusCode) {
    case 401:
      if (response.request != null &&
          !response.request!.url.toString().contains("signin")) {
        navigatorKey.currentState!.push(MaterialPageRoute(
            builder: (_) => const Login(goBackToOrigin: true)));
      }
      throw AuthenticationException("You were logged out");
    case 403:
      throw PermissionsException(
          "Permission denied: you do not have the permissions to perform that action");
    case 404:
      throw NotFoundException(
          "Could not find what you're looking for, please try again");
    case 422:
      throw UnprocessableEntity(errorMessage);
    case >= 500:
      throw ServerError("Server error: ");
    case >= 400 && < 500:
      throw ClientError(errorMessage);
    default:
      break;
  }
}
