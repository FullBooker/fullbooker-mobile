import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/booking.dart';

class UpdateSelectedProductBookingAction extends ReduxAction<AppState> {
  UpdateSelectedProductBookingAction({
    required this.selectedBooking,
  });

  final Booking? selectedBooking;

  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.hostState?.call(
      selectedBooking: selectedBooking ?? state.hostState?.selectedBooking,
    );

    return newState;
  }
}
