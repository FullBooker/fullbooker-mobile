// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_breakdown.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PricingBreakdownImpl _$$PricingBreakdownImplFromJson(
        Map<String, dynamic> json) =>
    _$PricingBreakdownImpl(
      amount: json['amount'] as String? ?? '0.00',
      type: json['type'] as String? ?? UNKNOWN,
      buyersPayWithoutFees:
          (json['buyers_pay_without_fees'] as num?)?.toDouble() ?? 0,
      revenue: (json['revenue'] as num?)?.toDouble() ?? 0,
      buyersPayWithFees:
          (json['buyers_pay_with_fees'] as num?)?.toDouble() ?? 0,
      revenueIfBuyersPay:
          (json['revenue_if_buyers_pay'] as num?)?.toDouble() ?? 0,
      feeCharged: (json['fee_charged'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$PricingBreakdownImplToJson(
        _$PricingBreakdownImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'type': instance.type,
      'buyers_pay_without_fees': instance.buyersPayWithoutFees,
      'revenue': instance.revenue,
      'buyers_pay_with_fees': instance.buyersPayWithFees,
      'revenue_if_buyers_pay': instance.revenueIfBuyersPay,
      'fee_charged': instance.feeCharged,
    };
