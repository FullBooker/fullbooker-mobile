import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';

class ProductSearchViewModel extends Vm {
  ProductSearchViewModel({
    required this.isSearchingProducts,
    required this.productSearchParam,
    required this.isSearchingProductBooking,
    required this.productBookingSearchParam,
  }) : super(
          equals: <Object?>[
            isSearchingProducts,
            productSearchParam,
            isSearchingProductBooking,
            productBookingSearchParam,
          ],
        );

  final bool isSearchingProducts;
  final String productSearchParam;

  final bool isSearchingProductBooking;
  final String productBookingSearchParam;

  static ProductSearchViewModel fromState(AppState state) {
    return ProductSearchViewModel(
      isSearchingProducts: state.hostState?.isSearchingProducts ?? false,
      productSearchParam: state.hostState?.productSearchParam ?? UNKNOWN,
      isSearchingProductBooking:
          state.hostState?.isSearchingProductBooking ?? false,
      productBookingSearchParam:
          state.hostState?.productBookingSearchParam ?? UNKNOWN,
    );
  }
}
