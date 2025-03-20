import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/update_auth_state_action.dart';
import 'package:fullbooker/application/redux/actions/update_user_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/login_response.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/endpoints.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/entities/processed_response.dart';
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

      final Response httpResponse = await client.callRESTAPI(
        // TODO(abiud): extract the endpoint from AppConfig
        endpoint: loginEndpoint,
        method: RestAPIMethods.POST.name.toUpperCase(),
        variables: data,
      );

      final ProcessedResponse processedResponse =
          processHttpResponse(httpResponse);

      if (!processedResponse.ok) {
        onError?.call(processedResponse.message ?? genericErrorString);
        return null;
      }

      final Map<String, dynamic> body =
          json.decode(processedResponse.response.body) as Map<String, dynamic>;

      final LoginResponse loginResponse = LoginResponse.fromJson(body);

      // Update the auth state
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
