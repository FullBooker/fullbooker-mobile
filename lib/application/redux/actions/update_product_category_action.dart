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

class UpdateProductCategoryAction extends ReduxAction<AppState> {
  UpdateProductCategoryAction({
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
    final String subcategory =
        state.hostState?.selectedProduct?.selectedProductSubCategory?.id ??
            UNKNOWN;

    if (subcategory == UNKNOWN) {
      onError?.call(createProductError);

      return null;
    }

    final Map<String, String> data = <String, String>{
      'product': productID,
      'subcategory': subcategory,
    };

    final String baseEndpoint = GetIt.I.get<AppConfig>().getProductsEndpoint;
    final String fullEndpoint = '$baseEndpoint$productID/';

    final Response httpResponse = await client.callRESTAPI(
      endpoint: fullEndpoint,
      method: APIMethods.PATCH.name.toUpperCase(),
      variables: data,
    );

    final Map<String, dynamic> body =
        json.decode(httpResponse.body) as Map<String, dynamic>;

    if (httpResponse.statusCode >= 400) {
      final String? error = client.parseError(body);

      onError?.call(error ?? defaultUserFriendlyMessage);

      return null;
    }

    final Product createdProduct = Product.fromJson(body);

    dispatch(UpdateHostStateAction(contextProduct: createdProduct));

    onSuccess?.call();

    return null;
  }
}
