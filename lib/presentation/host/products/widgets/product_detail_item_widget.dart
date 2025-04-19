import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';

class ProductDetailItemWidget extends StatelessWidget {
  const ProductDetailItemWidget({
    super.key,
    required this.text,
    this.value,
    required this.onTap,
  });

  final Function() onTap;
  final String text;
  final int? value;

  @override
  Widget build(BuildContext context) {
    final int count = value ?? 0;
    final bool hasBookings = count > 0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: <Widget>[
                Text(
                  text,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  hasBookings ? bookingsValue(count) : noBookingsYet,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          if (hasBookings)
            Flexible(
              flex: 2,
              child: SecondaryButton(
                onPressed: onTap,
                child: right(viewString),
              ),
            ),
        ],
      ),
    );
  }
}
