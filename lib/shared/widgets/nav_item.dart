import 'package:flutter/material.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/shared/widgets/scale_locked_text.dart';

class NavItemWidget extends StatelessWidget {
  const NavItemWidget(this.title, this.icon, {super.key});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon, color: AppColors.primaryColor),
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: SizedBox(
            width: 120,
            child: ScaleLockedText(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
        ),
      ],
    );
  }
}
