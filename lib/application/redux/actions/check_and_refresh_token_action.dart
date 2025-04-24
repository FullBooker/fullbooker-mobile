import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/set_sign_in_method_action.dart';
import 'package:fullbooker/application/redux/actions/update_auth_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/states/auth_credentials.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class CheckAndRefreshTokenAction extends ReduxAction<AppState> {
  CheckAndRefreshTokenAction({
    this.onSuccess,
    this.onError,
    required this.client,
  });

  final Function(String error)? onError;
  final Function()? onSuccess;
  final ICustomClient client;

  @override
  void before() {
    dispatch(SetSignInMethodAction(signInMethod: SignInMethod.EMAIL));
  }

  @override
  Future<AppState?> reduce() async {
    final bool isSignedIn = state.authState?.isSignedIn ?? false;

    if (!isSignedIn) return null;

    final DateTime now = DateTime.now();

    final DateTime expiresAt =
        DateTime.tryParse(state.authState?.authCredentials?.expiresAt ?? '')
                ?.toLocal() ??
            now;

    final bool hasExpired = hasTokenExpired(expiresAt, now);

    if (!hasExpired) return null;

    final AuthCredentials? authCredentials = state.authState?.authCredentials;

    final String refreshToken = authCredentials?.refreshToken ?? UNKNOWN;

    final Map<String, String> data = <String, String>{
      'refresh': refreshToken,
    };

    final String refreshEndpoint =
        GetIt.I.get<AppConfig>().refreshTokenEndpoint;

    final Response httpResponse = await client.callRESTAPI(
      authenticated: false,
      endpoint: refreshEndpoint,
      method: APIMethods.POST.name.toUpperCase(),
      variables: data,
    );

    final Map<String, dynamic> body =
        json.decode(httpResponse.body) as Map<String, dynamic>;

    if (httpResponse.statusCode >= 400) {
      final String? error = client.parseError(body);

      onError?.call(error ?? defaultUserFriendlyMessage);

      return null;
    }

    final AuthCredentials newCredentials = AuthCredentials.fromJson(body);

    // Update the auth state
    dispatch(
      UpdateAuthStateAction(
        isSignedIn: true,
        accessToken: newCredentials.accessToken,
        refreshToken: newCredentials.refreshToken,
        expiresAt: newCredentials.expiresAt,
      ),
    );

    onSuccess?.call();

    return state;
  }
}
