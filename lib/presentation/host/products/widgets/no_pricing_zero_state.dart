import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';

class NoPricingZeroState extends StatelessWidget {
  const NoPricingZeroState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).dividerColor.withValues(alpha: .4),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        noPricingOptionsString,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
