import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fullbooker/features/auth/pages/login.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/divider.dart';
import 'package:fullbooker/shared/widgets/simple_stepper.dart';

class OverviewStep {
  final List<AssetImage> images;
  final String title;
  final String subTitle;

  OverviewStep(this.images, this.title, this.subTitle) {
    assert(images.length == 6);
  }
}

List<OverviewStep> defaultSteps = [
  OverviewStep(const [
    AssetImage("assets/images/overview1/rave2.png"),
    AssetImage("assets/images/overview1/classic_cars.png"),
    AssetImage("assets/images/overview1/gym.png"),
    AssetImage("assets/images/overview1/rave.png"),
    AssetImage("assets/images/overview1/bikes.png"),
    AssetImage("assets/images/overview1/cars.png"),
  ], "FIND YOUR FAVOURITE EVENTS HERE",
      "Discover, Book, Enjoy\nYour Favorite Events Await!"),
  OverviewStep(const [
    AssetImage("assets/images/overview2/run.png"),
    AssetImage("assets/images/overview2/rave.png"),
    AssetImage("assets/images/overview2/color.png"),
    AssetImage("assets/images/overview2/bike.png"),
    AssetImage("assets/images/overview2/cars.png"),
    AssetImage("assets/images/overview2/hike.png"),
  ], "FIND NEARBY EVENTS", "Your Go-To App for\nNearby Events!"),
  OverviewStep(const [
    AssetImage("assets/images/overview3/soccer.png"),
    AssetImage("assets/images/overview3/quads.png"),
    AssetImage("assets/images/overview3/wine.png"),
    AssetImage("assets/images/overview3/colors.png"),
    AssetImage("assets/images/overview3/quads.png"),
    AssetImage("assets/images/overview3/concert.png"),
  ], "UPDATE YOUR UPCOMING EVENTS HERE",
      "Keep Your Events Fresh\nUpdate Here!"),
];

class Overview extends StatefulWidget {
  late final List<OverviewStep> steps;
  final int currentStep;

  Overview({super.key, this.currentStep = 0}) {
    steps = defaultSteps;
  }

  @override
  State<Overview> createState() => OverviewState();
}

class OverviewState extends State<Overview> {
  int currentStep = 0;
  final ScrollController gridScrollController = ScrollController();

  void goToNextOverviewStep(BuildContext context) {
    if (currentStep < widget.steps.length - 1) {
      setState(() {
        currentStep += 1;
      });
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => const Login()));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentStep == 0 && widget.currentStep != 0) {
      currentStep = widget.currentStep;
    }

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (gridScrollController.hasClients) {
        setState(() {
          gridScrollController
              .jumpTo(gridScrollController.position.maxScrollExtent);
        });
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Expanded(
            child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: MasonryGridView.count(
                  crossAxisCount: 3,
                  controller: gridScrollController,
                  itemCount: 6,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 10,
                  itemBuilder: (context, index) {
                    return Image(
                        image: widget.steps[currentStep].images[index]);
                  },
                ))),
        Center(
            child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: SizedBox(
                  height: 280,
                  width: 280,
                  child: Column(children: [
                    Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(widget.steps[currentStep].title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                            textAlign: TextAlign.center)),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 22),
                        child: Text(widget.steps[currentStep].subTitle,
                            textAlign: TextAlign.center)),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: SimpleStepper(widget.steps.length,
                            height: 8, currentStep: currentStep)),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Button(const Text("Next"),
                          () => goToNextOverviewStep(context)),
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: RoundedDivider(height: 4, color: Colors.black))
                  ]),
                )))
      ]),
    );
  }
}
