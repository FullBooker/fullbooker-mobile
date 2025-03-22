import 'package:flutter/material.dart';

class RoundedFloatingAction extends StatelessWidget {
  const RoundedFloatingAction(
    this.action, {
    super.key,
    this.height = 30,
    this.color = 0xf0010205,
    this.actionColor = 0xf0FC8135,
  });

  final String action;
  final int actionColor;
  final int color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 16,
      borderRadius: BorderRadius.circular(height / 2),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(height / 2)),
          color: Color(color),
        ),
        child: SizedBox(
          height: height,
          width: height,
          child: Center(
            child: Text(
              action,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }
}
