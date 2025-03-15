// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_nav_state.freezed.dart';
part 'bottom_nav_state.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class BottomNavState with _$BottomNavState {
  @JsonSerializable(explicitToJson: true)
  const factory BottomNavState({
    @JsonKey(name: 'currentNavIndex') @Default(0) int? currentNavIndex,
  }) = _BottomNavState;

  factory BottomNavState.initial() => const BottomNavState();

  factory BottomNavState.fromJson(Map<String, dynamic> json) =>
      _$BottomNavStateFromJson(json);
}
