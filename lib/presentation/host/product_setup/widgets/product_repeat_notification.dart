import 'package:flutter/material.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/entities/product_schedule.dart';
import 'package:heroicons/heroicons.dart';

class RepeatNotification extends StatelessWidget {
  final ProductSchedule? productSchedule;

  const RepeatNotification({super.key, required this.productSchedule});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: Row(
        spacing: 8,
        children: <Widget>[
          HeroIcon(
            HeroIcons.informationCircle,
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
          Flexible(
            child: Text(
              generateRepeatNotification(productSchedule),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
