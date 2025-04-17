import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product_media.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';

class UpdateSelectedProductAction extends ReduxAction<AppState> {
  UpdateSelectedProductAction({
    this.productMedia,
    this.productPricing,
  });

  final List<ProductMedia?>? productMedia;
  final List<ProductPricing?>? productPricing;

  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.hostState?.selectedProduct?.call(
      productMedia:
          productMedia ?? state.hostState?.selectedProduct?.productMedia,
    );

    return newState;
  }
}
