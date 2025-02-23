import 'package:flutter/material.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';

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
  final double? customHeight;
  final double? customWidth;

  const Button(
    this.onPressed, {
    super.key,
    this.actionLabelPrefix,
    this.color = const Color(0xfff55E00),
    this.actionLabel = "",
    this.actionLabelColor = Colors.white,
    this.loading = false,
    this.labelFontSize = 16,
    this.verticalPadding = 12,
    this.elevation = 1,
    this.customHeight = 48,
    this.customWidth,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: customWidth ?? size.width,
      height: customHeight,
      child: RawMaterialButton(
        elevation: elevation,
        fillColor: color,
        splashColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        onPressed: onPressed,
        child: Center(
          child: loading
              ? const AppLoading()
              : actionLabelPrefix != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: SizedBox(
                              width: 16, height: 16, child: actionLabelPrefix),
                        ),
                        Text(
                          actionLabel,
                          style: TextStyle(
                              fontSize: labelFontSize, color: actionLabelColor),
                          textScaler: TextScaler.linear(
                            ScaleSize.textScaleFactor(context,
                                maxTextScaleFactor: 2.6),
                          ),
                        )
                      ],
                    )
                  : Text(
                      actionLabel,
                      style: TextStyle(
                        fontSize: labelFontSize,
                        color: actionLabelColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
        ),
      ),
    );
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
                    ? Row(
                        children: [
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
                        ],
                      )
                    : Text(actionLabel,
                        style: TextStyle(fontSize: 17, color: color))),
      ),
    );
  }
}
