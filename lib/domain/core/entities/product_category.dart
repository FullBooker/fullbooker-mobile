import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/core/common/constants.dart';

part 'product_category.freezed.dart';
part 'product_category.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ProductCategory with _$ProductCategory {
  @JsonSerializable(explicitToJson: true)
  factory ProductCategory({
    @Default(UNKNOWN) String id,
    @JsonKey(name: 'created_at') @Default(UNKNOWN) String createdAt,
    @JsonKey(name: 'updated_at') @Default(UNKNOWN) String updatedAt,
    @Default(false) bool active,
    @Default(UNKNOWN) String name,
    @Default(UNKNOWN) String description,
    @Default(UNKNOWN) String category,
    @Default(UNKNOWN) String? parent,
    @JsonKey(name: 'children') List<ProductCategory>? subcategories,
    List<String>? tags,
  }) = _ProductCategory;

  factory ProductCategory.initial() => ProductCategory();

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);
}
