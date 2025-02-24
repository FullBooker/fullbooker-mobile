import 'package:flutter/material.dart';
import 'package:fullbooker/shared/widgets/button.dart';
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

  const InformationModal(
      {super.key,
      this.action,
      this.title = "",
      this.message = const SizedBox(),
      this.actionTitle = "",
      this.height = 230,
      this.withSuccessTick = true,
      this.topDividerColor = const Color(0xfff55E00),
      this.topDividerHeight = 3});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: SizedBox(
          height: height,
          width: 380,
          child: Center(
              child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: RoundedDivider(
                          height: topDividerHeight, color: topDividerColor))),
              withSuccessTick
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Image.asset("assets/icons/ok.png",
                          width: 70, height: 70))
                  : const SizedBox(),
              title != ""
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center))
                  : const SizedBox(),
              message
            ]),
          )),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 5),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Button(action ?? () {}, actionLabel: actionTitle)))
        ],
        actionsAlignment: MainAxisAlignment.center);
  }
}
