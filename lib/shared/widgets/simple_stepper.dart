import 'package:flutter/material.dart';
import 'package:fullbooker/shared/widgets/divider.dart';

class SimpleStepper extends StatefulWidget {
  final int steps;
  final double width;
  final double height;
  final int color;
  final int idleStepColor;
  final int currentStep;

  const SimpleStepper(
    this.steps, {
    super.key,
    this.width = 50,
    this.height = 40,
    this.color = 0xf0AE4808,
    this.idleStepColor = 0xf0FFDEDE,
    this.currentStep = 0,
  });

  @override
  State<SimpleStepper> createState() => SimpleStepperState();
}

class SimpleStepperState extends State<SimpleStepper> {
  void addSteps(List<Widget> steps) {
    steps.add(
      Flexible(
        child: Padding(
          padding: const EdgeInsets.only(right: 4),
          child: RoundedDivider(
            height: widget.height / 2,
            color: Color(widget.color),
          ),
        ),
      ),
    );
    for (int count = 0; count < widget.steps; count++) {
      steps.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Container(
            width: widget.height,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.height),
              color: count <= widget.currentStep
                  ? Color(widget.color)
                  : Color(widget.idleStepColor),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> steps = <Widget>[];
    addSteps(steps);
    return Center(
      child: SizedBox(
        height: widget.height,
        width: widget.width + (((widget.height) + 4) * widget.steps) + 4,
        child: Row(children: steps),
      ),
    );
  }
}
