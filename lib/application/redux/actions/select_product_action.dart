import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product.dart';

class SelectProductAction extends ReduxAction<AppState> {
  SelectProductAction({this.product});

  Product? product;

  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.hostState?.call(
      selectedProduct: product ?? state.hostState!.selectedProduct,
    );

    return newState;
  }
}
