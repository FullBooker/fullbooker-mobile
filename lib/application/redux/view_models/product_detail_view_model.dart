import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/currency.dart';
import 'package:fullbooker/domain/core/entities/product.dart';

class ProductDetailViewModel extends Vm {
  ProductDetailViewModel({
    required this.selectedProduct,
    required this.currencies,
  }) : super(equals: <Object?>[selectedProduct, currencies]);

  final Product? selectedProduct;
  final List<Currency?>? currencies;

  static ProductDetailViewModel fromStore(Store<AppState> store) {
    return ProductDetailViewModel(
      selectedProduct: store.state.hostState?.selectedProduct,
      currencies: store.state.hostState?.currencies,
    );
  }
}
