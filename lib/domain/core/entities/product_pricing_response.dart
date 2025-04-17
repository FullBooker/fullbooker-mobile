import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';

part 'product_pricing_response.freezed.dart';
part 'product_pricing_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ProductPricingResponse with _$ProductPricingResponse {
  @JsonSerializable(explicitToJson: true)
  factory ProductPricingResponse({
    @Default(0) int count,
    String? next,
    String? previous,
    List<ProductPricing?>? results,
  }) = _ProductPricingResponse;

  factory ProductPricingResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductPricingResponseFromJson(json);
}
