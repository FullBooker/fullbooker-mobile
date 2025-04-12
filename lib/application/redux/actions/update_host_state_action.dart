import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product.dart';

class UpdateHostStateAction extends ReduxAction<AppState> {
  UpdateHostStateAction({this.selectedProduct, this.currentProduct});

  Product? selectedProduct;
  Product? currentProduct;

  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.hostState?.call(
      selectedProduct: selectedProduct ?? state.hostState!.selectedProduct,
      currentProduct: currentProduct ?? state.hostState!.currentProduct,
    );

    return newState;
  }
}
