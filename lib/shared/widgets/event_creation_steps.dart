import 'package:flutter/material.dart';
import 'package:fullbooker/shared/entities/event_creation_model.dart';
import 'package:fullbooker/shared/widgets/rounded_floating_action.dart';

class EventCreationStep extends StatelessWidget {
  const EventCreationStep(this.step, {super.key});

  final EventCreationStepModel step;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 130,
      width: MediaQuery.of(context).size.width - 40,
      child: Row(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: RoundedFloatingAction('${step.number}', height: 65),
            ),
          ),
          Wrap(
            direction: Axis.vertical,
            children: <Widget>[
              SizedBox(
                width: width - 120,
                child: Text(
                  step.title,
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                width: width - 120,
                child: Text(
                  step.description,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
