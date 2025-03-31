import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';

class ProductDetailItemWidget extends StatelessWidget {
  const ProductDetailItemWidget({
    super.key,
    required this.text,
    required this.value,
    required this.onTap,
  });

  final String text;
  final String value;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 12,
        children: <Widget>[
          Flexible(
            flex: 5,
            child: Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: SecondaryButton(onPressed: () {}, child: right(viewString)),
          ),
        ],
      ),
    );
  }
}
