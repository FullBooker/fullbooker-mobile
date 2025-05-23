import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/update_host_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product_pricing_option.dart';
import 'package:fullbooker/domain/core/entities/ticket_type_response.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class FetchTicketTypesAction extends ReduxAction<AppState> {
  FetchTicketTypesAction({
    this.onSuccess,
    this.onError,
    required this.client,
  });

  final Function(String error)? onError;
  final Function()? onSuccess;
  final ICustomClient client;

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> data = <String, dynamic>{
      'page': 1,
      'page_size': 20,
    };

    final ProductPricingOption? selectedPricingOption =
        state.hostState?.selectedProductPricingOption;

    final Response httpResponse = await client.callRESTAPI(
      endpoint: GetIt.I.get<AppConfig>().ticketTypesEndpoint,
      method: APIMethods.GET.name.toUpperCase(),
      variables: data,
    );

    final Map<String, dynamic> body =
        json.decode(httpResponse.body) as Map<String, dynamic>;

    if (httpResponse.statusCode >= 400) {
      final String? error = client.parseError(body);

      onError?.call(error ?? defaultUserFriendlyMessage);

      return null;
    }

    final TicketTypeResponse ticketTypeResponse =
        TicketTypeResponse.fromJson(body);

    dispatch(
      UpdateHostStateAction(ticketTypes: ticketTypeResponse.results),
    );

    return state;
  }
}
