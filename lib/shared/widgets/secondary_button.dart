// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';

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
    this.addBorder = false,
    this.disabled = false,
    this.isLoading = false,
  });

  final void Function()? onPressed;
  final Key? buttonKey;
  final Either<Widget, String> child;
  final double? customHeight;
  final double? customWidth;
  final Color? fillColor;
  final Color? textColor;
  final bool addBorder;

  final bool disabled;
  final bool isLoading;

  void handleClick() {
    SystemChannels.textInput.invokeListMethod('TextInput.hide');
    onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: customHeight ?? 48,
      width: customWidth ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: addBorder
            ? Border.all(color: Theme.of(context).primaryColor)
            : null,
        color:
            fillColor ?? Theme.of(context).primaryColor.withValues(alpha: 0.1),
      ),
      child: InkWell(
        key: buttonKey,
        onTap: (disabled || isLoading) ? null : handleClick,
        highlightColor: Theme.of(context).primaryColor.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(8),
        child: DecoratedBox(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: isLoading
              ? AppLoading()
              : child.fold(
                  id,
                  (String text) => Center(
                    child: Text(
                      text,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: textColor ?? Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
