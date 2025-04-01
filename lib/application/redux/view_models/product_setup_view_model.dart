import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product.dart';

class ProductSetupViewModel extends Vm {
  ProductSetupViewModel({required this.currentProduct})
      : super(equals: <Object?>[currentProduct]);

  final Product? currentProduct;

  static ProductSetupViewModel fromState(AppState state) {
    return ProductSetupViewModel(
      currentProduct: state.hostState?.currentProduct,
    );
  }
}
