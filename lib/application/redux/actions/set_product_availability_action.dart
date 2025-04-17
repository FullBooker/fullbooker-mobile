import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/update_host_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/entities/product_schedule.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class SetProductScheduleAction extends ReduxAction<AppState> {
  SetProductScheduleAction({
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
    final String start =
        state.hostState?.currentProduct?.schedule?.start ?? UNKNOWN;
    final String startTime =
        state.hostState?.currentProduct?.schedule?.startTime ?? UNKNOWN;
    final String end =
        state.hostState?.currentProduct?.schedule?.end ?? UNKNOWN;
    final String endTime =
        state.hostState?.currentProduct?.schedule?.endTime ?? UNKNOWN;

    if (productID == UNKNOWN ||
        start == UNKNOWN ||
        startTime == UNKNOWN ||
        end == UNKNOWN ||
        endTime == UNKNOWN) {
      onError?.call(addDateTimeError);

      return null;
    }

    final Map<String, String> data = <String, String>{
      'product': productID,
      'start': start,
      'start_time': startTime,
      'end': end,
      'end_time': endTime,
    };

    final Response httpResponse = await client.callRESTAPI(
      endpoint: GetIt.I.get<AppConfig>().ProductScheduleEndpoint,
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

    final ProductSchedule savedSchedule = ProductSchedule.fromJson(body);

    final Product? newCurrent = state.hostState?.currentProduct?.copyWith.call(
      schedule: savedSchedule,
    );

    dispatch(UpdateHostStateAction(currentProduct: newCurrent));

    onSuccess?.call();

    return state;
  }
}
