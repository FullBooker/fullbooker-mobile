import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/set_sign_in_method_action.dart';
import 'package:fullbooker/application/redux/actions/update_auth_state_action.dart';
import 'package:fullbooker/application/redux/actions/update_user_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/login_response.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class LoginAction extends ReduxAction<AppState> {
  LoginAction({
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
    final String emailAddress = state.onboardingState?.emailAddress ?? '';
    final String password = state.onboardingState?.password ?? '';

    final bool isEmailEmpty = emailAddress.isEmpty || emailAddress == UNKNOWN;
    final bool isPasswordEmpty = password.isEmpty || password == UNKNOWN;

    if (isEmailEmpty || isPasswordEmpty) {
      onError?.call(credentialsPrompt);

      return null;
    }

    final Map<String, String> data = <String, String>{
      'email': emailAddress,
      'password': password,
    };

    final String loginEndpoint = GetIt.I.get<AppConfig>().loginEndpoint;

    final Response httpResponse = await client.callRESTAPI(
      authenticated: false,
      endpoint: loginEndpoint,
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

    final LoginResponse loginResponse = LoginResponse.fromJson(body);

    dispatch(
      UpdateAuthStateAction(
        isSignedIn: true,
        accessToken: loginResponse.accessToken,
        refreshToken: loginResponse.refreshToken,
        expiresAt: loginResponse.expiresAt,
      ),
    );

    dispatch(UpdateUserStateAction(user: loginResponse.user));

    onSuccess?.call();

    return null;
  }
}
