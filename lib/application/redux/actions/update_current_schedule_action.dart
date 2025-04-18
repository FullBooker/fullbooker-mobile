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
    this.repeatWeekdays,
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
  final List<String>? repeatWeekdays;
  final List<int>? repeatMonthDates;
  final List<String>? repeatYearDates;

  @override
  AppState? reduce() {
    final ProductSchedule? currentSchedule = state.hostState?.selectedSchedule;

    final ProductSchedule? updatedSchedule = currentSchedule?.copyWith(
      start: startDate ?? currentSchedule.start,
      end: endDate ?? currentSchedule.end,
      startTime: startTime ?? currentSchedule.startTime,
      endTime: endTime ?? currentSchedule.endTime,
      isAllDay: isAllDay ?? currentSchedule.isAllDay,
      repeats: repeats ?? currentSchedule.repeats,
      repeatType: repeatType ?? currentSchedule.repeatType,
      repeatWeekdays: repeatWeekdays ?? currentSchedule.repeatWeekdays,
      repeatMonthDates: repeatMonthDates ?? currentSchedule.repeatMonthDates,
      repeatYearDates: repeatYearDates ?? currentSchedule.repeatYearDates,
    );

    final HostState? updatedHost =
        state.hostState?.copyWith(selectedSchedule: updatedSchedule);

    return state.copyWith(hostState: updatedHost);
  }
}
