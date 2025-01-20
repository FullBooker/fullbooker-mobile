import 'package:http/http.dart' as http;

class AuthenticationException implements Exception {
  String cause;
  AuthenticationException(this.cause);
}

class PermissionsException implements Exception {
  String cause;
  PermissionsException(this.cause);
}

class UnprocessableEntity implements Exception {
  String cause;
  UnprocessableEntity(this.cause);
}

class ServerError implements Exception {
  String cause;
  ServerError(this.cause);
}

class ClientError implements Exception {
  String cause;
  ClientError(this.cause);
}

class NotFoundException implements Exception {
  String cause;
  NotFoundException(this.cause);
}

void handleResponse(http.Response response) {
  switch (response.statusCode) {
    case 401:
      throw AuthenticationException("Authentication Error: ");
    case 403:
      throw PermissionsException("Permission denied: ");
    case 404:
      throw NotFoundException("Entities could not be found: ");
    case 422:
      throw UnprocessableEntity("Could not process entity");
    case >= 500:
      throw ServerError("Server error: ");
    case >= 400 && <500:
      throw ClientError("Integration error: ");
    default:
      break;
  }
}
