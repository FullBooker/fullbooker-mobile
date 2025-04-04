import 'package:flutter/material.dart';

class SetupSummaryItem extends StatelessWidget {
  const SetupSummaryItem({
    super.key,
    required this.stepNumber,
    required this.title,
    required this.description,
  });

  final int stepNumber;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 7,
          height: MediaQuery.of(context).size.width / 7,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).dividerColor,
            ),
          ),
          child: Center(
            child: Text(
              stepNumber.toString(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}
