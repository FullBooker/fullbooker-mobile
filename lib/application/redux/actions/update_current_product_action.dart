import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product_category.dart';

class UpdateCurrentProductAction extends ReduxAction<AppState> {
  UpdateCurrentProductAction({
    this.selectedCategory,
    this.selectedSubCategory,
    this.name,
    this.description,
    this.lat,
    this.long,
    this.address,
  });

  final ProductCategory? selectedCategory;
  final ProductCategory? selectedSubCategory;
  final String? name;
  final String? description;

  final String? lat;
  final String? long;
  final String? address;

  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.hostState?.currentProduct?.call(
      selectedProductCategory: selectedCategory ??
          state.hostState?.currentProduct?.selectedProductCategory,
      selectedProductSubCategory: selectedSubCategory ??
          state.hostState?.currentProduct?.selectedProductSubCategory,
      name: name ?? state.hostState?.currentProduct?.name,
      description: description ?? state.hostState?.currentProduct?.description,
      currentLocation:
          state.hostState?.currentProduct?.currentLocation?.copyWith.call(
        lat: lat ?? state.hostState?.currentProduct?.currentLocation?.lat,
        long: long ?? state.hostState?.currentProduct?.currentLocation?.long,
        address: address ??
            state.hostState?.currentProduct?.currentLocation?.address,
      ),
    );

    return newState;
  }
}
