import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/application/redux/states/auth_state.dart';
import 'package:fullbooker/application/redux/states/bottom_nav_state.dart';
import 'package:fullbooker/application/redux/states/user_state.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  @JsonSerializable(explicitToJson: true)
  const factory AppState({
    AuthState? authState,
    UserState? userState,
    BottomNavState? bottomNavState,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  factory AppState.initial() => AppState(
        authState: AuthState.initial(),
        bottomNavState: BottomNavState.initial(),
        userState: UserState.initial(),
      );
}
