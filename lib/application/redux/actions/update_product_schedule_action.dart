import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/fetch_product_schedule_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/product_schedule.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class UpdateProductScheduleAction extends ReduxAction<AppState> {
  UpdateProductScheduleAction({
    this.onSuccess,
    this.onError,
    required this.client,
  });

  final Function(String error)? onError;
  final Function()? onSuccess;
  final ICustomClient client;

  @override
  Future<AppState?> reduce() async {
    final ProductSchedule? selectedSchedule = state.hostState?.selectedSchedule;

    final String startDate = selectedSchedule?.startDate ?? UNKNOWN;
    String startTime = selectedSchedule?.startTime ?? UNKNOWN;
    final String endDate = selectedSchedule?.endDate ?? UNKNOWN;
    String endTime = selectedSchedule?.endTime ?? UNKNOWN;
    final bool isAllDay = selectedSchedule?.isAllDay ?? false;

    if (isAllDay) {
      startTime = kStartOfDayTime;
      endTime = kEndOfDayTime;
    }

    if (startTime == UNKNOWN || endTime == UNKNOWN) {
      onError?.call(addDateTimeError);
      return null;
    }

    final bool repeats = selectedSchedule?.repeats ?? false;
    final String repeatOption =
        selectedSchedule?.repeatType?.toLowerCase() ?? kNoRepeatSchedule;

    final Map<String, dynamic> data = <String, dynamic>{
      'start_date': startDate,
      'start_time': startTime,
      'end_date': endDate,
      'end_time': endTime,
      'repeat': repeats ? repeatOption : kNoRepeatSchedule,
      'is_all_day': isAllDay,
    };

    if (repeats) {
      if (repeatOption == kWeeklyRepeatOption.toLowerCase()) {
        final List<RepeatWeeklySchedule> weekly =
            selectedSchedule?.repeatWeekly ?? <RepeatWeeklySchedule>[];

        data['repeat_on_days_of_week'] =
            weekly.map((RepeatWeeklySchedule day) => day.toJson()).toList();
      }

      if (repeatOption == kMonthlyRepeatOption.toLowerCase()) {
        data['repeat_on_date_of_month'] = selectedSchedule?.repeatMonthly;
      }

      if (repeatOption == kYearlyRepeatOption.toLowerCase()) {
        final List<RepeatYearlySchedule>? yearMonths =
            selectedSchedule?.repeatYearly;

        final List<Map<String, dynamic>> repeatOnMonthOfYear =
            yearMonths?.map((RepeatYearlySchedule e) => e.toJson()).toList() ??
                <Map<String, dynamic>>[];

        data['repeat_on_month_of_year'] = repeatOnMonthOfYear;
      }
    }

    final String scheduleID = selectedSchedule?.id ?? UNKNOWN;

    final String baseEndpoint =
        GetIt.I.get<AppConfig>().productScheduleEndpoint;

    final String fullEndpoint = '$baseEndpoint$scheduleID/';

    final Response httpResponse = await client.callRESTAPI(
      endpoint: fullEndpoint,
      method: APIMethods.PATCH.name.toUpperCase(),
      variables: data,
    );

    if (httpResponse.statusCode >= 400) {
      final Map<String, dynamic>? body =
          json.decode(httpResponse.body) as Map<String, dynamic>?;
      final String? error = client.parseError(body);
      onError?.call(error ?? defaultUserFriendlyMessage);
      return null;
    }

    dispatch(FetchProductScheduleAction(client: client));

    onSuccess?.call();

    return null;
  }
}
