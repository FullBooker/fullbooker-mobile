import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/booking.dart';

class ProductsBookingsViewModel extends Vm {
  ProductsBookingsViewModel({required this.bookings})
      : super(equals: <Object?>[bookings]);

  final List<Booking?>? bookings;

  static ProductsBookingsViewModel fromState(AppState state) {
    return ProductsBookingsViewModel(
      bookings: state.hostState?.selectedProduct?.bookings ?? <Booking?>[],
    );
  }
}
