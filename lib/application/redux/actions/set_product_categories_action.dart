import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product_category.dart';

class SetProductCategoriesAction extends ReduxAction<AppState> {
  SetProductCategoriesAction({this.productCategories});

  List<ProductCategory>? productCategories;

  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.hostState?.call(
      productCategories:
          productCategories ?? state.hostState!.productCategories,
    );

    return newState;
  }
}
