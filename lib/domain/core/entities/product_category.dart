import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_category.freezed.dart';
part 'product_category.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ProductCategory with _$ProductCategory {
  @JsonSerializable(explicitToJson: true)
  factory ProductCategory({
    required String id,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    required bool active,
    required String name,
    required String description,
    required String category,
    String? parent,
    List<ProductCategory>? children,
    List<String>? tags,
  }) = _ProductCategory;

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);
}
