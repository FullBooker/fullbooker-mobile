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

class VerifyOTPAction extends ReduxAction<AppState> {
  VerifyOTPAction({
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
    final String otp = state.onboardingState?.resetPasswordOTP ?? '';

    final bool isOTPEmpty = otp.isEmpty || otp == UNKNOWN;

    if (isOTPEmpty) {
      onError?.call(otpEmptyPrompt);

      return null;
    }

    final Map<String, String> data = <String, String>{
      'identifier': resetEmailAddress,
      'otp': otp,
    };

    final Response httpResponse = await client.callRESTAPI(
      endpoint: GetIt.I.get<AppConfig>().verifyOTPEndpoint,
      authenticated: false,
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

    final bool isOTPVerified = body.containsKey('detail');

    if (!isOTPVerified) {
      onError?.call(errorVerifyingOTP);

      return null;
    }

    onSuccess?.call();

    return state;
  }
}
