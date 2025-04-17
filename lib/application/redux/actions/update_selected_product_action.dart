import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product_media.dart';

class UpdateSelectedProductAction extends ReduxAction<AppState> {
  UpdateSelectedProductAction({
    this.productMedia,
  });

  final List<ProductMedia?>? productMedia;

  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.hostState?.selectedProduct?.call(
      productMedia:
          productMedia ?? state.hostState?.selectedProduct?.productMedia,
    );

    return newState;
  }
}
