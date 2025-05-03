import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/product.dart';

class ProductsPageViewModel extends Vm {
  ProductsPageViewModel({
    required this.products,
    required this.isSearching,
    required this.searchParam,
  }) : super(equals: <Object?>[products, isSearching, searchParam]);

  final List<Product?>? products;
  final bool isSearching;
  final String searchParam;

  static ProductsPageViewModel fromState(AppState state) {
    return ProductsPageViewModel(
      products: state.hostState?.products ?? <Product>[],
      isSearching: state.hostState?.isSearching ?? false,
      searchParam: state.hostState?.searchParam ?? UNKNOWN,
    );
  }
}
