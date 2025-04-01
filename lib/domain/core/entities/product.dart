import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/application/redux/states/user_state.dart';
import 'package:fullbooker/domain/core/entities/product_availability.dart';
import 'package:fullbooker/domain/core/entities/product_image.dart';
import 'package:fullbooker/domain/core/entities/product_location.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  @JsonSerializable(explicitToJson: true)
  factory Product({
    required String id,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    required bool active,
    required UserState host,
    required String name,
    required String description,
    required String number,
    required String category,
    required String subcategory,
    @JsonKey(name: 'availability') required ProductAvailability availability,
    @JsonKey(name: 'pricing') required List<ProductPricing> pricing,
    @JsonKey(name: 'image') ProductImage? image,
    dynamic video,
    @JsonKey(name: 'locations') required List<ProductLocation> locations,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
