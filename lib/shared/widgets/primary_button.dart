// Flutter imports:
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.onLongPressed,
    this.color,
    this.isEnabled = true,
    this.textColor,
    this.customHeight,
    this.customWidth,
    this.buttonKey,
  });

  final void Function()? onPressed;
  final void Function()? onLongPressed;

  final Either<Widget, String> child;
  final Color? color;
  final double? customHeight;
  final double? customWidth;

  final bool isEnabled;
  final Color? textColor;

  final Key? buttonKey;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: customWidth ?? size.width,
      height: customHeight ?? 48,
      child: RawMaterialButton(
        key: buttonKey,
        onPressed: onPressed,
        onLongPress: onLongPressed,
        fillColor: color ?? Theme.of(context).primaryColor,
        elevation: 0,
        splashColor: color ?? Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: child.fold(
          id,
          (String text) => Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
