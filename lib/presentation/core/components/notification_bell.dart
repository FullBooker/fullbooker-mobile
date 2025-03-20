// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:heroicons/heroicons.dart';

class NotificationBell extends StatelessWidget {
  const NotificationBell({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO(abiud): navigate to notifications
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).cardColor,
        ),
        child: SizedBox.fromSize(
          size: const Size(32, 32),
          child: HeroIcon(
            HeroIcons.bell,
            color: Theme.of(context).primaryColor,
            size: 24,
          ),
        ),
      ),
    );
  }
}
