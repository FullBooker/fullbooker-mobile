import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/core/common/constants.dart';

part 'product_stats.freezed.dart';
part 'product_stats.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ProductStats with _$ProductStats {
  @JsonSerializable(explicitToJson: true)
  factory ProductStats({
    @Default(0) int? bookings,
    @Default(UNKNOWN) String? revenue,
  }) = _ProductStats;

  factory ProductStats.fromJson(Map<String, dynamic> json) =>
      _$ProductStatsFromJson(json);
}
