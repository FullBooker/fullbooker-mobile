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
  });

  final Function(String error)? onError;
  final Function()? onSuccess;
  final ICustomClient client;

  @override
  Future<AppState?> reduce() async {
    final String productID = state.hostState?.currentProduct?.id ?? UNKNOWN;
    final String lat =
        state.hostState?.currentProduct?.selectedLocation?.lat ?? UNKNOWN;
    final String long =
        state.hostState?.currentProduct?.selectedLocation?.long ?? UNKNOWN;
    final String address =
        state.hostState?.currentProduct?.selectedLocation?.address ?? UNKNOWN;

    if (productID == UNKNOWN || lat == UNKNOWN || long == UNKNOWN) {
      return onError?.call(addLocationError);
    }

    final Map<String, String> data = <String, String>{
      'product': productID,
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

      return onError?.call(error ?? defaultUserFriendlyMessage);
    }

    final ProductLocation savedProductLocation = ProductLocation.fromJson(body);

    final Product? newCurrent = state.hostState?.currentProduct?.copyWith.call(
      locations: <ProductLocation>[
        ...?state.hostState?.currentProduct?.locations,
        savedProductLocation,
      ],
    );

    dispatch(UpdateHostStateAction(currentProduct: newCurrent));

    onSuccess?.call();

    return state;
  }
}
