import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/update_host_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/product_booking_tickets_response.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class FetchBookingTicketsAction extends ReduxAction<AppState> {
  FetchBookingTicketsAction({
    this.onSuccess,
    this.onError,
    required this.client,
  });

  final Function(String error)? onError;
  final Function()? onSuccess;
  final ICustomClient client;

  @override
  Future<AppState?> reduce() async {
    final String bookingID = state.hostState?.selectedBooking?.id ?? UNKNOWN;

    final Map<String, dynamic> data = <String, dynamic>{
      'booking': bookingID,
    };

    final Response httpResponse = await client.callRESTAPI(
      endpoint: GetIt.I.get<AppConfig>().ticketsEndpoint,
      method: APIMethods.GET.name.toUpperCase(),
      queryParams: data,
    );

    final Map<String, dynamic> body =
        json.decode(httpResponse.body) as Map<String, dynamic>;

    if (httpResponse.statusCode >= 400) {
      final String? error = client.parseError(body);

      onError?.call(error ?? defaultUserFriendlyMessage);

      return null;
    }

    final ProductBookingTicketsResponse ticketsResponse =
        ProductBookingTicketsResponse.fromJson(body);

    dispatch(
      UpdateHostStateAction(selectedBookingTickets: ticketsResponse.results),
    );

    return null;
  }
}
