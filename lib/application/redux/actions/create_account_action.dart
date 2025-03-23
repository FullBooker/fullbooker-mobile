import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/update_auth_state_action.dart';
import 'package:fullbooker/application/redux/actions/update_user_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/login_response.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/entities/processed_response.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class CreateAccountAction extends ReduxAction<AppState> {
  CreateAccountAction({
    this.onSuccess,
    this.onError,
    required this.client,
  });

  final Function(String error)? onError;
  final Function()? onSuccess;
  final ICustomClient client;

  @override
  Future<AppState?> reduce() async {
    final String firstName = state.onboardingState?.firstName ?? '';
    final String lastName = state.onboardingState?.lastName ?? '';
    final String newEmailAddress = state.onboardingState?.newEmailAddress ?? '';
    final String newPassword = state.onboardingState?.newPassword ?? '';

    final bool isFirstNameEmpty = firstName.isEmpty || firstName == UNKNOWN;
    final bool isLastNameEmpty = lastName.isEmpty || lastName == UNKNOWN;
    final bool isNewEmailEmpty =
        newEmailAddress.isEmpty || newEmailAddress == UNKNOWN;
    final bool isNewPasswordEmpty =
        newPassword.isEmpty || newPassword == UNKNOWN;

    if (isFirstNameEmpty ||
        isLastNameEmpty ||
        isNewPasswordEmpty ||
        isNewEmailEmpty) {
      return onError?.call(fillInAllFields);
    }

    final Map<String, String> data = <String, String>{
      'phone_number': '+254717356476',
      'email': newEmailAddress,
      'first_name': firstName,
      'last_name': lastName,
      'password': newPassword,
    };

    final String createAccountEndpoint =
        GetIt.I.get<AppConfig>().createAccountEndpoint;

    final Response httpResponse = await client.callRESTAPI(
      endpoint: createAccountEndpoint,
      method: RestAPIMethods.POST.name.toUpperCase(),
      variables: data,
    );

    final ProcessedResponse processedResponse =
        processHttpResponse(httpResponse);

    if (!processedResponse.ok) {
      return onError?.call(processedResponse.message ?? genericErrorString);
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
