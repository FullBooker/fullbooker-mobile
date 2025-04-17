import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product.dart';

class ProductsPageViewModel extends Vm {
  ProductsPageViewModel({required this.products})
      : super(equals: <Object?>[products]);

  final List<Product?>? products;

  static ProductsPageViewModel fromState(AppState state) {
    return ProductsPageViewModel(
      products: state.hostState?.products ?? <Product>[],
    );
  }
}
