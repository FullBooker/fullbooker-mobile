import 'package:flutter/material.dart';

class CustomBadgeWidget extends StatelessWidget {
  const CustomBadgeWidget({
    super.key,
    required this.text,
    this.color,
  });

  final Color? color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        color: color?.withValues(alpha: .1) ??
            Theme.of(context).primaryColor.withValues(alpha: .1),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: color ?? Theme.of(context).cardColor,
            ),
      ),
    );
  }
}
