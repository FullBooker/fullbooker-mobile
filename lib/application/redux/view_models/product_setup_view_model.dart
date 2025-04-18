import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/entities/product_category.dart';
import 'package:fullbooker/domain/core/entities/product_location.dart';
import 'package:fullbooker/domain/core/entities/product_media.dart';
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
    required this.selectedLocation,
    required this.isAllDay,
    required this.repeats,
    required this.repeatType,
    required this.repeatMonthDates,
    required this.repeatYearDates,
    required this.repeatOnDaysOfWeek,
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
            selectedLocation,
            isAllDay,
            repeats,
            repeatType,
            repeatMonthDates,
            repeatYearDates,
            repeatOnDaysOfWeek,
          ],
        );

  final Product? currentProduct;
  final List<ProductCategory>? productCategories;
  final LocationPermsResult? locationPerms;
  final String startDate;
  final String startTime;
  final String endDate;
  final String endTime;
  final List<ProductMedia?>? productMedia;
  final ProductLocation? selectedLocation;
  final bool isAllDay;
  final bool repeats;
  final String repeatType;
  final List<int> repeatMonthDates;
  final List<String> repeatYearDates;

  final Map<String, Map<String, String>> repeatOnDaysOfWeek;

  static ProductSetupViewModel fromState(AppState state) {
    return ProductSetupViewModel(
      currentProduct: state.hostState?.currentProduct,
      productCategories: state.hostState?.productCategories,
      locationPerms: state.hostState?.locationPerms,
      startDate: state.hostState?.currentProduct?.schedule?.start ?? UNKNOWN,
      startTime:
          state.hostState?.currentProduct?.schedule?.startTime ?? UNKNOWN,
      endDate: state.hostState?.currentProduct?.schedule?.end ?? UNKNOWN,
      endTime: state.hostState?.currentProduct?.schedule?.endTime ?? UNKNOWN,
      productMedia:
          state.hostState?.currentProduct?.productMedia ?? <ProductMedia?>[],
      selectedLocation: state.hostState?.selectedLocation,
      isAllDay: state.hostState?.selectedSchedule?.isAllDay ?? false,
      repeats: state.hostState?.selectedSchedule?.repeats ?? false,
      repeatType: state.hostState?.selectedSchedule?.repeatType ?? UNKNOWN,
      repeatMonthDates:
          state.hostState?.selectedSchedule?.repeatMonthDates ?? <int>[],
      repeatYearDates:
          state.hostState?.selectedSchedule?.repeatYearDates ?? <String>[],
      repeatOnDaysOfWeek:
          state.hostState?.selectedSchedule?.repeatOnDaysOfWeek ??
              <String, Map<String, String>>{},
    );
  }
}
