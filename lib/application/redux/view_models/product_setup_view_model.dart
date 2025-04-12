import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/entities/product_category.dart';
import 'package:fullbooker/shared/entities/location_perms_result.dart';

class ProductSetupViewModel extends Vm {
  ProductSetupViewModel({
    required this.currentProduct,
    required this.productCategories,
    required this.locationPerms,
  }) : super(
          equals: <Object?>[
            currentProduct,
            productCategories,
            locationPerms,
          ],
        );

  final Product? currentProduct;
  final List<ProductCategory>? productCategories;
  final LocationPermsResult? locationPerms;

  static ProductSetupViewModel fromState(AppState state) {
    return ProductSetupViewModel(
      currentProduct: state.hostState?.currentProduct,
      productCategories: state.hostState?.productCategories,
      locationPerms: state.hostState?.locationPerms,
    );
  }
}
