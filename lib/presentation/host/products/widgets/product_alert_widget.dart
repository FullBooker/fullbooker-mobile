import 'package:flutter/material.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:heroicons/heroicons.dart';

class ProductAlertWidget extends StatelessWidget {
  const ProductAlertWidget({
    super.key,
    required this.title,
    this.description,
    required this.iconData,
    this.color = AppColors.amberColor,
  });

  final Color color;
  final String? description;
  final HeroIcons iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color.withValues(alpha: .1),
      ),
      child: Row(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeroIcon(iconData, color: color),
          Flexible(
            child: Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: color),
                ),
                if (description != null)
                  Text(
                    description ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: color),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
