import 'package:flutter/material.dart';

class ScaleLockedText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final bool? softWrap;

  const ScaleLockedText(
    this.data, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.softWrap,
  });

  @override
  Widget build(BuildContext context) {
    final double fontSize = style?.fontSize == null
        ? 16 / MediaQuery.textScalerOf(context).scale(1)
        : style!.fontSize! / MediaQuery.textScalerOf(context).scale(1);
    final TextStyle textStyle = style == null
        ? TextStyle(fontSize: fontSize)
        : style!.copyWith(fontSize: fontSize);

    return Text(
      data,
      style: textStyle,
      maxLines: maxLines ?? 1,
      overflow: overflow,
      textAlign: textAlign,
      softWrap: softWrap,
    );
  }
}
