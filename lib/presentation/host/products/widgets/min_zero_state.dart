import 'package:flutter/material.dart';

class MinZeroState extends StatelessWidget {
  const MinZeroState({super.key, required this.copy});

  final String copy;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).dividerColor.withValues(alpha: .4),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        copy,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
