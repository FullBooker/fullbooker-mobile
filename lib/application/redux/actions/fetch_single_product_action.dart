import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/update_host_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class FetchSingleProductAction extends ReduxAction<AppState> {
  FetchSingleProductAction({
    this.onSuccess,
    this.onError,
    required this.client,
    required this.workflowState,
  });

  final Function(String error)? onError;
  final Function()? onSuccess;
  final ICustomClient client;
  final WorkflowState workflowState;

  @override
  Future<AppState?> reduce() async {
    final String selectProductID =
        state.hostState?.selectedProduct?.id ?? UNKNOWN;
    final String currentProductID =
        state.hostState?.currentProduct?.id ?? UNKNOWN;

    final bool isEdit = workflowState == WorkflowState.CREATE;

    final String ctxProductId = isEdit ? currentProductID : selectProductID;

    final String baseEndpoint = GetIt.I.get<AppConfig>().getProductsEndpoint;

    final String fullEndpoint = '$baseEndpoint/$ctxProductId';

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

    final Product productResponse = Product.fromJson(body);

    if (isEdit) {
      dispatch(UpdateHostStateAction(currentProduct: productResponse));
      return state;
    } else {
      dispatch(UpdateHostStateAction(selectedProduct: productResponse));
      return state;
    }
  }
}
