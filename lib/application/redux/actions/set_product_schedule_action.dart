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
    final Product? product = state.hostState?.currentProduct;
    final ProductSchedule? selectedSchedule = state.hostState?.selectedSchedule;

    final String productID = product?.id ?? UNKNOWN;
    final String startDate = selectedSchedule?.startDate ?? UNKNOWN;
    String startTime = selectedSchedule?.startTime ?? UNKNOWN;
    final String endDate = selectedSchedule?.endDate ?? UNKNOWN;
    String endTime = selectedSchedule?.endTime ?? UNKNOWN;
    final bool isAllDay = selectedSchedule?.isAllDay ?? false;

    if (isAllDay) {
      startTime = kStartOfDayTime;
      endTime = kEndOfDayTime;
    }

    if (productID == UNKNOWN || startTime == UNKNOWN || endTime == UNKNOWN) {
      onError?.call(addDateTimeError);
      return null;
    }

    final bool repeats = selectedSchedule?.repeats ?? false;
    final String repeatOption =
        selectedSchedule?.repeatType?.toLowerCase() ?? kNoRepeatSchedule;

    final Map<String, dynamic> data = <String, dynamic>{
      'product': productID,
      'start_date': startDate,
      'start_time': startTime,
      'end_date': endDate,
      'end_time': endTime,
      'repeat': repeats ? repeatOption : kNoRepeatSchedule,
      'is_all_day': isAllDay,
    };

    if (repeats) {
      if (repeatOption == kWeeklyOption.toLowerCase()) {
        final Map<String, Map<String, String>> weekly =
            selectedSchedule?.repeatOnDaysOfWeek ??
                <String, Map<String, String>>{};
        data['repeat_on_days_of_week'] = weekly.entries.map(
          (MapEntry<String, Map<String, String>> entry) {
            return <String, String?>{
              'day': entry.key.toLowerCase(),
              'start_time': entry.value['start_time'],
              'end_time': entry.value['end_time'],
            };
          },
        ).toList();
      }

      if (repeatOption == kMonthlyOption.toLowerCase()) {
        final List<int> dates = selectedSchedule?.repeatMonthDates ?? <int>[];
        data['repeat_on_date_of_month'] = dates;
      }

      if (repeatOption == kYearlyOption.toLowerCase()) {
        final List<String> yearDates =
            selectedSchedule?.repeatYearDates ?? <String>[];

        final Map<String, Set<int>> grouped = <String, Set<int>>{};

        for (final String entry in yearDates) {
          final List<String> parts = entry.split('-');
          if (parts.length == 2) {
            final int? month = int.tryParse(parts[0]);
            final int? day = int.tryParse(parts[1]);

            if (month != null &&
                day != null &&
                month >= 1 &&
                month <= 12 &&
                day >= 1 &&
                day <= 31) {
              final String monthName = _monthName(month);
              grouped.putIfAbsent(monthName, () => <int>{});
              grouped[monthName]!.add(day);
            }
          }
        }

        final List<Map<String, dynamic>> repeatOnMonthOfYear = grouped.entries
            .map(
              (MapEntry<String, Set<int>> e) => <String, dynamic>{
                'month': e.key,
                'repeat_on_date_of_month': e.value.toList()..sort(),
              },
            )
            .toList();

        data['repeat_on_month_of_year'] = repeatOnMonthOfYear;
      }
    }

    final String endpoint = GetIt.I.get<AppConfig>().productScheduleEndpoint;

    final Response httpResponse = await client.callRESTAPI(
      endpoint: endpoint,
      method: APIMethods.POST.name.toUpperCase(),
      variables: data,
    );

    if (httpResponse.statusCode >= 400) {
      final Map<String, dynamic>? body =
          json.decode(httpResponse.body) as Map<String, dynamic>?;
      final String? error = client.parseError(body);
      onError?.call(error ?? defaultUserFriendlyMessage);
      return null;
    }

    final Map<String, dynamic> responseBody =
        json.decode(httpResponse.body) as Map<String, dynamic>;
    final ProductSchedule savedSchedule =
        ProductSchedule.fromJson(responseBody);

    final Product? newCurrent = product?.copyWith(schedule: savedSchedule);

    dispatch(UpdateHostStateAction(contextProduct: newCurrent));

    onSuccess?.call();

    return null;
  }

  String _monthName(int month) {
    const List<String> monthNames = <String>[
      'january',
      'february',
      'march',
      'april',
      'may',
      'june',
      'july',
      'august',
      'september',
      'october',
      'november',
      'december',
    ];
    return monthNames[month - 1];
  }
}
