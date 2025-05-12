import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/domain/core/entities/product_pricing_option.dart';

part 'product_pricing_option_response.freezed.dart';
part 'product_pricing_option_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ProductPricingOptionResponse with _$ProductPricingOptionResponse {
  @JsonSerializable(explicitToJson: true)
  factory ProductPricingOptionResponse({
    @Default(0) int count,
    String? next,
    String? previous,
    List<ProductPricingOption?>? results,
  }) = _ProductPricingOptionResponse;

  factory ProductPricingOptionResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductPricingOptionResponseFromJson(json);
}
