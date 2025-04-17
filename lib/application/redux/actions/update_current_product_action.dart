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
    this.lat,
    this.long,
    this.address,
    this.city,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.productMedia,
    this.pricing,
  });

  final String? address;
  final String? city;
  final String? description;
  final String? lat;
  final String? long;
  final String? name;
  final ProductCategory? selectedCategory;
  final ProductCategory? selectedSubCategory;
  final String? startDate;
  final String? startTime;
  final String? endDate;
  final String? endTime;
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
      schedule: state.hostState?.currentProduct?.schedule?.copyWith.call(
        start: startDate ?? state.hostState?.currentProduct?.schedule?.start,
        startTime:
            startTime ?? state.hostState?.currentProduct?.schedule?.startTime,
        end: endDate ?? state.hostState?.currentProduct?.schedule?.end,
        endTime: endTime ?? state.hostState?.currentProduct?.schedule?.endTime,
      ),
      selectedLocation:
          state.hostState?.currentProduct?.selectedLocation?.copyWith.call(
        lat: lat ?? state.hostState?.currentProduct?.selectedLocation?.lat,
        long: long ?? state.hostState?.currentProduct?.selectedLocation?.long,
        address: address ??
            state.hostState?.currentProduct?.selectedLocation?.address,
        city: city ?? state.hostState?.currentProduct?.selectedLocation?.city,
      ),
      productMedia:
          productMedia ?? state.hostState?.currentProduct?.productMedia,
      pricing: pricing ?? state.hostState?.currentProduct?.pricing,
    );

    return newState;
  }
}
