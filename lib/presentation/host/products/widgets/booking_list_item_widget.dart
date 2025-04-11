import 'package:flutter/material.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/entities/booking.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/core/components/custom_badge_widget.dart';

class BookingListItem extends StatelessWidget {
  const BookingListItem({super.key, required this.booking});

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    final String fullName =
        getFullName(booking.user?.firstName, booking.user?.lastName);

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
            width: 48,
            height: 48,
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
                  spacing: 4,
                  children: <Widget>[
                    Text(
                      booking.bookingType ?? '',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    humanizeDate(
                      loadedDate:
                          booking.bookedOn ?? DateTime.now().toIso8601String(),
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
            spacing: 8,
            children: <Widget>[
              Text(
                'KES ${booking.price?.toStringAsFixed(0) ?? ''}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              if (booking.verified ?? false)
                CustomBadgeWidget(
                  text: verifiedString,
                  textColor: AppColors.greenColor,
                  backgroundColor: AppColors.greenColor,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
