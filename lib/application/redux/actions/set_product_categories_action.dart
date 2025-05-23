import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product_category.dart';

class SetProductCategoriesAction extends ReduxAction<AppState> {
  SetProductCategoriesAction({
    this.productCategories,
    this.productSubCategories,
  });

  List<ProductCategory>? productCategories;
  List<ProductCategory>? productSubCategories;

  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.hostState?.call(
      productCategories:
          productCategories ?? state.hostState!.productCategories,
      productSubCategories:
          productSubCategories ?? state.hostState!.productSubCategories,
    );

    return newState;
  }
}
