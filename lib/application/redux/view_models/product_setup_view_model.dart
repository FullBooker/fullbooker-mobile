import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/currency.dart';
import 'package:fullbooker/domain/core/entities/pricing_option.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/entities/product_category.dart';
import 'package:fullbooker/domain/core/entities/product_location.dart';
import 'package:fullbooker/domain/core/entities/product_media.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';
import 'package:fullbooker/domain/core/entities/product_pricing_option.dart';
import 'package:fullbooker/domain/core/entities/product_schedule.dart';
import 'package:fullbooker/domain/core/entities/ticket_type.dart';
import 'package:fullbooker/shared/entities/location_perms_result.dart';
import 'package:fullbooker/shared/entities/enums.dart';

class ProductSetupViewModel extends Vm {
  ProductSetupViewModel({
    required this.workflowState,
    required this.currentProduct,
    required this.selectedProduct,
    required this.productCategories,
    required this.locationPerms,
    required this.startDate,
    required this.startTime,
    required this.endDate,
    required this.endTime,
    required this.photos,
    required this.videos,
    required this.selectedLocation,
    required this.isAllDay,
    required this.repeats,
    required this.repeatType,
    required this.repeatMonthly,
    required this.repeatYearly,
    required this.repeatWeekly,
    required this.pricing,
    required this.currencies,
    required this.selectedCurrency,
    required this.selectedPricingTier,
    required this.selectedPricing,
    required this.buyerPaysFee,
    required this.name,
    required this.description,
    required this.subCategories,
    required this.category,
    required this.categoryID,
    required this.subCategoryID,
    required this.subCategory,
    required this.pricingOptions,
    required this.selectedPricingOptionIDs,
    required this.productPricingOptions,
    required this.pickedPricingOption,
    required this.ticketTypes,
    required this.selectedTicketType,
  }) : super(
          equals: <Object?>[
            workflowState,
            currentProduct,
            productCategories,
            locationPerms,
            startDate,
            startTime,
            endDate,
            endTime,
            photos,
            videos,
            selectedLocation,
            isAllDay,
            repeats,
            repeatType,
            repeatMonthly,
            repeatYearly,
            repeatWeekly,
            pricing,
            currencies,
            selectedCurrency,
            selectedPricingTier,
            selectedPricing,
            buyerPaysFee,
            name,
            description,
            subCategories,
            category,
            subCategory,
            categoryID,
            subCategoryID,
            pricingOptions,
            selectedPricingOptionIDs,
            productPricingOptions,
            pickedPricingOption,
            ticketTypes,
            selectedTicketType,
          ],
        );

  final WorkflowState workflowState;

  final Product? currentProduct;
  final Product? selectedProduct;

  final String name;
  final String description;

  final List<ProductCategory>? productCategories;
  final LocationPermsResult? locationPerms;
  final String startDate;
  final String startTime;
  final String endDate;
  final String endTime;
  final List<ProductMedia?>? photos;
  final List<ProductMedia?>? videos;
  final ProductLocation? selectedLocation;
  final bool isAllDay;
  final bool repeats;

  final String repeatType;
  final List<int> repeatMonthly;
  final List<RepeatYearlySchedule> repeatYearly;
  final List<RepeatWeeklySchedule> repeatWeekly;

  final List<ProductPricing?>? pricing;
  final List<Currency?>? currencies;
  final Currency? selectedCurrency;
  final String selectedPricingTier;
  final ProductPricing? selectedPricing;
  final bool buyerPaysFee;

  final List<PricingOption?>? pricingOptions;
  final PricingOption? pickedPricingOption;
  final List<String?>? selectedPricingOptionIDs;

  /// Basic details page
  final ProductCategory? category;
  final ProductCategory? subCategory;
  final String categoryID;
  final List<ProductCategory?>? subCategories;
  final String subCategoryID;

  // Pricing page
  final List<ProductPricingOption?>? productPricingOptions;
  final List<TicketType?> ticketTypes;
  final TicketType? selectedTicketType;

  static ProductSetupViewModel fromState(AppState state) {
    final WorkflowState workflowState =
        state.hostState?.workflowState ?? WorkflowState.CREATE;

    final bool isCreate = workflowState == WorkflowState.CREATE;

    final Product? baseProduct = isCreate
        ? state.hostState?.currentProduct
        : state.hostState?.selectedProduct;

    return ProductSetupViewModel(
      workflowState: state.hostState?.workflowState ?? WorkflowState.CREATE,
      currentProduct: state.hostState?.currentProduct,
      selectedProduct: state.hostState?.selectedProduct,
      name: baseProduct?.name ?? UNKNOWN,
      description: baseProduct?.description ?? UNKNOWN,
      productCategories:
          state.hostState?.productCategories ?? <ProductCategory>[],
      locationPerms: state.hostState?.locationPerms,
      startDate: state.hostState?.selectedSchedule?.startDate ?? UNKNOWN,
      startTime: state.hostState?.selectedSchedule?.startTime ?? UNKNOWN,
      endDate: state.hostState?.selectedSchedule?.endDate ?? UNKNOWN,
      endTime: state.hostState?.selectedSchedule?.endTime ?? UNKNOWN,
      photos: baseProduct?.photos ?? <ProductMedia?>[],
      videos: baseProduct?.videos ?? <ProductMedia?>[],
      selectedLocation: state.hostState?.selectedLocation,
      isAllDay: state.hostState?.selectedSchedule?.isAllDay ?? false,
      repeats:
          state.hostState?.selectedSchedule?.repeatType != kNoRepeatSchedule,
      repeatType: state.hostState?.selectedSchedule?.repeatType ?? UNKNOWN,
      repeatMonthly:
          state.hostState?.selectedSchedule?.repeatMonthly ?? <int>[],
      repeatYearly: state.hostState?.selectedSchedule?.repeatYearly ??
          <RepeatYearlySchedule>[],
      repeatWeekly: state.hostState?.selectedSchedule?.repeatWeekly ??
          <RepeatWeeklySchedule>[],
      pricing: baseProduct?.pricing ?? <ProductPricing>[],
      currencies: state.hostState?.currencies ?? <Currency?>[],
      selectedCurrency: state.hostState?.selectedCurrency,
      selectedPricingTier: state.hostState?.selectedPricingTier ?? UNKNOWN,
      selectedPricing:
          state.hostState?.selectedProductPricing ?? ProductPricing(),
      buyerPaysFee:
          state.hostState?.selectedProductPricing?.buyerPaysFee ?? false,
      category:
          baseProduct?.selectedProductCategory ?? ProductCategory.initial(),
      subCategory:
          baseProduct?.selectedProductSubCategory ?? ProductCategory.initial(),
      subCategories: baseProduct?.selectedProductCategory?.subcategories ??
          <ProductCategory?>[],
      subCategoryID: baseProduct?.subcategory ?? UNKNOWN,
      categoryID: baseProduct?.category ?? UNKNOWN,
      pricingOptions: state.hostState?.pricingOptions ?? <PricingOption?>[],
      selectedPricingOptionIDs:
          state.hostState?.selectedPricingOptionIds ?? <String?>[],
      productPricingOptions:
          state.hostState?.productPricingOptions ?? <ProductPricingOption?>[],
      pickedPricingOption:
          state.hostState?.pickedPricingOption ?? PricingOption.initial(),
      ticketTypes: state.hostState?.ticketTypes ?? <TicketType?>[],
      selectedTicketType: state.hostState?.selectedTicketType ?? TicketType(),
    );
  }
}
