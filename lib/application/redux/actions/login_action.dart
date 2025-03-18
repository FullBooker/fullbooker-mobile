import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/custom_client.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/endpoints.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/entities/processed_response.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class LoginAction extends ReduxAction<AppState> {
  LoginAction({
    this.onSuccess,
    this.onError,
  });

  final Function(String error)? onError;
  final Function()? onSuccess;

  @override
  Future<AppState?> reduce() async {
    final String emailAddress = state.onboardingState?.emailAddress ?? '';
    final String password = state.onboardingState?.password ?? '';
    final CustomClient client = GetIt.I.get<CustomClient>();

    if (emailAddress.isEmpty || password.isEmpty) {
      return onError?.call(credentialsPrompt);
    }

    final Map<String, String> data = <String, String>{
      'phone_number': emailAddress,
      'password': password,
    };

    final Response httpResponse = await client.callRESTAPI(
      endpoint: loginEndpoint,
      method: RestAPIMethods.POST.name.toUpperCase(),
      variables: data,
    );

    final ProcessedResponse processedResponse =
        processHttpResponse(httpResponse);

    if (processedResponse.ok) {
      // TODO(abiud): process the user profile from the backend here
    }

    return null;
  }
}
