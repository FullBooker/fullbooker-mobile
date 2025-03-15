// Package imports:
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/core/common/constants.dart';

part 'auth_state.freezed.dart';
part 'auth_state.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class AuthState with _$AuthState {
  @JsonSerializable(explicitToJson: true)
  factory AuthState({
    @Default(false) @JsonKey(name: 'isSignedIn') bool isSignedIn,
    @Default(UNKNOWN) @JsonKey(name: 'idToken') String idToken,
  }) = _AuthState;

  factory AuthState.initial() => AuthState();

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}
