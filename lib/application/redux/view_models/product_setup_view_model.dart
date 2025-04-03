import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/entities/product_category.dart';

class ProductSetupViewModel extends Vm {
  ProductSetupViewModel({
    required this.currentProduct,
    required this.productCategories,
  }) : super(equals: <Object?>[currentProduct, productCategories]);

  final Product? currentProduct;
  final List<ProductCategory>? productCategories;

  static ProductSetupViewModel fromState(AppState state) {
    return ProductSetupViewModel(
      currentProduct: state.hostState?.currentProduct,
      productCategories: state.hostState?.productCategories,
    );
  }
}
