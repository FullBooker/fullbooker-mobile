import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/domain/core/entities/product_pricing_option.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';

class ModeOfAccessItem extends StatelessWidget {
  const ModeOfAccessItem({
    super.key,
    required this.option,
    this.onCTATap,
  });

  final Function()? onCTATap;
  final ProductPricingOption option;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).dividerColor,
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
                option.pricingOptionName ?? UNKNOWN,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.textBlackColor,
                    ),
              ),
              if (option.pricingOptionDescription?.isNotEmpty ?? false)
                Text(
                  option.pricingOptionDescription ?? '',
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
