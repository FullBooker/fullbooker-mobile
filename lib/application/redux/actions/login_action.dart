import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/update_auth_state_action.dart';
import 'package:fullbooker/application/redux/actions/update_user_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/login_response.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/endpoints.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/entities/processed_response.dart';
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
  Future<AppState?> reduce() async {
    final String emailAddress = state.onboardingState?.emailAddress ?? '';
    final String password = state.onboardingState?.password ?? '';

    final bool isEmailEmpty = emailAddress.isEmpty || emailAddress == UNKNOWN;
    final bool isPasswordEmpty = password.isEmpty || password == UNKNOWN;

    if (isEmailEmpty || isPasswordEmpty) {
      return onError?.call(credentialsPrompt);
    }

    final Map<String, String> data = <String, String>{
      'email': emailAddress,
      'password': password,
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
  }
}
