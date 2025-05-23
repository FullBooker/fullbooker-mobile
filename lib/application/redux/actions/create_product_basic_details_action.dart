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

class CreateProductBasicDetailsAction extends ReduxAction<AppState> {
  CreateProductBasicDetailsAction({
    this.onSuccess,
    this.onError,
    required this.client,
  });

  final Function(String error)? onError;
  final Function()? onSuccess;
  final ICustomClient client;

  @override
  Future<AppState?> reduce() async {
    final String name = state.hostState?.currentProduct?.name ?? UNKNOWN;
    final String description =
        state.hostState?.currentProduct?.description ?? '';
    final String subcategory =
        state.hostState?.currentProduct?.selectedProductSubCategory?.id ??
            UNKNOWN;

    if (name == UNKNOWN || subcategory == UNKNOWN) {
      onError?.call(createProductError);

      return null;
    }

    final Map<String, String> data = <String, String>{
      'name': name,
      'description': description,
      'subcategory': subcategory,
    };

    final String endpoint = GetIt.I.get<AppConfig>().getProductsEndpoint;

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

    final Product createdProduct = Product.fromJson(body);

    dispatch(UpdateHostStateAction(contextProduct: createdProduct));

    onSuccess?.call();

    return state;
  }
}
