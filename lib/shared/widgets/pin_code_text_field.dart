import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

/// [PINInputField] is a shared widget to input authentication PIN
///
/// It takes in a required [maxLength] parameter to specify the number of PIN input fields

class PINInputField extends StatelessWidget {
  const PINInputField({
    super.key,
    this.maxLength = 4,
    required this.onDone,
    this.onTextChanged,
    this.autoFocus = false,
    this.wrapAlignment = WrapAlignment.spaceBetween,
    this.pinBoxHeight = 56.0,
    this.pinBoxWidth = 48.0,
    this.pinBoxRadius = 8.0,
    this.hideCharacter = true,
    this.pinBoxOuterPadding = const EdgeInsets.symmetric(horizontal: 8.0),
  });

  final void Function(String)? onDone;
  final Function(String)? onTextChanged;
  final bool? autoFocus;
  final bool hideCharacter;
  final int maxLength;
  final double? pinBoxHeight;
  final EdgeInsets pinBoxOuterPadding;
  final double pinBoxRadius;
  final double? pinBoxWidth;
  final WrapAlignment? wrapAlignment;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      autofocus: autoFocus!,
      hideCharacter: hideCharacter,
      pinBoxBorderWidth: 1,
      highlight: true,
      highlightColor: Theme.of(context).primaryColor,
      pinBoxOuterPadding: pinBoxOuterPadding,
      defaultBorderColor: Theme.of(context).dividerColor,
      hasTextBorderColor: Theme.of(context).primaryColor,
      maxLength: maxLength,
      maskCharacter: '•',
      pinBoxWidth: pinBoxWidth!,
      pinBoxHeight: pinBoxHeight!,
      wrapAlignment: wrapAlignment!,
      pinBoxRadius: pinBoxRadius,
      pinBoxDecoration: (
        Color borderColor,
        Color pinBoxColor, {
        double? borderWidth,
        double? radius,
      }) {
        return BoxDecoration(
          border: Border.all(color: borderColor),
          color: pinBoxColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        );
      },
      pinTextStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: Theme.of(context).primaryColor,
          ),
      pinTextAnimatedSwitcherTransition:
          ProvidedPinBoxTextAnimation.scalingTransition,
      pinBoxColor: Theme.of(context).colorScheme.surface,
      pinTextAnimatedSwitcherDuration: const Duration(milliseconds: 300),
      highlightAnimationBeginColor: Colors.black,
      highlightAnimationEndColor: Colors.white12,
      onDone: onDone,
      onTextChanged: onTextChanged,
    );
  }
}
