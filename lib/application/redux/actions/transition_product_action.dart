import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/fetch_products_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class TransitionProductAction extends ReduxAction<AppState> {
  TransitionProductAction({
    this.onSuccess,
    this.onError,
    required this.client,
    required this.statusTo,
    required this.reason,
  });

  final Function(String error)? onError;
  final Function()? onSuccess;
  final ICustomClient client;
  final ProductStatus statusTo;
  final String? reason;

  @override
  Future<AppState?> reduce() async {
    final String selectProductID =
        state.hostState?.selectedProduct?.id ?? UNKNOWN;

    final Map<String, dynamic> data = <String, dynamic>{
      'product_id': selectProductID,
      'status_to': statusTo.name.toUpperCase(),
      'reason': reason ?? noReasonProvided,
    };

    final String endpoint = GetIt.I.get<AppConfig>().productTransitionEndpoint;

    final Response httpResponse = await client.callRESTAPI(
      endpoint: endpoint,
      method: APIMethods.POST.name.toUpperCase(),
      variables: data,
    );

    if (httpResponse.statusCode >= 400) {
      final Map<String, dynamic> body =
          json.decode(httpResponse.body) as Map<String, dynamic>;

      final String? error = client.parseError(body);

      onError?.call(error ?? defaultUserFriendlyMessage);

      return null;
    }

    dispatch(FetchProductsAction(client: client));

    onSuccess?.call();

    return null;
  }
}
