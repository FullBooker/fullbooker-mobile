import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';

part 'ticket.freezed.dart';
part 'ticket.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Ticket with _$Ticket {
  @JsonSerializable(explicitToJson: true)
  factory Ticket({
    @Default(UNKNOWN) String? id,
    @JsonKey(name: 'created_at') @Default(UNKNOWN) String? createdAt,
    @JsonKey(name: 'updated_at') @Default(UNKNOWN) String? updatedAt,
    @Default(false) bool? active,
    @Default(UNKNOWN) String? host,
    @Default(UNKNOWN) String? number,
    @Default(UNKNOWN) String? url,
    @Default(UNKNOWN) String? name,
    @JsonKey(name: 'id_number') @Default(UNKNOWN) String? idNumber,
    @JsonKey(name: 'phone_number') @Default(UNKNOWN) String? phoneNumber,
    @Default(UNKNOWN) String? email,
    @Default(UNKNOWN) String? start,
    @Default(UNKNOWN) String? end,
    @Default(UNKNOWN) String? booking,
    @Default(UNKNOWN) String? pricing,
    @JsonKey(name: 'qr_code') @Default(UNKNOWN) String? qrCode,
    @JsonKey(name: 'pricing_details') ProductPricing? pricingDetails,
    @JsonKey(name: 'currency_code') @Default(UNKNOWN) String? currencyCode,
    @JsonKey(name: 'is_valid') @Default(false) bool? isValid,
    @JsonKey(name: 'product_name') @Default(UNKNOWN) String? productName,
  }) = _Ticket;

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
}
