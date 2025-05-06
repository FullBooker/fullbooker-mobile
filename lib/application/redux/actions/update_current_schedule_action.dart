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
    this.repeatWeekly,
    this.repeatMonthly,
    this.repeatYearly,
  });

  final String? startDate;
  final String? startTime;
  final String? endDate;
  final String? endTime;
  final bool? isAllDay;
  final bool? repeats;
  final String? repeatType;
  final List<int>? repeatMonthly;
  final List<RepeatYearlySchedule>? repeatYearly;
  List<RepeatWeeklySchedule>? repeatWeekly;

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
      repeatWeekly: repeatWeekly ?? currentSchedule.repeatWeekly,
      repeatMonthly: repeatMonthly ?? currentSchedule.repeatMonthly,
      repeatYearly: repeatYearly ?? currentSchedule.repeatYearly,
    );

    final HostState? updatedHost =
        state.hostState?.copyWith(selectedSchedule: updatedSchedule);

    return state.copyWith(hostState: updatedHost);
  }
}
