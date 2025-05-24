import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/update_product_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/product_pricing_response.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class FetchProductPricingAction extends ReduxAction<AppState> {
  FetchProductPricingAction({
    this.onSuccess,
    this.onError,
    required this.client,
  });

  final Function(String error)? onError;
  final Function()? onSuccess;
  final ICustomClient client;

  @override
  Future<AppState?> reduce() async {
    final String selectProductID =
        state.hostState?.selectedProduct?.id ?? UNKNOWN;

    final String currentProductID =
        state.hostState?.currentProduct?.id ?? UNKNOWN;

    final WorkflowState workflowState =
        state.hostState?.workflowState ?? WorkflowState.CREATE;

    final bool isCreate = workflowState == WorkflowState.CREATE;

    final Map<String, dynamic> params = <String, dynamic>{
      'product': isCreate ? currentProductID : selectProductID,
    };

    final Response httpResponse = await client.callRESTAPI(
      endpoint: GetIt.I.get<AppConfig>().productPricingEndpoint,
      method: APIMethods.GET.name.toUpperCase(),
      queryParams: params,
    );

    final Map<String, dynamic> body =
        json.decode(httpResponse.body) as Map<String, dynamic>;

    if (httpResponse.statusCode >= 400) {
      final String? error = client.parseError(body);

      onError?.call(error ?? defaultUserFriendlyMessage);

      return null;
    }

    final ProductPricingResponse productPricingResponse =
        ProductPricingResponse.fromJson(body);

    dispatch(
      UpdateProductAction(pricing: productPricingResponse.results),
    );

    return null;
  }
}
