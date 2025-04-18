import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/core/common/constants.dart';

part 'product_pricing.freezed.dart';
part 'product_pricing.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ProductPricing with _$ProductPricing {
  @JsonSerializable(explicitToJson: true)
  factory ProductPricing({
    @Default(UNKNOWN) String? id,
    @Default(UNKNOWN) @JsonKey(name: 'created_at') String? createdAt,
    @Default(UNKNOWN) @JsonKey(name: 'updated_at') String? updatedAt,
    @Default(false) bool? active,
    @Default(UNKNOWN) String? host,
    @Default(UNKNOWN) String? name,
    @Default(UNKNOWN) String? product,
    @Default(UNKNOWN) String? currency,
    @Default(UNKNOWN) String? cost,
    @Default('ticket') String? type,
    @Default(standardTier) @JsonKey(name: 'ticket_tier') String? ticketTier,
    @Default(0) @JsonKey(name: 'maximum_number_of_tickets') int? maxTickets,
    @Default(0) @JsonKey(name: 'remaining_tickets') int? remainingTickets,
    @Default(0) @JsonKey(name: 'sold_tickets') int? soldTickets,
    @Default(true) bool? buyerPaysFee,
  }) = _ProductPricing;

  factory ProductPricing.initial() => ProductPricing();

  factory ProductPricing.fromJson(Map<String, dynamic> json) =>
      _$ProductPricingFromJson(json);
}
