import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/booking.dart';
import 'package:fullbooker/domain/core/entities/product_stats.dart';
import 'package:fullbooker/domain/core/entities/ticket.dart';

class ProductBookingDetailsViewModel extends Vm {
  ProductBookingDetailsViewModel({
    required this.productName,
    required this.stats,
    required this.selectedBooking,
    required this.selectedBookingTickets,
  }) : super(
          equals: <Object?>[
            productName,
            stats,
            selectedBooking,
            selectedBookingTickets,
          ],
        );

  final String productName;
  final ProductStats? stats;
  final Booking selectedBooking;
  final List<Ticket?>? selectedBookingTickets;

  static ProductBookingDetailsViewModel fromState(AppState state) {
    return ProductBookingDetailsViewModel(
      productName: state.hostState?.selectedProduct?.name ?? UNKNOWN,
      stats: state.hostState?.selectedProduct?.stats ?? ProductStats(),
      selectedBooking: state.hostState?.selectedBooking ?? Booking.initial(),
      selectedBookingTickets: state.hostState?.selectedBookingTickets,
    );
  }
}
