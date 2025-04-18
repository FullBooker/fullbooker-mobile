import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/states/host_state.dart';
import 'package:fullbooker/domain/core/entities/product_schedule.dart';

class UpdateCurrentScheduleAction extends ReduxAction<AppState> {
  UpdateCurrentScheduleAction({
    this.startDate,
    this.startTime,
    this.endDate,
    this.endTime,
    this.isAllDay,
    this.repeats,
    this.repeatType,
    this.repeatOnDaysOfWeek,
    this.repeatMonthDates,
    this.repeatYearDates,
  });

  final String? startDate;
  final String? startTime;
  final String? endDate;
  final String? endTime;
  final bool? isAllDay;
  final bool? repeats;
  final String? repeatType;
  final List<int>? repeatMonthDates;
  final List<String>? repeatYearDates;
  Map<String, Map<String, String>>? repeatOnDaysOfWeek;

  @override
  AppState? reduce() {
    final ProductSchedule? currentSchedule = state.hostState?.selectedSchedule;

    final ProductSchedule? updatedSchedule = currentSchedule?.copyWith(
      startDate: startDate ?? currentSchedule.startDate,
      endDate: endDate ?? currentSchedule.endDate,
      startTime: startTime ?? currentSchedule.startTime,
      endTime: endTime ?? currentSchedule.endTime,
      isAllDay: isAllDay ?? currentSchedule.isAllDay,
      repeats: repeats ?? currentSchedule.repeats,
      repeatType: repeatType ?? currentSchedule.repeatType,
      repeatOnDaysOfWeek:
          repeatOnDaysOfWeek ?? currentSchedule.repeatOnDaysOfWeek,
      repeatMonthDates: repeatMonthDates ?? currentSchedule.repeatMonthDates,
      repeatYearDates: repeatYearDates ?? currentSchedule.repeatYearDates,
    );

    final HostState? updatedHost =
        state.hostState?.copyWith(selectedSchedule: updatedSchedule);

    return state.copyWith(hostState: updatedHost);
  }
}
