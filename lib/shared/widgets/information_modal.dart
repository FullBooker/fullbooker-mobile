import 'package:flutter/material.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/shared/widgets/old_buttons.dart';
import 'package:fullbooker/shared/widgets/divider.dart';

class InformationModal extends StatelessWidget {
  final String title;
  final Widget message;
  final String actionTitle;
  final Function()? action;
  final double height;
  final bool withSuccessTick;
  final Color topDividerColor;
  final double topDividerHeight;

  const InformationModal({
    super.key,
    this.action,
    this.title = '',
    this.message = const SizedBox(),
    this.actionTitle = '',
    this.height = 230,
    this.withSuccessTick = true,
    this.topDividerColor = AppColors.primaryColor,
    this.topDividerHeight = 3,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: height,
        width: 380,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: RoundedDivider(
                      height: topDividerHeight,
                      color: topDividerColor,
                    ),
                  ),
                ),
                if (withSuccessTick)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Image.asset(
                      okImageIconPath,
                      width: 70,
                      height: 70,
                    ),
                  )
                else
                  const SizedBox(),
                if (title != '')
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  )
                else
                  const SizedBox(),
                message,
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 5),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: OldButton(action ?? () {}, actionLabel: actionTitle),
          ),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
