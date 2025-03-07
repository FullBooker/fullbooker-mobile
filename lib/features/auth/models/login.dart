import 'package:fullbooker/core/models.dart';

class User implements Model {
  String phoneNumber;
  String? email;
  String firstName;
  String lastName;

  User(this.firstName, this.lastName, this.email, this.phoneNumber);

  @override
  String getId() => phoneNumber;
}

class UserSerializer implements Serializer<User> {
  @override
  User fromJson(Map<String, Object?> json) {
    return User(
      json["first_name"] as String,
      json["last_name"] as String,
      json["email"] as String?,
      json["phone_number"] as String,
    );
  }

  @override
  Map<String, Object?> toJson(User object) {
    return {
      "first_name": object.firstName,
      "last_name": object.lastName,
      "email": object.email,
      "phone_number": object.phoneNumber
    };
  }

  @override
  String getIdKeyName() => "phone_number";
}

final userSerializer = UserSerializer();

class Token implements Model {
  String accessToken;
  String refreshToken;
  String? expiresAt;
  User user;

  Token(this.accessToken, this.refreshToken, this.expiresAt, this.user);

  @override
  String getId() => accessToken;
}

class TokenSerializer implements Serializer<Token> {
  @override
  Token fromJson(Map<String, Object?> json) {
    return Token(
        (json["access_token"] ?? json["access"]) as String,
        (json["refresh_token"] ?? json["refresh"]) as String,
        json["expires_at"] as String?,
        userSerializer.fromJson(json["user"] as Map<String, Object?>));
  }

  @override
  Map<String, Object?> toJson(Token object) {
    return {
      "access_token": object.accessToken,
      "refresh_token": object.refreshToken,
      "expires_at": object.expiresAt
    };
  }

  @override
  String getIdKeyName() => "access_token";
}
