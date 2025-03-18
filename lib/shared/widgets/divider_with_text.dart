import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 12,
      children: <Widget>[
        Expanded(
          child: Divider(),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}
