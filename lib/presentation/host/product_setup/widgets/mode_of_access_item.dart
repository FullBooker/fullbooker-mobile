import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/domain/core/entities/pricing_option.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';

class ModeOfAccessItem extends StatelessWidget {
  const ModeOfAccessItem({
    super.key,
    required this.option,
    this.isSelected = false,
    this.onCTATap,
  });

  final Function()? onCTATap;
  final PricingOption option;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: <Widget>[
              Text(
                option.name ?? UNKNOWN,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
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
          SecondaryButton(
            child: right(setupPricing),
            onPressed: onCTATap,
          ),
        ],
      ),
    );
  }
}
