import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:heroicons/heroicons.dart';

class TicketScanBottomSheet extends StatelessWidget {
  const TicketScanBottomSheet({
    super.key,
    this.isValid = false,
    required this.onDismiss,
  });
  final bool isValid;
  final Function() onDismiss;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 16,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor.withValues(alpha: .1),
            ),
            child: HeroIcon(
              isValid ? HeroIcons.checkBadge : HeroIcons.xCircle,
              color:
                  isValid ? Theme.of(context).primaryColor : AppColors.redColor,
              size: 40,
            ),
          ),

          // Title
          Text(
            isValid ? validTicket : inValidTicket,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isValid
                      ? Theme.of(context).primaryColor
                      : AppColors.redColor,
                ),
          ),

          // Ticket info block
          if (isValid)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).dividerColor),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                spacing: 12,
                children: <Widget>[
                  // Avatar initials
                  Container(
                    // width: 40,
                    // height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color:
                          Theme.of(context).primaryColor.withValues(alpha: .1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        getInitials('Abiud Orina'),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                  // Ticket info
                  Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Abiud Orina',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: AppColors.textBlackColor),
                      ),
                      Text(
                        vvip,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          // CTA Button
          PrimaryButton(
            onPressed: onDismiss,
            child: right(scanAnother),
          ),
        ],
      ),
    );
  }
}
