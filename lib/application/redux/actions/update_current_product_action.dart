import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product_category.dart';

class UpdateCurrentProductAction extends ReduxAction<AppState> {
  UpdateCurrentProductAction({
    this.selectedCategory,
    this.selectedSubCategory,
    this.name,
    this.description,
  });

  final ProductCategory? selectedCategory;
  final ProductCategory? selectedSubCategory;
  final String? name;
  final String? description;

  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.hostState?.currentProduct?.call(
      selectedProductCategory: selectedCategory ??
          state.hostState?.currentProduct?.selectedProductCategory,
      selectedProductSubCategory: selectedSubCategory ??
          state.hostState?.currentProduct?.selectedProductSubCategory,
      name: name ?? state.hostState?.currentProduct?.name,
      description: description ?? state.hostState?.currentProduct?.description,
    );

    return newState;
  }
}
