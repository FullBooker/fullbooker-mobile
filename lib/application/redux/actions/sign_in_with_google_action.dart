import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/update_auth_state_action.dart';
import 'package:fullbooker/application/redux/actions/update_user_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/login_response.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';

class SignInWithGoogleAction extends ReduxAction<AppState> {
  SignInWithGoogleAction({
    this.onSuccess,
    this.onError,
    required this.client,
  });

  final Function(String error)? onError;
  final Function()? onSuccess;
  final ICustomClient client;

  @override
  Future<AppState?> reduce() async {
    try {
      final GoogleSignIn googleSignIn = GetIt.I.get<GoogleSignIn>();
      final GoogleSignInAccount? account = await googleSignIn.signIn();

      if (account == null) {
        onError?.call(signInCancelled);
        return null;
      }

      final GoogleSignInAuthentication auth = await account.authentication;

      if (auth.accessToken == null) {
        onError?.call(signInFailed);
        return null;
      }

      final Map<String, String?> data = <String, String?>{
        'access_token': auth.accessToken,
      };

      final String googleSignInEndpoint =
          GetIt.I.get<AppConfig>().googleSignInEndpoint;

      final Response httpResponse = await client.callRESTAPI(
        endpoint: googleSignInEndpoint,
        method: RestAPIMethods.POST.name.toUpperCase(),
        variables: data,
      );

      final Map<String, dynamic> body =
          json.decode(httpResponse.body) as Map<String, dynamic>;

      if (httpResponse.statusCode >= 400) {
        final String? error = client.parseError(body);

        return onError?.call(error ?? defaultUserFriendlyMessage);
      }

      final LoginResponse loginResponse = LoginResponse.fromJson(body);

      // Update auth state
      dispatch(
        UpdateAuthStateAction(
          isSignedIn: true,
          accessToken: loginResponse.accessToken,
          refreshToken: loginResponse.refreshToken,
          expiresAt: loginResponse.accessToken,
        ),
      );

      dispatch(UpdateUserStateAction(user: loginResponse.user));

      onSuccess?.call();

      return state;
    } catch (e) {
      onError?.call(signInFailed);
    }
    return null;
  }
}
