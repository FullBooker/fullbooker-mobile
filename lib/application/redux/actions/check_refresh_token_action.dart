import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/utils/utils.dart';

class CheckRefreshTokenAction extends ReduxAction<AppState> {
  CheckRefreshTokenAction({required this.onExpired});

  final Function()? onExpired;

  @override
  Future<AppState?> reduce() async {
    final bool isSignedIn = state.authState?.isSignedIn ?? false;

    if (!isSignedIn) return null;

    final DateTime now = DateTime.now();

    final DateTime expiresAt =
        DateTime.tryParse(state.authState?.authCredentials?.expiresAt ?? '')
                ?.toLocal() ??
            now;

    final bool refreshTokenStale = isRefreshTokenStale(expiresAt, now);

    if (!refreshTokenStale) return null;

    onExpired?.call();

    return null;
  }
}
