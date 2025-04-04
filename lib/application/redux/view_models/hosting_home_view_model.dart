import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product.dart';

class HostingHomeViewModel extends Vm {
  HostingHomeViewModel({
    required this.products,
  }) : super(equals: <Object?>[products]);

  final List<Product>? products;

  static HostingHomeViewModel fromState(AppState state) {
    return HostingHomeViewModel(
      products: state.hostState?.products ?? <Product>[],
    );
  }
}
