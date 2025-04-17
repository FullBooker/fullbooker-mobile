import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/application/redux/states/user_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/product_schedule.dart';
import 'package:fullbooker/domain/core/entities/product_category.dart';
import 'package:fullbooker/domain/core/entities/product_media.dart';
import 'package:fullbooker/domain/core/entities/product_location.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';

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
    @Default(UNKNOWN) String? subcategory,
    @JsonKey(name: 'schedule') @Default(UNKNOWN) String? scheduleID,
    @JsonKey(name: 'new_schedule') ProductSchedule? schedule,
    @Default(<ProductPricing>[]) List<ProductPricing?>? pricing,
    ProductMedia? image,
    dynamic video,
    @Default(<ProductLocation>[]) List<ProductLocation>? locations,
    @Default(<ProductMedia>[]) List<ProductMedia?>? productMedia,
    @Default(false) bool? completed,

    /// Temp values used when creating a product
    @JsonKey(includeFromJson: true, includeToJson: true)
    ProductCategory? selectedProductCategory,
    @JsonKey(includeFromJson: true, includeToJson: true)
    ProductCategory? selectedProductSubCategory,
    @JsonKey(includeFromJson: true, includeToJson: true)
    ProductLocation? selectedLocation,
  }) = _Product;

  factory Product.initial() => Product(
        host: UserState.initial(),
        schedule: ProductSchedule.initial(),
        image: ProductMedia.initial(),
        selectedProductCategory: ProductCategory.initial(),
        selectedProductSubCategory: ProductCategory.initial(),
        selectedLocation: ProductLocation.initial(),
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
      selectedLocation: product.selectedLocation ?? ProductLocation.initial(),
    );
  }
}
