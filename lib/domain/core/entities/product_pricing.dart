import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_pricing.freezed.dart';
part 'product_pricing.g.dart';

@freezed
class ProductPricing with _$ProductPricing {
  @JsonSerializable(explicitToJson: true)
  factory ProductPricing({
    required String id,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    required bool active,
    required String host,
    String? name,
    required String product,
    required String currency,
    required String cost,
    required String type,
    @JsonKey(name: 'ticket_tier') required String ticketTier,
    @JsonKey(name: 'maximum_number_of_tickets') required int maxTickets,
    @JsonKey(name: 'remaining_tickets') required int remainingTickets,
    @JsonKey(name: 'sold_tickets') required int soldTickets,
  }) = _ProductPricing;

  factory ProductPricing.fromJson(Map<String, dynamic> json) =>
      _$ProductPricingFromJson(json);
}
