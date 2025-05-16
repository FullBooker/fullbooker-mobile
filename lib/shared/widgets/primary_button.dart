// Flutter imports:
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.onLongPressed,
    this.color,
    this.disabled = false,
    this.textColor,
    this.customHeight,
    this.customWidth,
    this.buttonKey,
    this.customRadius,
    this.isLoading = false,
  });

  final void Function()? onPressed;
  final void Function()? onLongPressed;

  final Either<Widget, String> child;
  final Color? color;
  final double? customHeight;
  final double? customWidth;

  final Color? textColor;

  final Key? buttonKey;
  final double? customRadius;

  final bool disabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    void handleClick() {
      SystemChannels.textInput.invokeListMethod('TextInput.hide');
      onPressed?.call();
    }

    return SizedBox(
      width: customWidth ?? size.width,
      height: customHeight ?? 48,
      child: RawMaterialButton(
        key: buttonKey,
        onPressed: (disabled || isLoading) ? null : handleClick,
        onLongPress: onLongPressed,
        fillColor: color ?? Theme.of(context).primaryColor,
        elevation: 0,
        splashColor: color ?? Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(customRadius ?? 8),
        ),
        child: isLoading
            ? AppLoading(fillColor: Colors.white)
            : child.fold(
                id,
                (String text) => Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: textColor ?? Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
      ),
    );
  }
}
