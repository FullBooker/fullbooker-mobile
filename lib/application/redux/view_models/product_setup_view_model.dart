import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/entities/product_category.dart';
import 'package:fullbooker/domain/core/entities/product_image.dart';
import 'package:fullbooker/shared/entities/location_perms_result.dart';

class ProductSetupViewModel extends Vm {
  ProductSetupViewModel({
    required this.currentProduct,
    required this.productCategories,
    required this.locationPerms,
    required this.startDate,
    required this.startTime,
    required this.endDate,
    required this.endTime,
    required this.productMedia,
  }) : super(
          equals: <Object?>[
            currentProduct,
            productCategories,
            locationPerms,
            startDate,
            startTime,
            endDate,
            endTime,
            productMedia,
          ],
        );

  final Product? currentProduct;
  final List<ProductCategory>? productCategories;
  final LocationPermsResult? locationPerms;
  final String startDate;
  final String startTime;
  final String endDate;
  final String endTime;
  final List<ProductImage>? productMedia;

  static ProductSetupViewModel fromState(AppState state) {
    return ProductSetupViewModel(
      currentProduct: state.hostState?.currentProduct,
      productCategories: state.hostState?.productCategories,
      locationPerms: state.hostState?.locationPerms,
      startDate:
          state.hostState?.currentProduct?.availability?.start ?? UNKNOWN,
      startTime:
          state.hostState?.currentProduct?.availability?.startTime ?? UNKNOWN,
      endDate: state.hostState?.currentProduct?.availability?.end ?? UNKNOWN,
      endTime:
          state.hostState?.currentProduct?.availability?.endTime ?? UNKNOWN,
      productMedia: state.hostState?.productMediaState?.media,
    );
  }
}
