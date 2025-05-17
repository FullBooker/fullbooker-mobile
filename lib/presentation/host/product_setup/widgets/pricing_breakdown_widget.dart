import 'package:flutter/material.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/domain/core/entities/pricing_breakdown.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';

class PricingBreakDownWidget extends StatelessWidget {
  const PricingBreakDownWidget({
    super.key,
    required this.pricingBreakdown,
    required this.buyerPaysFee,
    required this.onToggleFeeResponsibility,
    required this.selectedCurrency,
  });

  final PricingBreakdown? pricingBreakdown;
  final bool buyerPaysFee;
  final VoidCallback onToggleFeeResponsibility;
  final String selectedCurrency;

  @override
  Widget build(BuildContext context) {
    final double serviceFee = pricingBreakdown!.feeCharged;
    final double yourBuyersPay = buyerPaysFee
        ? pricingBreakdown!.buyersPayWithFees
        : pricingBreakdown!.buyersPayWithoutFees;
    final double yourRevenue = buyerPaysFee
        ? pricingBreakdown!.revenueIfBuyersPay
        : pricingBreakdown!.revenue;

    final double total = yourBuyersPay;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: <Widget>[
          Text(
            pricingBreakdownString,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                serviceFeeLabel,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                '$selectedCurrency ${serviceFee.toStringAsFixed(0)}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                yourBuyers,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                '$selectedCurrency ${yourBuyersPay.toStringAsFixed(0)}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                yourRevenueString,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                '$selectedCurrency ${yourRevenue.toStringAsFixed(0)}',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.greenColor,
                    ),
              ),
            ],
          ),
          InkWell(
            onTap: onToggleFeeResponsibility,
            highlightColor:
                Theme.of(context).primaryColor.withValues(alpha: .1),
            splashColor: Theme.of(context).primaryColor.withValues(alpha: .1),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                spacing: 12,
                children: <Widget>[
                  Icon(
                    buyerPaysFee
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                    color: Theme.of(context).primaryColor,
                  ),
                  Text(
                    iWantBuyersToPay,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          Divider(thickness: 0.2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                totalString,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              Text(
                '$selectedCurrency ${total.toStringAsFixed(0)}',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
