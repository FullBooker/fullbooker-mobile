import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product_category.dart';
import 'package:fullbooker/domain/core/entities/product_media.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';

class UpdateCurrentProductAction extends ReduxAction<AppState> {
  UpdateCurrentProductAction({
    this.selectedCategory,
    this.selectedSubCategory,
    this.name,
    this.description,
    this.productMedia,
    this.pricing,
  });

  final String? description;
  final String? name;
  final ProductCategory? selectedCategory;
  final ProductCategory? selectedSubCategory;

  final List<ProductMedia?>? productMedia;
  final List<ProductPricing?>? pricing;

  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.hostState?.currentProduct?.call(
      selectedProductCategory: selectedCategory ??
          state.hostState?.currentProduct?.selectedProductCategory,
      selectedProductSubCategory: selectedSubCategory ??
          state.hostState?.currentProduct?.selectedProductSubCategory,
      name: name ?? state.hostState?.currentProduct?.name,
      description: description ?? state.hostState?.currentProduct?.description,
      productMedia:
          productMedia ?? state.hostState?.currentProduct?.productMedia,
      pricing: pricing ?? state.hostState?.currentProduct?.pricing,
    );

    return newState;
  }
}
