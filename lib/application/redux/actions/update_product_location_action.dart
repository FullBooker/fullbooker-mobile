import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/update_host_state_action.dart';
import 'package:fullbooker/application/redux/actions/update_product_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/product_location.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class UpdateProductLocationAction extends ReduxAction<AppState> {
  UpdateProductLocationAction({
    this.onSuccess,
    this.onError,
    required this.client,
  });

  final Function(String error)? onError;
  final Function()? onSuccess;
  final ICustomClient client;

  @override
  Future<AppState?> reduce() async {
    final ProductLocation? selectedLocation = state.hostState?.selectedLocation;

    final String lat = selectedLocation?.lat ?? UNKNOWN;
    final String long = selectedLocation?.long ?? UNKNOWN;
    final String address = selectedLocation?.address ?? UNKNOWN;
    final String city = selectedLocation?.city ?? UNKNOWN;
    final String coordinates = selectedLocation?.coordinates ?? UNKNOWN;
    final String locationID = selectedLocation?.id ?? UNKNOWN;

    final String baseEndpoint =
        GetIt.I.get<AppConfig>().productLocationEndpoint;

    final String fullEndpoint = '$baseEndpoint$locationID/';

    if (lat == UNKNOWN || long == UNKNOWN) {
      onError?.call(addLocationError);

      return null;
    }

    final Map<String, String> data = <String, String>{
      'lat': lat,
      'long': long,
      'address': address,
      'city': city,
      'coordinates': coordinates,
    };

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

    final ProductLocation updatedLocation = ProductLocation.fromJson(body);

    final List<ProductLocation> newLocations =
        state.hostState?.selectedProduct?.locations
                ?.map(
                  (ProductLocation loc) =>
                      loc.id == updatedLocation.id ? updatedLocation : loc,
                )
                .toList() ??
            <ProductLocation>[];

    dispatchAll(<ReduxAction<AppState>>[
      UpdateProductAction(locations: newLocations),
      UpdateHostStateAction(selectedLocation: updatedLocation),
    ]);

    onSuccess?.call();

    return null;
  }
}
