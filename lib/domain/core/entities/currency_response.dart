import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/domain/core/entities/currency.dart';

part 'currency_response.freezed.dart';
part 'currency_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CurrencyResponse with _$CurrencyResponse {
  @JsonSerializable(explicitToJson: true)
  factory CurrencyResponse({
    @Default(0) int count,
    String? next,
    String? previous,
    List<Currency?>? results,
  }) = _CurrencyResponse;

  factory CurrencyResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrencyResponseFromJson(json);
}
