import 'package:flutter/material.dart';

// TODO(abiud): delete this
class RoundedDivider extends StatelessWidget {
  const RoundedDivider({
    super.key,
    this.color = Colors.black,
    this.height = 10,
  });

  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color,
      ),
    );
  }
}
