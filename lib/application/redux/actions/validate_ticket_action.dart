import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/update_host_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class ValidateTicketAction extends ReduxAction<AppState> {
  ValidateTicketAction({
    required this.client,
    required this.onResult,
  });

  final ICustomClient client;
  final void Function(bool isValid) onResult;

  @override
  Future<AppState?> reduce() async {
    final String ticketID = state.hostState?.currentScannedTicketID ?? UNKNOWN;
    final String endpoint =
        '${GetIt.I.get<AppConfig>().validateTicketsEndpoint}/$ticketID';

    final Response httpResponse = await client.callRESTAPI(
      endpoint: endpoint,
      method: APIMethods.GET.name,
    );

    final Map<String, dynamic> body =
        json.decode(httpResponse.body) as Map<String, dynamic>;

    final String message = body['message']?.toString().toLowerCase() ?? '';

    final bool isValid = message.contains('valid ticket');

    dispatch(UpdateHostStateAction(isValidTicket: isValid));
    onResult(isValid);
    return null;
  }
}
