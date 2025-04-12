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
    this.city,
  });

  final String? address;
  final String? city;
  final String? description;
  final String? lat;
  final String? long;
  final String? name;
  final ProductCategory? selectedCategory;
  final ProductCategory? selectedSubCategory;

  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.hostState?.currentProduct?.call(
      selectedProductCategory: selectedCategory ??
          state.hostState?.currentProduct?.selectedProductCategory,
      selectedProductSubCategory: selectedSubCategory ??
          state.hostState?.currentProduct?.selectedProductSubCategory,
      name: name ?? state.hostState?.currentProduct?.name,
      description: description ?? state.hostState?.currentProduct?.description,
      selectedLocation:
          state.hostState?.currentProduct?.selectedLocation?.copyWith.call(
        lat: lat ?? state.hostState?.currentProduct?.selectedLocation?.lat,
        long: long ?? state.hostState?.currentProduct?.selectedLocation?.long,
        address: address ??
            state.hostState?.currentProduct?.selectedLocation?.address,
        city: city ?? state.hostState?.currentProduct?.selectedLocation?.city,
      ),
    );

    return newState;
  }
}
