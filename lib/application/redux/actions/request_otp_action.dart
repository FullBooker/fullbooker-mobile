import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/entities/processed_response.dart';
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
    final String emailAddress = state.onboardingState?.emailAddress ?? '';

    final bool isEmailEmpty = emailAddress.isEmpty || emailAddress == UNKNOWN;

    if (isEmailEmpty) {
      return onError?.call(resetEmailPrompt);
    }

    final Map<String, String> data = <String, String>{
      'identifier': emailAddress,
    };

    final String endpoint = GetIt.I.get<AppConfig>().requestOTPEndpoint;

    final Response httpResponse = await client.callRESTAPI(
      endpoint: endpoint,
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

    final bool isOTPSent = body.containsKey('detail');

    if (kDebugMode) {
      debugPrint(body['otp']);
    }

    if (!isOTPSent) {
      return onError?.call(errorSendingOTP);
    }

    onSuccess?.call();

    return state;
  }
}
