import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/update_selected_product_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/product_bookings_response.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class FetchProductBookingsAction extends ReduxAction<AppState> {
  FetchProductBookingsAction({
    this.onDone,
    this.onError,
    required this.client,
    this.searchParam,
  });

  final Function(String error)? onError;
  final Function()? onDone;
  final ICustomClient client;
  final String? searchParam;

  @override
  Future<AppState?> reduce() async {
    final String productID = state.hostState?.selectedProduct?.id ?? UNKNOWN;

    final bool isSearching = searchParam != null && searchParam != UNKNOWN;

    final Map<String, dynamic> queryParams = <String, dynamic>{
      'product': productID,
      'status': BookingStatus.completed.name,
      if (isSearching) 'search': searchParam,
    };

    final Response httpResponse = await client.callRESTAPI(
      endpoint: GetIt.I.get<AppConfig>().bookingsEndpoint,
      method: APIMethods.GET.name.toUpperCase(),
      queryParams: queryParams,
    );

    final Map<String, dynamic> body =
        json.decode(httpResponse.body) as Map<String, dynamic>;

    if (httpResponse.statusCode >= 400) {
      final String? error = client.parseError(body);

      onError?.call(error ?? defaultUserFriendlyMessage);

      return null;
    }

    final ProductBookingsResponse bookingsResponse =
        ProductBookingsResponse.fromJson(body);

    dispatch(
      UpdateSelectedProductAction(bookings: bookingsResponse.results),
    );

    onDone?.call();

    return null;
  }
}
