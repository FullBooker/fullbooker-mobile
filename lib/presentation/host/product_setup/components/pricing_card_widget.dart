import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:dartz/dartz.dart' as d;

class PricingCardWidget extends StatelessWidget {
  const PricingCardWidget({
    super.key,
    required this.ticketType,
    this.price = 0,
    this.discount = 0,
    required this.maxTickets,
    required this.svgIconPath,
  });

  final String ticketType;
  final double? price;
  final double? discount;
  final int maxTickets;
  final String svgIconPath;

  @override
  Widget build(BuildContext context) {
    final bool hasPrice = price != null && price! > 0;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: Row(
        spacing: 12,
        children: <Widget>[
          SvgPicture.asset(svgIconPath),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: <Widget>[
                Text(
                  ticketType,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                if (discount != null && discount! > 0)
                  Text(
                    discountValue(discount!),
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: Theme.of(context).primaryColor),
                  ),
                Text(
                  maxAllowedTickets(maxTickets),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 10,
                        fontStyle: FontStyle.italic,
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              spacing: 8,
              children: <Widget>[
                if (hasPrice)
                  Text(
                    priceValue(price!),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                SecondaryButton(
                  onPressed: () {},
                  child: d.right(hasPrice ? changeString : addPrice),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
