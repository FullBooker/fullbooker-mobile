import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/entities/product_location.dart';

class UpdateHostStateAction extends ReduxAction<AppState> {
  UpdateHostStateAction({
    this.selectedProduct,
    this.currentProduct,
    this.selectedLocation,
  });

  Product? selectedProduct;
  Product? currentProduct;
  ProductLocation? selectedLocation;

  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.hostState?.call(
      selectedProduct: selectedProduct ?? state.hostState?.selectedProduct,
      currentProduct: currentProduct ?? state.hostState?.currentProduct,
      selectedLocation: selectedLocation ?? state.hostState?.selectedLocation,
    );

    return newState;
  }
}
