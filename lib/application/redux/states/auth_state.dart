// Package imports:
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/application/redux/states/auth_credentials.dart';

part 'auth_state.freezed.dart';
part 'auth_state.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class AuthState with _$AuthState {
  @JsonSerializable(explicitToJson: true)
  factory AuthState({
    @Default(false) @JsonKey(name: 'isSignedIn') bool isSignedIn,
    AuthCredentials? authCredentials,
  }) = _AuthState;

  factory AuthState.initial() =>
      AuthState(authCredentials: AuthCredentials.initial());

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}
