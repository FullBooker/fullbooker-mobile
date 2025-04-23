import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/utils.dart';

class UpdateAuthStateAction extends ReduxAction<AppState> {
  UpdateAuthStateAction({
    this.isSignedIn,
    this.accessToken,
    this.expiresAt,
    this.refreshToken,
  });

  String? accessToken;
  String? expiresAt;
  final bool? isSignedIn;
  String? refreshToken;

  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.authState?.call(
      isSignedIn: isSignedIn ?? state.authState!.isSignedIn,
      authCredentials: state.authState?.authCredentials?.copyWith.call(
        accessToken:
            accessToken ?? state.authState!.authCredentials!.accessToken,
        refreshToken:
            refreshToken ?? state.authState!.authCredentials!.refreshToken,
        expiresAt: convertToLocalTimestamp(expiresAt) ??
            state.authState!.authCredentials!.expiresAt,
      ),
    );

    return newState;
  }
}
