import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

/// [PINInputField] is a shared widget to input authentication PIN
///
/// It takes in a required [maxLength] parameter to specify the number of PIN input fields

class PINInputField extends StatelessWidget {
  const PINInputField({
    super.key,
    required this.maxLength,
    required this.onDone,
    this.onTextChanged,
    this.autoFocus = false,
    this.wrapAlignment = WrapAlignment.spaceBetween,
    this.pinBoxHeight = 56.0,
    this.pinBoxWidth = 48.0,
    this.controller,
    this.keyboardType = TextInputType.number,
    this.focusNode,
    this.hasTextBorderColor,
    this.defaultBorderColor,
    this.pinBoxColor,
    this.pinBoxRadius = 0.0,
    this.showShadow = false,
    this.hideCharacter = true,
    this.pinBoxOuterPadding = const EdgeInsets.symmetric(horizontal: 4.0),
    this.pinTextStyle,
  });
  final bool? autoFocus;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final int? maxLength;
  final void Function(String)? onDone;
  final Function(String)? onTextChanged;
  final double? pinBoxHeight;
  final double? pinBoxWidth;
  final WrapAlignment? wrapAlignment;
  final Color? hasTextBorderColor;
  final Color? defaultBorderColor;
  final Color? pinBoxColor;
  final double pinBoxRadius;
  final bool showShadow;
  final EdgeInsets pinBoxOuterPadding;
  final bool hideCharacter;
  final TextStyle? pinTextStyle;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: controller,
      autofocus: autoFocus!,
      hideCharacter: hideCharacter,
      pinBoxBorderWidth: 1,
      highlight: true,
      focusNode: focusNode,
      highlightColor: Colors.white,
      pinBoxOuterPadding: pinBoxOuterPadding,
      defaultBorderColor: defaultBorderColor ??
          Theme.of(context).primaryColor.withValues(alpha: 0.3),
      hasTextBorderColor: hasTextBorderColor ?? Theme.of(context).primaryColor,
      maxLength: maxLength ?? 6,
      maskCharacter: '⚫',
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
        return customRoundedPinBoxDecoration(
          borderColor,
          pinBoxColor,
          radius: radius == 0 ? null : radius,
          borderWidth: borderWidth ?? 1,
          showShadow: showShadow,
        );
      },
      pinTextStyle: pinTextStyle ?? Theme.of(context).textTheme.bodyLarge,
      pinTextAnimatedSwitcherTransition:
          ProvidedPinBoxTextAnimation.scalingTransition,
      pinBoxColor: pinBoxColor ?? Theme.of(context).colorScheme.surface,
      pinTextAnimatedSwitcherDuration: const Duration(milliseconds: 300),
      highlightAnimationBeginColor: Colors.black,
      highlightAnimationEndColor: Colors.white12,
      keyboardType: keyboardType,
      onDone: onDone,
      onTextChanged: onTextChanged,
    );
  }
}

BoxDecoration customRoundedPinBoxDecoration(
  /// [BoxDecoration] box decoration for [PinCodeTextField] widget

  Color borderColor,
  Color pinBoxColor, {
  double borderWidth = 1.0,
  double? radius,
  bool showShadow = false,
}) {
  return BoxDecoration(
    border: Border.all(
      color: showShadow ? pinBoxColor : borderColor,
      width: borderWidth,
    ),
    color: pinBoxColor,
    borderRadius: BorderRadius.all(Radius.circular(radius ?? 4)),
    boxShadow: showShadow
        ? <BoxShadow>[
            BoxShadow(color: borderColor.withValues(alpha: 0.8), blurRadius: 3),
          ]
        : null,
  );
}
