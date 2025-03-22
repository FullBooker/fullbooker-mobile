import 'package:flutter/material.dart';

class TableHeaderText extends StatelessWidget {
  const TableHeaderText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge,
      softWrap: true,
    );
  }
}
