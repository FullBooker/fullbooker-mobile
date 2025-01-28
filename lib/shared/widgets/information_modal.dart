import 'package:flutter/material.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/divider.dart';

class InformationModal extends StatelessWidget {
  final String title;
  final String message;
  final String actionTitle;
  final Function()? action;

  const InformationModal(
      {super.key,
      this.action,
      this.title = "",
      this.message = "",
      this.actionTitle = ""});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: SizedBox(
          height: 230,
          width: 380,
          child: Center(
              child: Column(children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: const RoundedDivider(
                        height: 3, color: Color(0xfff55E00)))),
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child:
                    Image.asset("assets/icons/ok.png", width: 70, height: 70)),
            Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center)),
            Text(message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16)),
          ])),
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
