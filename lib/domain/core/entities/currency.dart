import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/core/common/constants.dart';

part 'currency.freezed.dart';
part 'currency.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Currency with _$Currency {
  @JsonSerializable(explicitToJson: true)
  const factory Currency({
    @Default(UNKNOWN) String? id,
    @Default(UNKNOWN) @JsonKey(name: 'created_at') String? createdAt,
    @Default(UNKNOWN) @JsonKey(name: 'updated_at') String? updatedAt,
    @Default(true) bool? active,
    @Default(UNKNOWN) String? name,
    @Default(UNKNOWN) String? code,
    @JsonKey(name: 'conversion_rate') String? conversionRate,
  }) = _Currency;

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);
}
