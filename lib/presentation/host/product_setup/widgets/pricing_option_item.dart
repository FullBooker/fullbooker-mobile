import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/domain/core/entities/pricing_option.dart';
import 'package:heroicons/heroicons.dart';

class PricingOptionItem extends StatelessWidget {
  const PricingOptionItem({
    super.key,
    required this.option,
    this.isSelected = false,
    this.onTap,
  });

  final Function()? onTap;
  final PricingOption option;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Theme.of(context).primaryColor.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected
              ? Theme.of(context).primaryColor.withValues(alpha: .05)
              : null,
          border: Border.all(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Theme.of(context).dividerColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: <Widget>[
                  Text(
                    option.name ?? UNKNOWN,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: isSelected
                              ? Theme.of(context).primaryColor
                              : AppColors.textBlackColor,
                        ),
                  ),
                  if (option.description?.isNotEmpty ?? false)
                    Text(
                      option.description ?? '',
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                ],
              ),
            ),
            if (isSelected)
              HeroIcon(
                HeroIcons.checkCircle,
                color: Theme.of(context).primaryColor,
              ),
          ],
        ),
      ),
    );
  }
}
