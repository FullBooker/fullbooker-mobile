import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/core/common/constants.dart';

part 'pricing_option.freezed.dart';
part 'pricing_option.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PricingOption with _$PricingOption {
  @JsonSerializable(explicitToJson: true)
  factory PricingOption({
    @Default(UNKNOWN) String? id,
    @Default(UNKNOWN) @JsonKey(name: 'created_at') String? createdAt,
    @Default(UNKNOWN) @JsonKey(name: 'updated_at') String? updatedAt,
    @Default(false) bool? active,
    @Default(UNKNOWN) String? name,
    @Default(UNKNOWN) String? description,
    @Default(UNKNOWN) @JsonKey(name: 'type') String? pricingOptionType,
  }) = _PricingOption;

  factory PricingOption.initial() => PricingOption();

  factory PricingOption.fromJson(Map<String, dynamic> json) =>
      _$PricingOptionFromJson(json);
}
