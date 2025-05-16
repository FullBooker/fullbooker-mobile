import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';

class UpdateSearchFiltersAction extends ReduxAction<AppState> {
  UpdateSearchFiltersAction({
    this.productSearchParam,
    this.isSearchingProducts,
    this.isSearchingProductBooking,
    this.productBookingSearchParam,
  });

  // Product search page
  final String? productSearchParam;
  final bool? isSearchingProducts;

  // Bookings search page
  final String? productBookingSearchParam;
  final bool? isSearchingProductBooking;
  
  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.hostState?.call(
      productSearchParam:
          productSearchParam ?? state.hostState?.productSearchParam,
      isSearchingProducts:
          isSearchingProducts ?? state.hostState?.isSearchingProducts,
      productBookingSearchParam: productBookingSearchParam ??
          state.hostState?.productBookingSearchParam,
      isSearchingProductBooking: isSearchingProductBooking ??
          state.hostState?.isSearchingProductBooking,
    );

    return newState;
  }
}
