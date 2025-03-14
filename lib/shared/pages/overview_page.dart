import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fullbooker/features/auth/pages/login.dart';
import 'package:fullbooker/shared/entities/data_mocks.dart';
import 'package:fullbooker/shared/entities/overview_step.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/simple_stepper.dart';

class OverviewPage extends StatefulWidget {
  late final List<OverviewStep> steps;
  final int currentStep;

  OverviewPage({super.key, this.currentStep = 0}) {
    steps = defaultSteps;
  }

  @override
  State<OverviewPage> createState() => OverviewPageState();
}

class OverviewPageState extends State<OverviewPage> {
  int currentStep = 0;
  final ScrollController gridScrollController = ScrollController();

  void goToNextOverviewStep(BuildContext context) {
    if (currentStep < widget.steps.length - 1) {
      setState(() {
        currentStep += 1;
      });
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<Login>(
          builder: (BuildContext context) => const Login(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentStep == 0 && widget.currentStep != 0) {
      currentStep = widget.currentStep;
    }

    SchedulerBinding.instance.addPostFrameCallback((Duration timeStamp) {
      if (gridScrollController.hasClients) {
        setState(() {
          gridScrollController
              .jumpTo(gridScrollController.position.maxScrollExtent);
        });
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Image(image: widget.steps[currentStep].images[0]),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: SizedBox(
                width: 280,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        widget.steps[currentStep].title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 22),
                      child: Text(
                        widget.steps[currentStep].subTitle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: SimpleStepper(
                        widget.steps.length,
                        height: 8,
                        currentStep: currentStep,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Button(
                        () => goToNextOverviewStep(context),
                        actionLabel: 'Next',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
