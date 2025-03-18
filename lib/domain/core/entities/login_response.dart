import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/application/redux/states/user_state.dart';
import 'package:fullbooker/core/common/constants.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class LoginResponse with _$LoginResponse {
  @JsonSerializable(explicitToJson: true)
  factory LoginResponse({
    @Default(UNKNOWN) @JsonKey(name: 'access') String accessToken,
    @Default(UNKNOWN) @JsonKey(name: 'refresh') String refreshToken,
    @Default(UNKNOWN) @JsonKey(name: 'expires_at') String expiresAt,
    @JsonKey(name: 'user') UserState? user,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
