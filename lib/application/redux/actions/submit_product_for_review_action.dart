import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/fetch_single_product_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class SubmitProductForReviewAction extends ReduxAction<AppState> {
  SubmitProductForReviewAction({
    this.onSuccess,
    this.onError,
    required this.client,
  });

  final Function(String error)? onError;
  final Function()? onSuccess;
  final ICustomClient client;

  @override
  Future<AppState?> reduce() async {
    final Product? selectProduct = state.hostState?.selectedProduct;
    final Product? currentProduct = state.hostState?.currentProduct;

    final WorkflowState workflowState =
        state.hostState?.workflowState ?? WorkflowState.CREATE;
    final bool isCreate = workflowState == WorkflowState.CREATE;

    final Product? ctxProduct = isCreate ? currentProduct : selectProduct;

    final String productId = ctxProduct?.id ?? UNKNOWN;

    final bool termsAccepted = ctxProduct?.termsAccepted ?? false;

    if (!termsAccepted) {
      onError?.call(acceptTermsToContinue);

      return null;
    }

    final Map<String, dynamic> data = <String, dynamic>{
      'product_id': productId,
      'status_to': 'REVIEW',
      'terms_accepted': termsAccepted,
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

    dispatch(FetchSingleProductAction(client: client));

    onSuccess?.call();

    return null;
  }
}
