import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product.dart';

class ProductDetailViewModel extends Vm {
  ProductDetailViewModel({required this.selectedProduct})
      : super(equals: <Object?>[selectedProduct]);

  final Product? selectedProduct;

  static ProductDetailViewModel fromState(AppState state) {
    return ProductDetailViewModel(
      selectedProduct: state.hostState?.selectedProduct,
    );
  }
}
