import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/domain/core/entities/product_category.dart';

part 'product_category_response.freezed.dart';
part 'product_category_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ProductCategoryResponse with _$ProductCategoryResponse {
  @JsonSerializable(explicitToJson: true)
  factory ProductCategoryResponse({
    @Default(0) int count,
    String? next,
    String? previous,
    List<ProductCategory>? results,
  }) = _ProductCategoryResponse;

  factory ProductCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryResponseFromJson(json);
}
