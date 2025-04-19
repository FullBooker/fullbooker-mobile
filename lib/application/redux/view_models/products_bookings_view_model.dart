import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/booking.dart';
import 'package:fullbooker/domain/core/entities/product_stats.dart';

class ProductsBookingsViewModel extends Vm {
  ProductsBookingsViewModel({
    required this.bookings,
    required this.productName,
    required this.stats,
  }) : super(equals: <Object?>[bookings, productName, stats]);

  final List<Booking?>? bookings;
  final String productName;
  final ProductStats? stats;

  static ProductsBookingsViewModel fromState(AppState state) {
    return ProductsBookingsViewModel(
      bookings: state.hostState?.selectedProduct?.bookings ?? <Booking?>[],
      productName: state.hostState?.selectedProduct?.name ?? UNKNOWN,
      stats: state.hostState?.selectedProduct?.stats ?? ProductStats(),
    );
  }
}
