import 'package:flutter/material.dart';
import 'package:fullbooker/shared/widgets/scale_locked_text.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
          width: width,
          height: height,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                    child: RoundedDivider(height: 1, color: Color(0xf0B3ADAD))),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ScaleLockedText(label,
                        style: const TextStyle(fontSize: 12))),
                const Expanded(
                    child: RoundedDivider(height: 1, color: Color(0xf0B3ADAD)))
              ])),
    );
  }
}
