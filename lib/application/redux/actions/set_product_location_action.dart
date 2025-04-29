import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/update_host_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/entities/product_location.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class SetProductLocationAction extends ReduxAction<AppState> {
  SetProductLocationAction({
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
    final String currentProductID =
        state.hostState?.currentProduct?.id ?? UNKNOWN;
    final String selectedProductID =
        state.hostState?.selectedProduct?.id ?? UNKNOWN;

    final bool isCreate = workflowState == WorkflowState.VIEW;

    final String ctxProductID = isCreate ? selectedProductID : currentProductID;

    final String lat = state.hostState?.selectedLocation?.lat ?? UNKNOWN;
    final String long = state.hostState?.selectedLocation?.long ?? UNKNOWN;
    final String address =
        state.hostState?.selectedLocation?.address ?? UNKNOWN;

    if (ctxProductID == UNKNOWN || lat == UNKNOWN || long == UNKNOWN) {
      onError?.call(addLocationError);

      return null;
    }

    final Map<String, String> data = <String, String>{
      'product': ctxProductID,
      'lat': lat,
      'long': long,
      'address': address,
    };

    final Response httpResponse = await client.callRESTAPI(
      endpoint: GetIt.I.get<AppConfig>().productLocationEndpoint,
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

    final ProductLocation savedProductLocation = ProductLocation.fromJson(body);

    final Product? updatedProduct =
        state.hostState?.currentProduct?.copyWith.call(
      locations: <ProductLocation>[
        ...?state.hostState?.currentProduct?.locations,
        savedProductLocation,
      ],
    );

    dispatch(UpdateHostStateAction(contextProduct: updatedProduct));

    onSuccess?.call();

    return null;
  }
}
