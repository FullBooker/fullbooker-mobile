import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/application/redux/states/user_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/booking.dart';
import 'package:fullbooker/domain/core/entities/product_pricing_option.dart';
import 'package:fullbooker/domain/core/entities/product_schedule.dart';
import 'package:fullbooker/domain/core/entities/product_category.dart';
import 'package:fullbooker/domain/core/entities/product_media.dart';
import 'package:fullbooker/domain/core/entities/product_location.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';
import 'package:fullbooker/domain/core/entities/product_stats.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Product with _$Product {
  @JsonSerializable(explicitToJson: true)
  factory Product({
    @Default(UNKNOWN) String? id,
    @Default(UNKNOWN) @JsonKey(name: 'created_at') String? createdAt,
    @Default(UNKNOWN) @JsonKey(name: 'updated_at') String? updatedAt,
    @Default(false) bool? active,
    required UserState? host,
    @Default(UNKNOWN) String? name,
    @Default(UNKNOWN) String? description,
    @Default(UNKNOWN) String? number,
    @Default(UNKNOWN) String? category,
    @JsonKey(name: 'category_name') @Default(UNKNOWN) String? categoryName,
    @Default(UNKNOWN) String? subcategory,
    @JsonKey(name: 'subcategory_name')
    @Default(UNKNOWN)
    String? subcategoryName,
    @JsonKey(name: 'schedule_id') @Default(UNKNOWN) String? scheduleID,
    @JsonKey(name: 'schedule') ProductSchedule? schedule,
    @Default(<ProductPricing>[]) List<ProductPricing?>? pricing,
    @Default(<ProductPricingOption>[])
    List<ProductPricingOption?>? pricingOptions,
    ProductMedia? image,
    ProductMedia? video,
    @Default(<ProductLocation>[]) List<ProductLocation>? locations,
    @Default(false) bool? completed,
    @Default(0) @JsonKey(name: 'images_count') int? imageCount,
    @Default(0) @JsonKey(name: 'videos_count') int? videoCount,
    @Default('DRAFT') @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'terms_accepted') @Default(false) bool? termsAccepted,
    @JsonKey(name: 'terms_and_conditions_id') @Default(UNKNOWN) String? termsID,

    /// Temp values used when creating a product
    @Default(<ProductMedia>[]) List<ProductMedia?>? photos,
    @Default(<ProductMedia>[]) List<ProductMedia?>? videos,
    @Default(<Booking>[]) List<Booking?>? bookings,
    @JsonKey(includeFromJson: true, includeToJson: true)
    ProductCategory? selectedProductCategory,
    @JsonKey(includeFromJson: true, includeToJson: true)
    ProductCategory? selectedProductSubCategory,
    ProductStats? stats,
  }) = _Product;

  factory Product.initial() => Product(
        host: UserState.initial(),
        schedule: ProductSchedule.initial(),
        image: ProductMedia.initial(),
        video: ProductMedia.initial(),
        selectedProductCategory: ProductCategory.initial(),
        selectedProductSubCategory: ProductCategory.initial(),
        stats: ProductStats(),
      );

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  // Used for API responses to ignore locally used values
  factory Product.fromApiJson(Map<String, dynamic> json) {
    final Product product = _$ProductFromJson(json);
    return product.copyWith(
      schedule: product.schedule ?? ProductSchedule.initial(),
      selectedProductCategory:
          product.selectedProductCategory ?? ProductCategory.initial(),
      selectedProductSubCategory:
          product.selectedProductSubCategory ?? ProductCategory.initial(),
      stats: product.stats ?? ProductStats(),
    );
  }
}
