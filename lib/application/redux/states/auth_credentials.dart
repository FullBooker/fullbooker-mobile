import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/core/common/constants.dart';

part 'auth_credentials.freezed.dart';
part 'auth_credentials.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class AuthCredentials with _$AuthCredentials {
  @JsonSerializable(explicitToJson: true)
  factory AuthCredentials({
    @Default(UNKNOWN) @JsonKey(name: 'access') String accessToken,
    @Default(UNKNOWN) @JsonKey(name: 'refresh') String refreshToken,
    @Default(UNKNOWN) @JsonKey(name: 'expires_at') String expiresAt,
  }) = _AuthCredentials;

  factory AuthCredentials.initial() => AuthCredentials();

  factory AuthCredentials.fromJson(Map<String, dynamic> json) =>
      _$AuthCredentialsFromJson(json);
}
