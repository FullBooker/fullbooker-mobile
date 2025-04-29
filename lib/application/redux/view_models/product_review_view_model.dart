import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/states/host_state.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/shared/entities/enums.dart';

class ProductReviewViewModel extends Vm {
  ProductReviewViewModel({required this.product})
      : super(equals: <Object?>[product]);

  final Product? product;

  static ProductReviewViewModel fromState(AppState state) {
    final HostState? host = state.hostState;
    final WorkflowState workflowState =
        host?.workflowState ?? WorkflowState.CREATE;
    final Product? prod = workflowState == WorkflowState.CREATE
        ? host?.currentProduct
        : host?.selectedProduct;

    return ProductReviewViewModel(product: prod);
  }
}
