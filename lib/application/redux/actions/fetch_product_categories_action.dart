import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/set_product_categories_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product_category_response.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class FetchProductCategoriesAction extends ReduxAction<AppState> {
  FetchProductCategoriesAction({
    this.onSuccess,
    this.onError,
    required this.client,
  });

  final Function(String error)? onError;
  final Function()? onSuccess;
  final ICustomClient client;

  @override
  Future<AppState?> reduce() async {
    final String endpoint = GetIt.I.get<AppConfig>().productCategoriesEndpoint;

    final Response httpResponse = await client.callRESTAPI(
      endpoint: endpoint,
      method: APIMethods.GET.name.toUpperCase(),
    );

    final Map<String, dynamic> body =
        json.decode(httpResponse.body) as Map<String, dynamic>;

    if (httpResponse.statusCode >= 400) {
      final String? error = client.parseError(body);

      return onError?.call(error ?? defaultUserFriendlyMessage);
    }

    final ProductCategoryResponse productsResponse =
        ProductCategoryResponse.fromJson(body);

    dispatch(
      SetProductCategoriesAction(
        productCategories: productsResponse.results,
      ),
    );

    return state;
  }
}
