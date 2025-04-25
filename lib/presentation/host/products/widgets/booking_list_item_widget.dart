import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/entities/booking.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/core/components/custom_badge_widget.dart';
import 'package:intl/intl.dart';

class BookingListItem extends StatelessWidget {
  const BookingListItem({super.key, required this.booking});

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    final String fullName =
        getFullName(booking.user?.firstName, booking.user?.lastName);
    final int tickets = booking.totalTicketsCount ?? 0;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Row(
        spacing: 12,
        children: <Widget>[
          // Avatar
          Container(
            width: 56,
            height: 56,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withValues(alpha: .1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              getInitials(
                getFullName(booking.user?.firstName, booking.user?.lastName),
              ),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppColors.primaryColor),
            ),
          ),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: <Widget>[
                Text(
                  fullName,
                  style: Theme.of(context).textTheme.bodyLarge,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                ),
                Row(
                  spacing: 8,
                  children: <Widget>[
                    if (tickets > 0)
                      Text(
                        ticketsValue(tickets),
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Theme.of(context).primaryColor),
                      ),
                    humanizeDate(
                      loadedDate: booking.confirmedOn ??
                          DateTime.now().toIso8601String(),
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
                'KES ${booking.totalCost?.toString() ?? ''}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              if (booking.status != UNKNOWN)
                CustomBadgeWidget(
                  text: toBeginningOfSentenceCase(booking.status ?? UNKNOWN),
                  textColor: AppColors.amberColor,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
