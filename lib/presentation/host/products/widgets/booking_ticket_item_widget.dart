import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/entities/ticket.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/core/components/custom_badge_widget.dart';

class BookingTicketItemWidget extends StatelessWidget {
  const BookingTicketItemWidget({super.key, required this.ticket});

  final Ticket? ticket;

  @override
  Widget build(BuildContext context) {
    final String ticketTier =
        ticket?.pricingDetails?.ticketTier ?? kStandardTier;
    final String iconPath = getTicketIconPath(ticketTier);
    final String createdAt =
        ticket?.createdAt ?? DateTime.now().toIso8601String();
    final double cost =
        double.tryParse(ticket?.pricingDetails?.cost ?? '0') ?? 0;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Row(
        spacing: 12,
        children: <Widget>[
          SvgPicture.asset(iconPath),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: <Widget>[
                Text(
                  getTicketDisplayName(ticketTier),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Theme.of(context).primaryColor),
                ),
                Row(
                  spacing: 8,
                  children: <Widget>[
                    humanizeDate(
                      loadedDate: createdAt,
                      dateTextStyle: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Pricing & Status
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: <Widget>[
              Text(
                formatCurrency(cost),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              if (!(ticket?.isValid ?? false))
                CustomBadgeWidget(
                  text: verifiedString.toUpperCase(),
                  textColor: AppColors.amberColor,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
