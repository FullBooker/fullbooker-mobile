// Package imports:
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/core/common/constants.dart';

part 'user_state.freezed.dart';
part 'user_state.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class UserState with _$UserState {
  @JsonSerializable(explicitToJson: true)
  factory UserState({
    @Default(UNKNOWN) @JsonKey(name: 'id') String userID,
    @Default(UNKNOWN) @JsonKey(name: 'phone_number') String phoneNumber,
    @Default(UNKNOWN) @JsonKey(name: 'email') String emailAddress,
    @Default(UNKNOWN) @JsonKey(name: 'first_name') String firstName,
    @Default(UNKNOWN) @JsonKey(name: 'last_name') String lastName,
    @Default(false) @JsonKey(name: 'is_active') String active,
    @Default(false) @JsonKey(name: 'is_host') String isHost,
    @Default(false) @JsonKey(name: 'image') String profileURL,
  }) = _UserState;

  factory UserState.initial() => UserState();

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);
}
