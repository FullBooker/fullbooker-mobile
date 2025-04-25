import 'package:flutter/material.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:heroicons/heroicons.dart';

class TimeSlotWidget extends StatelessWidget {
  const TimeSlotWidget({super.key, required this.value, this.isClosed = false});

  final String value;
  final bool isClosed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        spacing: 8,
        children: <Widget>[
          HeroIcon(
            isClosed ? HeroIcons.moon : HeroIcons.clock,
            size: 16,
            color: isClosed ? Colors.grey : AppColors.textBlackColor,
          ),
          if (isClosed)
            Text(
              closedString,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isClosed ? Colors.grey : AppColors.textBlackColor,
                  ),
            )
          else
            formatTime(
              time: value,
              textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isClosed ? Colors.grey : AppColors.textBlackColor,
                  ),
            ),
        ],
      ),
    );
  }
}
