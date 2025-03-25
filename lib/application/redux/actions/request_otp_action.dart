import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/update_onboarding_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class RequestOtpAction extends ReduxAction<AppState> {
  RequestOtpAction({
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

    final bool isEmailEmpty =
        resetEmailAddress.isEmpty || resetEmailAddress == UNKNOWN;

    if (isEmailEmpty) {
      return onError?.call(resetEmailPrompt);
    }

    final Map<String, String> data = <String, String>{
      'identifier': resetEmailAddress,
    };

    final String endpoint = GetIt.I.get<AppConfig>().requestOTPEndpoint;

    final Response httpResponse = await client.callRESTAPI(
      endpoint: endpoint,
      method: RestAPIMethods.POST.name.toUpperCase(),
      variables: data,
    );

    final Map<String, dynamic> body =
        json.decode(httpResponse.body) as Map<String, dynamic>;

    if (httpResponse.statusCode >= 400) {
      final String? error = client.parseError(body);

      return onError?.call(error ?? defaultUserFriendlyMessage);
    }

    final bool isOTPSent = body.containsKey('detail');

    if (!isOTPSent) {
      return onError?.call(errorSendingOTP);
    }

    // This will run but only show in dev mode
    final String otp = body['otp'];
    dispatch(UpdateOnboardingStateAction(resetPasswordDebugOTP: otp));

    if (kDebugMode) {
      debugPrint(otp);
    }

    onSuccess?.call();

    return state;
  }
}
