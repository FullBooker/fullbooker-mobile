// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dartz/dartz.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.buttonKey,
    this.customHeight,
    this.textColor,
    this.fillColor,
    this.customWidth,
  });

  final void Function()? onPressed;
  final Key? buttonKey;
  final Either<Widget, String> child;
  final double? customHeight;
  final double? customWidth;
  final Color? fillColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: customHeight ?? 48,
      width: customWidth ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color:
            fillColor ?? Theme.of(context).primaryColor.withValues(alpha: 0.1),
      ),
      child: InkWell(
        key: buttonKey,
        onTap: onPressed,
        highlightColor: Theme.of(context).primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: child.fold(
              id,
              (String text) => Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
