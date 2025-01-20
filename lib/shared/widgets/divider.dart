import 'package:flutter/material.dart';

class RoundedDivider extends StatelessWidget {
  final Color color;
  final double height;

  const RoundedDivider(
      {super.key, this.color = Colors.black, this.height = 10});

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

class LabeledDivider extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  final String label;

  const LabeledDivider(this.color, this.height, this.width, this.label,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: Row(children: [
          const Expanded(
              child: RoundedDivider(height: 1, color: Color(0xf0B3ADAD))),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(label)),
          const Expanded(
              child: RoundedDivider(height: 1, color: Color(0xf0B3ADAD)))
        ]));
  }
}
