import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class ChangePasswordAction extends ReduxAction<AppState> {
  ChangePasswordAction({
    this.onSuccess,
    this.onError,
    required this.client,
  });

  final Function(String error)? onError;
  final Function()? onSuccess;
  final ICustomClient client;

  @override
  Future<AppState?> reduce() async {
    final String resetEmailAddress =
        state.onboardingState?.resetEmailAddress ?? '';
    final String password = state.onboardingState?.resetPassword ?? '';
    final String confirmPassword =
        state.onboardingState?.resetPasswordConfirm ?? '';

    final bool isPasswordEmpty = password.isEmpty || password == UNKNOWN;
    final bool isConformPasswordEmpty =
        confirmPassword.isEmpty || confirmPassword == UNKNOWN;

    if (isPasswordEmpty ||
        isConformPasswordEmpty ||
        (password != confirmPassword)) {
      return onError?.call(setPasswordPrompt);
    }

    final Map<String, String> data = <String, String>{
      'identifier': resetEmailAddress,
      'password': password,
    };

    final String endpoint = GetIt.I.get<AppConfig>().changePasswordEndpoint;

    final Response httpResponse = await client.callRESTAPI(
      endpoint: endpoint,
      authenticated: false,
      method: APIMethods.POST.name.toUpperCase(),
      variables: data,
    );

    final Map<String, dynamic> body =
        json.decode(httpResponse.body) as Map<String, dynamic>;

    if (httpResponse.statusCode >= 400) {
      final String? error = client.parseError(body);

      return onError?.call(error ?? defaultUserFriendlyMessage);
    }

    final bool isPasswordChanged = body.containsKey('detail');

    if (!isPasswordChanged) {
      return onError?.call(errorVerifyingOTP);
    }

    onSuccess?.call();

    return state;
  }
}
