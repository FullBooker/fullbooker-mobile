import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/domain/core/entities/ticket.dart';

part 'product_booking_tickets_response.freezed.dart';
part 'product_booking_tickets_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ProductBookingTicketsResponse with _$ProductBookingTicketsResponse {
  @JsonSerializable(explicitToJson: true)
  factory ProductBookingTicketsResponse({
    @Default(0) int count,
    String? next,
    String? previous,
    List<Ticket?>? results,
  }) = _ProductBookingTicketsResponse;

  factory ProductBookingTicketsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductBookingTicketsResponseFromJson(json);
}
