import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/domain/core/entities/booking.dart';

part 'product_bookings_response.freezed.dart';
part 'product_bookings_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ProductBookingsResponse with _$ProductBookingsResponse {
  @JsonSerializable(explicitToJson: true)
  factory ProductBookingsResponse({
    @Default(0) int count,
    String? next,
    String? previous,
    List<Booking?>? results,
  }) = _ProductBookingsResponse;

  factory ProductBookingsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductBookingsResponseFromJson(json);
}
