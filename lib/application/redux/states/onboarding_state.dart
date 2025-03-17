// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.freezed.dart';
part 'onboarding_state.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class OnboardingState with _$OnboardingState {
  @JsonSerializable(explicitToJson: true)
  const factory OnboardingState({
    @Default('') String emailAddress,
    @Default('') String password,

    /// LOGIN VALUES
    @Default(false) bool invalidCredentials,

    /// VERIFY PHONE VALUES
    @Default(false) bool invalidOTP,
  }) = _OnboardingState;

  factory OnboardingState.initial() => const OnboardingState();

  factory OnboardingState.fromJson(Map<String, dynamic> json) =>
      _$OnboardingStateFromJson(json);
}
