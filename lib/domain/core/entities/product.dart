import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/application/redux/states/user_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/product_availability.dart';
import 'package:fullbooker/domain/core/entities/product_category.dart';
import 'package:fullbooker/domain/core/entities/product_image.dart';
import 'package:fullbooker/domain/core/entities/product_location.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
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
    @JsonKey(name: 'availability') ProductAvailability? availability,
    @Default(<ProductPricing>[])
    @JsonKey(name: 'pricing')
    List<ProductPricing>? pricing,
    @JsonKey(name: 'image') ProductImage? image,
    dynamic video,
    @Default(<ProductLocation>[])
    @JsonKey(name: 'locations')
    List<ProductLocation>? locations,
    @Default(false) bool? completed,

    /// Temp values used to create the product
    ProductCategory? selectedProductCategory,
    ProductCategory? selectedProductSubCategory,
  }) = _Product;

  factory Product.initial() => Product(
        host: UserState.initial(),
        availability: ProductAvailability.initial(),
        image: ProductImage.initial(),
        selectedProductCategory: ProductCategory.initial(),
        selectedProductSubCategory: ProductCategory.initial(),
      );

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
