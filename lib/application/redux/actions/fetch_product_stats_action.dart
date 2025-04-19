import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/update_selected_product_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/product_stats.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class FetchProductStatsAction extends ReduxAction<AppState> {
  FetchProductStatsAction({
    this.onSuccess,
    this.onError,
    required this.client,
  });

  final Function(String error)? onError;
  final Function()? onSuccess;
  final ICustomClient client;

  @override
  Future<AppState?> reduce() async {
    final String productID = state.hostState?.selectedProduct?.id ?? UNKNOWN;

    final String baseEndpoint = GetIt.I.get<AppConfig>().getProductsEndpoint;

    final String fullEndpoint = '$baseEndpoint$productID/stats/';

    final Response httpResponse = await client.callRESTAPI(
      endpoint: fullEndpoint,
      method: APIMethods.GET.name.toUpperCase(),
    );

    final Map<String, dynamic> body =
        json.decode(httpResponse.body) as Map<String, dynamic>;

    if (httpResponse.statusCode >= 400) {
      final String? error = client.parseError(body);

      onError?.call(error ?? defaultUserFriendlyMessage);

      return null;
    }

    final ProductStats stats = ProductStats.fromJson(body);

    dispatch(UpdateSelectedProductAction(stats: stats));

    return state;
  }
}
