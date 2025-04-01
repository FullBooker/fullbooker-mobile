import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_availability.freezed.dart';
part 'product_availability.g.dart';

@freezed
class ProductAvailability with _$ProductAvailability {
  factory ProductAvailability({
    required String id,
    required String product,
    @JsonKey(name: 'product_name') required String productName,
    required String start,
    required String end,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    int? duration,
    @Default(<dynamic>[]) @JsonKey(name: 'open_days') List<dynamic> openDays,
    @Default(<dynamic>[])
    @JsonKey(name: 'closed_dates')
    List<dynamic> closedDates,
  }) = _ProductAvailability;

  factory ProductAvailability.fromJson(Map<String, dynamic> json) =>
      _$ProductAvailabilityFromJson(json);
}
