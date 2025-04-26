import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/update_current_product_action.dart';
import 'package:fullbooker/application/redux/actions/update_host_state_action.dart';
import 'package:fullbooker/application/redux/actions/update_selected_product_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/product_schedule.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class FetchProductSchedulesAction extends ReduxAction<AppState> {
  FetchProductSchedulesAction({
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
    final String scheduleID =
        state.hostState?.selectedProduct?.scheduleID ?? UNKNOWN;

    final String scheduleEndpoint =
        GetIt.I.get<AppConfig>().productScheduleEndpoint;

    final String fullEndpoint = '$scheduleEndpoint$scheduleID/';

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

    final ProductSchedule scheduleResponse = ProductSchedule.fromJson(body);

    if (workflowState == WorkflowState.CREATE) {
      dispatchAll(<ReduxAction<AppState>>[
        UpdateCurrentProductAction(schedule: scheduleResponse),
        UpdateHostStateAction(selectedSchedule: scheduleResponse),
      ]);
    } else {
      dispatchAll(<ReduxAction<AppState>>[
        UpdateSelectedProductAction(schedule: scheduleResponse),
        UpdateHostStateAction(selectedSchedule: scheduleResponse),
      ]);
    }

    return null;
  }
}
