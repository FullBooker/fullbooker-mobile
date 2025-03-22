import 'package:flutter/material.dart';

class InstructionText extends StatelessWidget {
  final String text;
  final bool isBold;

  const InstructionText(this.text, {super.key, this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
