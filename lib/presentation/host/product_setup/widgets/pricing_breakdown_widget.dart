import 'package:flutter/material.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';

class PricingBreakDownWidget extends StatelessWidget {
  const PricingBreakDownWidget({super.key, required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    const double buyerPay = 2825;
    const double revenue = 2500;
    const double serviceFee = 2500;
    const double totalPrice = 2825;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: <Widget>[
          Text(
            pricingBreakdown,
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
                serviceFee.toStringAsFixed(0),
                style: TextStyle(color: Colors.grey),
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
                buyerPay.toStringAsFixed(0),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                yourRevenue,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                revenue.toStringAsFixed(0),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.greenColor,
                    ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              // TODO(abiud): save this value to state for the current product
            },
            highlightColor:
                Theme.of(context).primaryColor.withValues(alpha: 0.1),
            splashColor: Theme.of(context).primaryColor.withValues(alpha: 0.1),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                spacing: 12,
                children: <Widget>[
                  Icon(
                    Icons.check_box,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                totalString,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Text(
                totalPrice.toStringAsFixed(0),
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
