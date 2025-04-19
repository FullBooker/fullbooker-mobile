import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/fetch_single_product_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/currency.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class SaveProductPricingAction extends ReduxAction<AppState> {
  SaveProductPricingAction({
    this.onSuccess,
    this.onError,
    required this.client,
  });

  final Function(String error)? onError;
  final Function()? onSuccess;
  final ICustomClient client;

  @override
  Future<AppState?> reduce() async {
    final String productID = state.hostState?.currentProduct?.id ?? UNKNOWN;
    final ProductPricing? selectedPricing =
        state.hostState?.selectedProductPricing;
    final Currency? selectedCurrency = state.hostState?.selectedCurrency;

    final Map<String, dynamic> data = <String, dynamic>{
      'product': productID,
      'currency': selectedCurrency?.id ?? UNKNOWN,
      'cost': selectedPricing?.cost,
      'type': selectedPricing?.type,
      'ticket_tier': selectedPricing?.ticketTier,
      'maximum_number_of_tickets': selectedPricing?.maxTickets,
    };

    final String endpoint = GetIt.I.get<AppConfig>().productPricingEndpoint;

    final Response httpResponse = await client.callRESTAPI(
      endpoint: endpoint,
      method: APIMethods.POST.name.toUpperCase(),
      variables: data,
    );

    final Map<String, dynamic> body =
        json.decode(httpResponse.body) as Map<String, dynamic>;

    if (httpResponse.statusCode >= 400) {
      final String? error = client.parseError(body);

      onError?.call(error ?? defaultUserFriendlyMessage);

      return null;
    }

    dispatch(
      FetchSingleProductAction(
        client: client,
        workflowState: WorkflowState.CREATE,
      ),
    );

    onSuccess?.call();

    return state;
  }
}
