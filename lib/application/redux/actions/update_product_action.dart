import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product_category.dart';
import 'package:fullbooker/domain/core/entities/product_location.dart';
import 'package:fullbooker/domain/core/entities/product_media.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';
import 'package:fullbooker/domain/core/entities/product_schedule.dart';
import 'package:fullbooker/shared/entities/enums.dart';

// Modifies the current or selected product based on the workflow state
class UpdateProductAction extends ReduxAction<AppState> {
  UpdateProductAction({
    this.selectedCategory,
    this.selectedSubCategory,
    this.name,
    this.description,
    this.photos,
    this.videos,
    this.pricing,
    this.schedule,
    this.locations,
    this.termsAccepted,
  });

  final ProductCategory? selectedCategory;
  final ProductCategory? selectedSubCategory;
  final String? name;
  final String? description;
  final List<ProductMedia?>? photos;
  final List<ProductMedia?>? videos;
  final List<ProductPricing?>? pricing;
  final ProductSchedule? schedule;
  final List<ProductLocation>? locations;
  final bool? termsAccepted;

  @override
  AppState? reduce() {
    final WorkflowState workflowState =
        state.hostState?.workflowState ?? WorkflowState.CREATE;

    if (workflowState == WorkflowState.CREATE) {
      return state.copyWith.hostState?.currentProduct?.call(
        selectedProductCategory: selectedCategory ??
            state.hostState?.currentProduct?.selectedProductCategory,
        selectedProductSubCategory: selectedSubCategory ??
            state.hostState?.currentProduct?.selectedProductSubCategory,
        name: name ?? state.hostState?.currentProduct?.name,
        description:
            description ?? state.hostState?.currentProduct?.description,
        photos: photos ?? state.hostState?.currentProduct?.photos,
        videos: videos ?? state.hostState?.currentProduct?.videos,
        pricing: pricing ?? state.hostState?.currentProduct?.pricing,
        schedule: schedule ?? state.hostState?.currentProduct?.schedule,
        locations: locations ?? state.hostState?.currentProduct?.locations,
        termsAccepted:
            termsAccepted ?? state.hostState?.currentProduct?.termsAccepted,
        category:
            selectedCategory?.id ?? state.hostState?.currentProduct?.category,
      );
    } else {
      return state.copyWith.hostState?.selectedProduct?.call(
        selectedProductCategory: selectedCategory ??
            state.hostState?.selectedProduct?.selectedProductCategory,
        selectedProductSubCategory: selectedSubCategory ??
            state.hostState?.selectedProduct?.selectedProductSubCategory,
        name: name ?? state.hostState?.selectedProduct?.name,
        description:
            description ?? state.hostState?.selectedProduct?.description,
        photos: photos ?? state.hostState?.selectedProduct?.photos,
        videos: videos ?? state.hostState?.selectedProduct?.videos,
        pricing: pricing ?? state.hostState?.selectedProduct?.pricing,
        schedule: schedule ?? state.hostState?.selectedProduct?.schedule,
        locations: locations ?? state.hostState?.selectedProduct?.locations,
        termsAccepted:
            termsAccepted ?? state.hostState?.selectedProduct?.termsAccepted,
        category:
            selectedCategory?.id ?? state.hostState?.selectedProduct?.category,
      );
    }
  }
}
