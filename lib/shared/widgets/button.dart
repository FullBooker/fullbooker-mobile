import 'package:flutter/material.dart';
import 'package:fullbooker/core/utils.dart';

class Button extends StatelessWidget {
  final Function() onPressed;
  final Color color;
  final String actionLabel;
  final Widget? actionLabelPrefix;
  final bool loading;
  final Color actionLabelColor;
  final double labelFontSize;
  final double verticalPadding;
  final double elevation;

  const Button(this.onPressed,
      {super.key,
      this.actionLabelPrefix,
      this.color = const Color(0xfff55E00),
      this.actionLabel = "",
      this.actionLabelColor = Colors.white,
      this.loading = false,
      this.labelFontSize = 17,
      this.verticalPadding = 14,
      this.elevation = 2});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: elevation,
          shadowColor: color,
          child: FilledButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) => color,
                ),
                minimumSize: const WidgetStatePropertyAll(Size.fromHeight(30)),
                padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                    vertical: verticalPadding, horizontal: 0)),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))),
            onPressed: onPressed,
            child: FractionallySizedBox(
                widthFactor: .6,
                child: Center(
                    child: loading
                        ? const SizedBox(
                            height: 22,
                            width: 22,
                            child: CircularProgressIndicator(
                                color: Colors.white, strokeWidth: 3),
                          )
                        : actionLabelPrefix != null
                            ? Row(children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: SizedBox(
                                      width: 16,
                                      height: 16,
                                      child: actionLabelPrefix),
                                ),
                                Text(actionLabel,
                                    style: TextStyle(
                                        fontSize: labelFontSize,
                                        color: actionLabelColor),
                                    textScaler: TextScaler.linear(
                                        ScaleSize.textScaleFactor(context,
                                            maxTextScaleFactor: 2.6)))
                              ])
                            : Text(actionLabel,
                                style: TextStyle(
                                    fontSize: labelFontSize,
                                    color: actionLabelColor)))),
          ),
        ));
  }
}

class ExtendedTextButton extends StatelessWidget {
  final Function() onPressed;
  final Color color;
  final String actionLabel;
  final Widget? actionLabelPrefix;
  final bool loading;

  const ExtendedTextButton(
    this.onPressed, {
    super.key,
    this.actionLabelPrefix,
    this.color = const Color(0xfff55E00),
    this.actionLabel = "",
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) => Colors.transparent,
              ),
              minimumSize: const WidgetStatePropertyAll(Size.fromHeight(30)),
              padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 14, horizontal: 0))),
          onPressed: onPressed,
          child: Center(
              child: loading
                  ? CircularProgressIndicator(color: color, strokeWidth: 4)
                  : actionLabelPrefix != null
                      ? Row(children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: SizedBox(
                                width: 16,
                                height: 16,
                                child: actionLabelPrefix),
                          ),
                          Text(actionLabel,
                              style: TextStyle(fontSize: 16, color: color))
                        ])
                      : Text(actionLabel,
                          style: TextStyle(fontSize: 17, color: color))),
        ));
  }
}
