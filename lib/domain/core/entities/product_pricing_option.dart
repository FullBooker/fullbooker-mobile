import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/core/common/constants.dart';

part 'product_pricing_option.freezed.dart';
part 'product_pricing_option.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ProductPricingOption with _$ProductPricingOption {
  @JsonSerializable(explicitToJson: true)
  factory ProductPricingOption({
    @Default(UNKNOWN) String? id,
    @Default(UNKNOWN) @JsonKey(name: 'created_at') String? createdAt,
    @Default(UNKNOWN) @JsonKey(name: 'updated_at') String? updatedAt,
    @Default(false) bool? active,
    @Default(UNKNOWN) String? host,
    @Default(UNKNOWN) String? product,
    @Default(UNKNOWN) @JsonKey(name: 'pricing_option') String? pricingOptionID,
    @Default(UNKNOWN) @JsonKey(name: 'product_name') String? productName,
    @Default(UNKNOWN)
    @JsonKey(name: 'pricing_option_name')
    String? pricingOptionName,
    @Default(UNKNOWN)
    @JsonKey(name: 'pricing_option_description')
    String? pricingOptionDescription,
    @Default(UNKNOWN)
    @JsonKey(name: 'pricing_option_type')
    String? pricingOptionType,
  }) = _ProductPricingOption;

  factory ProductPricingOption.initial() => ProductPricingOption();

  factory ProductPricingOption.fromJson(Map<String, dynamic> json) =>
      _$ProductPricingOptionFromJson(json);
}
