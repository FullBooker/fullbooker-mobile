import 'package:flutter/material.dart';
import 'package:fullbooker/shared/widgets/scale_locked_text.dart';

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

class LabeledDivider extends StatelessWidget {
  const LabeledDivider(
    this.color,
    this.height,
    this.width,
    this.label, {
    super.key,
  });

  final Color color;
  final double height;
  final String label;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        width: width,
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 4,
          children: <Widget>[
            const Expanded(
              child: RoundedDivider(height: 1, color: Color(0xf0B3ADAD)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ScaleLockedText(
                label,
                style: const TextStyle(fontSize: 12),
              ),
            ),
            const Expanded(
              child: RoundedDivider(height: 1, color: Color(0xf0B3ADAD)),
            ),
          ],
        ),
      ),
    );
  }
}
