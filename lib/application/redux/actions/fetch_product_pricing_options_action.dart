import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/update_host_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/states/host_state.dart';
import 'package:fullbooker/domain/core/entities/product_pricing_option_response.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class FetchProductPricingOptionsAction extends ReduxAction<AppState> {
  FetchProductPricingOptionsAction({
    this.onSuccess,
    this.onError,
    required this.client,
  });

  final Function(String error)? onError;
  final Function()? onSuccess;
  final ICustomClient client;

  @override
  Future<AppState?> reduce() async {
    final HostState? hostState = state.hostState;

    final WorkflowState? workflowState = hostState?.workflowState;
    final bool isEditing = workflowState == WorkflowState.VIEW;

    final String? ctxProductID = isEditing
        ? hostState?.selectedProduct?.id
        : hostState?.currentProduct?.id;

    final Map<String, dynamic> data = <String, dynamic>{
      'product': ctxProductID,
    };

    final Response httpResponse = await client.callRESTAPI(
      endpoint: GetIt.I.get<AppConfig>().productPricingOptionsEndpoint,
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

    final ProductPricingOptionResponse pricingOptionResponse =
        ProductPricingOptionResponse.fromJson(body);

    dispatch(
      UpdateHostStateAction(
        productPricingOptions: pricingOptionResponse.results,
      ),
    );

    return state;
  }
}
