import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/fetch_single_product_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/states/host_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/currency.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';
import 'package:fullbooker/domain/core/entities/product_pricing_option.dart';
import 'package:fullbooker/domain/core/entities/ticket_type.dart';
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
    final HostState? hostState = state.hostState;

    final ProductPricing? selectedPricing = hostState?.selectedProductPricing;
    final Currency? selectedCurrency = hostState?.selectedCurrency;
    final ProductPricingOption? selectedPricingOption =
        hostState?.selectedProductPricingOption;

    final TicketType? chosenTicketType = state.hostState?.selectedTicketType;

    final WorkflowState? workflowState = hostState?.workflowState;
    final bool isEditing = workflowState == WorkflowState.VIEW;

    final String? ctxProductID = isEditing
        ? hostState?.selectedProduct?.id
        : hostState?.currentProduct?.id;

    final Map<String, dynamic> data = <String, dynamic>{
      'product': ctxProductID,
      'currency': selectedCurrency?.id ?? UNKNOWN,
      'cost': selectedPricing?.cost,
      'type': selectedPricing?.type ?? kTicketPricingType,
      'ticket_tier': chosenTicketType?.name?.toLowerCase(),
      'pricing_option': selectedPricingOption?.id,
      'maximum_number_of_tickets': selectedPricing?.maxTickets,
      'buyer_to_pay_service_fee': selectedPricing?.buyerPaysFee,
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

    dispatch(FetchSingleProductAction(client: client));

    onSuccess?.call();

    return null;
  }
}
