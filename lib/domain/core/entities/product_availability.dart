import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/core/common/constants.dart';

part 'product_availability.freezed.dart';
part 'product_availability.g.dart';

@freezed
class ProductAvailability with _$ProductAvailability {
  @JsonSerializable(explicitToJson: true)
  factory ProductAvailability({
    @Default(UNKNOWN) String? id,
    @Default(UNKNOWN) String? product,
    @Default(UNKNOWN) @JsonKey(name: 'product_name') String? productName,
    @Default(UNKNOWN) String? start,
    @Default(UNKNOWN) String? end,
    @Default(UNKNOWN) @JsonKey(name: 'start_time') String? startTime,
    @Default(UNKNOWN) @JsonKey(name: 'end_time') String? endTime,
    @Default(0) int? duration,
    @Default(<dynamic>[]) @JsonKey(name: 'open_days') List<dynamic>? openDays,
    @Default(<dynamic>[])
    @JsonKey(name: 'closed_dates')
    List<dynamic>? closedDates,
  }) = _ProductAvailability;

  factory ProductAvailability.initial() => ProductAvailability();

  factory ProductAvailability.fromJson(Map<String, dynamic> json) =>
      _$ProductAvailabilityFromJson(json);
}
