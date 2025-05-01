import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/domain/core/entities/pricing_option.dart';

part 'pricing_option_response.freezed.dart';
part 'pricing_option_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PricingOptionResponse with _$PricingOptionResponse {
  @JsonSerializable(explicitToJson: true)
  factory PricingOptionResponse({
    @Default(0) int count,
    String? next,
    String? previous,
    List<PricingOption?>? results,
  }) = _PricingOptionResponse;

  factory PricingOptionResponse.fromJson(Map<String, dynamic> json) =>
      _$PricingOptionResponseFromJson(json);
}
