import 'dart:async';
import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/fetch_product_pricing_options_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/states/host_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class SetProductPricingOptionsAction extends ReduxAction<AppState> {
  SetProductPricingOptionsAction({
    this.onSuccess,
    this.onError,
    required this.client,
  });

  final Function(String error)? onError;
  final Function()? onSuccess;
  final ICustomClient client;

  @override
  void after() {
    dispatch(FetchProductPricingOptionsAction(client: client));

    return super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final HostState? hostState = state.hostState;

    final WorkflowState? workflowState = hostState?.workflowState;
    final bool isEditing = workflowState == WorkflowState.VIEW;

    final String? ctxProductID = isEditing
        ? hostState?.selectedProduct?.id
        : hostState?.currentProduct?.id;

    final List<String?> selectedOptionIds =
        state.hostState?.selectedPricingOptionIds ?? <String?>[];

    if (ctxProductID == UNKNOWN || (selectedOptionIds.isEmpty)) {
      onError?.call(addProductPricingOptionErrorMsg);

      return null;
    }

    final String endpoint =
        GetIt.I.get<AppConfig>().productPricingOptionsEndpoint;

    for (final String? optionId in selectedOptionIds) {
      final Map<String, dynamic> payload = <String, dynamic>{
        'product': ctxProductID,
        'pricing_option': optionId!,
      };

      final Response response = await client.callRESTAPI(
        endpoint: endpoint,
        method: APIMethods.POST.name,
        variables: payload,
      );

      final Map<String, dynamic> body =
          json.decode(response.body) as Map<String, dynamic>;

      if (response.statusCode >= 400) {
        final String? error = client.parseError(body);
        onError?.call(error ?? defaultUserFriendlyMessage);
        return null;
      }
    }

    onSuccess?.call();

    return null;
  }
}
