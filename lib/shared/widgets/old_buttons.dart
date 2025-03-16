import 'package:flutter/material.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';

// TODO(abiud): retire these buttons
class OldButton extends StatelessWidget {
  const OldButton(
    this.onPressed, {
    super.key,
    this.actionLabelPrefix,
    this.color = AppColors.primaryColor,
    required this.actionLabel,
    this.actionLabelColor = Colors.white,
    this.loading = false,
    this.labelFontSize = 16,
    this.verticalPadding = 12,
    this.elevation = 1,
    this.customHeight = 48,
    this.customWidth,
  });

  final String actionLabel;
  final Color actionLabelColor;
  final Widget? actionLabelPrefix;
  final Color color;
  final double? customHeight;
  final double? customWidth;
  final double elevation;
  final double labelFontSize;
  final bool loading;
  final Function() onPressed;
  final double verticalPadding;

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
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: actionLabelPrefix,
                          ),
                        ),
                        Text(
                          actionLabel,
                          style: TextStyle(
                            fontSize: labelFontSize,
                            color: actionLabelColor,
                          ),
                          textScaler: TextScaler.linear(
                            ScaleSize.textScaleFactor(
                              context,
                              maxTextScaleFactor: 2.6,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Text(
                      actionLabel,
                      softWrap: true,
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
  const ExtendedTextButton(
    this.onPressed, {
    super.key,
    this.actionLabelPrefix,
    this.color = AppColors.primaryColor,
    this.actionLabel = '',
    this.loading = false,
  });

  final String actionLabel;
  final Widget? actionLabelPrefix;
  final Color color;
  final bool loading;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) => Colors.transparent,
          ),
          minimumSize: const WidgetStatePropertyAll<Size>(Size.fromHeight(30)),
          padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(vertical: 14),
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: loading
              ? CircularProgressIndicator(color: color)
              : actionLabelPrefix != null
                  ? Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: actionLabelPrefix,
                          ),
                        ),
                        Text(
                          actionLabel,
                          style: TextStyle(fontSize: 16, color: color),
                        ),
                      ],
                    )
                  : Text(
                      actionLabel,
                      style: TextStyle(fontSize: 17, color: color),
                    ),
        ),
      ),
    );
  }
}
