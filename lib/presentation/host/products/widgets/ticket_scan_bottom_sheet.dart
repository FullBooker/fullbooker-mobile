import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:get_it/get_it.dart';
import 'package:heroicons/heroicons.dart';

class TicketScanBottomSheet extends StatelessWidget {
  const TicketScanBottomSheet({
    super.key,
    this.isValid = false,
    required this.onConfirm,
    required this.code,
  });

  final bool isValid;
  final Function() onConfirm;
  final String code;

  @override
  Widget build(BuildContext context) {
    final bool showDebugTicket =
        GetIt.I.get<AppConfig>().environment.toLowerCase() == 'dev';

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

          Column(
            spacing: 4,
            children: <Widget>[
              Text(
                isValid ? validTicket : inValidTicket,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isValid
                          ? Theme.of(context).primaryColor
                          : AppColors.redColor,
                    ),
              ),
              if (showDebugTicket)
                Text(
                  '$debugTicketQR $code',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
            ],
          ),

          // TODO(abiud): return this when the API returns user details when validating a ticket
          // Ticket info
          // if (isValid)
          //   Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          //     decoration: BoxDecoration(
          //       border: Border.all(color: Theme.of(context).dividerColor),
          //       borderRadius: BorderRadius.circular(12),
          //     ),
          //     child: Row(
          //       spacing: 12,
          //       children: <Widget>[
          //         // Avatar initials
          //         Container(
          //           alignment: Alignment.center,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(8),
          //             color:
          //                 Theme.of(context).primaryColor.withValues(alpha: .1),
          //           ),
          //           child: Padding(
          //             padding: const EdgeInsets.all(16.0),
          //             child: Text(
          //               getInitials(testTicketName),
          //               style: Theme.of(context)
          //                   .textTheme
          //                   .titleMedium
          //                   ?.copyWith(color: Theme.of(context).primaryColor),
          //             ),
          //           ),
          //         ),
          //         // Ticket info
          //         Column(
          //           spacing: 4,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: <Widget>[
          //             Text(
          //               testTicketName,
          //               style: Theme.of(context)
          //                   .textTheme
          //                   .bodyLarge
          //                   ?.copyWith(color: AppColors.textBlackColor),
          //             ),
          //             Text(
          //               vvip,
          //               style: Theme.of(context)
          //                   .textTheme
          //                   .bodyLarge
          //                   ?.copyWith(color: Theme.of(context).primaryColor),
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),

          PrimaryButton(
            onPressed: onConfirm,
            child: right(scanAnother),
          ),
        ],
      ),
    );
  }
}
