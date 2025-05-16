import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/entities/booking.dart';

class BookingFanWidget extends StatelessWidget {
  const BookingFanWidget({super.key, required this.booking});

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    final String fullName =
        getFullName(booking.user?.firstName, booking.user?.lastName);
    final String email = booking.user?.emailAddress ?? UNKNOWN;
    final String phone = booking.user?.phoneNumber ?? UNKNOWN;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Row(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
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
              getInitials(fullName),
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
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                ),
                Text(
                  phone,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  email,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                humanizeDate(
                  loadedDate:
                      booking.confirmedOn ?? DateTime.now().toIso8601String(),
                  dateTextStyle: Theme.of(context).textTheme.bodySmall,
                  showTime: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
