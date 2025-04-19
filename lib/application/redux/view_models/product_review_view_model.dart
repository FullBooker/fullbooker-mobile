import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product.dart';

class ProductReviewViewModel extends Vm {
  ProductReviewViewModel({
    required this.selectedProduct,
    required this.currentProduct,
  }) : super(equals: <Object?>[selectedProduct]);

  final Product? selectedProduct;
  final Product? currentProduct;

  static ProductReviewViewModel fromState(AppState state) {
    return ProductReviewViewModel(
      selectedProduct: state.hostState?.selectedProduct,
      currentProduct: state.hostState?.currentProduct,
    );
  }
}
