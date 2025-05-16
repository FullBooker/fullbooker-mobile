import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/core/common/constants.dart';

part 'pricing_breakdown.freezed.dart';
part 'pricing_breakdown.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PricingBreakdown with _$PricingBreakdown {
  @JsonSerializable(explicitToJson: true)
  factory PricingBreakdown({
    @Default('0.00') String amount,
    @Default(UNKNOWN) String type,
    @JsonKey(name: 'buyers_pay_without_fees')
    @Default(0)
    double buyersPayWithoutFees,
    @Default(0) double revenue,
    @JsonKey(name: 'buyers_pay_with_fees') @Default(0) double buyersPayWithFees,
    @JsonKey(name: 'revenue_if_buyers_pay')
    @Default(0)
    double revenueIfBuyersPay,
    @JsonKey(name: 'fee_charged') @Default(0) double feeCharged,
  }) = _PricingBreakdown;

  factory PricingBreakdown.fromJson(Map<String, dynamic> json) =>
      _$PricingBreakdownFromJson(json);
}
