import 'package:flutter/material.dart';

class RoundedFloatingAction extends StatelessWidget {
  final double height;
  final String action;
  final int color;
  final int actionColor;

  const RoundedFloatingAction(this.action,
      {super.key,
      this.height = 30,
      this.color = 0xf0010205,
      this.actionColor = 0xf0FC8135});

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 16,
        borderRadius: BorderRadius.circular(height / 2),
        child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(height / 2)),
                color: Color(color)),
            child: SizedBox(
                height: height,
                width: height,
                child: Center(
                    child: Text(action,
                        style: TextStyle(
                            color: Color(actionColor),
                            fontSize: height / 2,
                            fontWeight: FontWeight.w600))))));
  }
}
