import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/update_host_product_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/host_product_response.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class FetchProductsAction extends ReduxAction<AppState> {
  FetchProductsAction({
    this.onSuccess,
    this.onError,
    required this.client,
    this.searchParam,
    this.productStatus,
    this.onDone,
  });

  final Function(String error)? onError;
  final Function()? onSuccess;
  final ICustomClient client;
  final Function? onDone;
  final ProductStatus? productStatus;
  final String? searchParam;

  @override
  Future<AppState?> reduce() async {
    final bool isSearching = searchParam != null && searchParam != UNKNOWN;

    final Map<String, String?> queryParams = <String, String?>{
      'page': '1',
      'page_size': '30',
      if (isSearching) 'search': searchParam,
      if (productStatus != null) 'status': productStatus?.apiValue,
    };

    final Response httpResponse = await client.callRESTAPI(
      endpoint: GetIt.I.get<AppConfig>().getProductsEndpoint,
      method: APIMethods.GET.name.toUpperCase(),
      queryParams: queryParams,
    );

    final Map<String, dynamic> body =
        json.decode(httpResponse.body) as Map<String, dynamic>;

    if (httpResponse.statusCode >= 400) {
      final String? error = client.parseError(body);

      onError?.call(error ?? defaultUserFriendlyMessage);

      return null;
    }

    final HostProductResponse productsResponse =
        HostProductResponse.fromJson(body);

    dispatch(UpdateHostProductAction(products: productsResponse.results));

    onDone?.call();

    return null;
  }
}
