import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart' as dz;
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/overview_step.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class OverviewPage extends StatefulWidget {
  // late final List<OverviewStep> steps;
  // final int currentStep;

  const OverviewPage({
    super.key,
  });

  @override
  State<OverviewPage> createState() => OverviewPageState();
}

class OverviewPageState extends State<OverviewPage> {
  final PageController controller = PageController();

  // int currentStep = 0;
  // final ScrollController gridScrollController = ScrollController();

  // void goToNextOverviewStep(BuildContext context) {
  //   if (currentStep < widget.steps.length - 1) {
  //     setState(() {
  //       currentStep += 1;
  //     });
  //   } else {
  //     context.router.replace(LoginRoute());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            width: size.width,
            height: size.height,
            child: PageView(
              controller: controller,
              children: <Widget>[
                ...overviewSteps.map(
                  (OverviewStep step) {
                    return SingleChildScrollView(
                      child: SizedBox(
                        height: size.height,
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              step.imagePath,
                              width: size.width,
                              height: size.height * .6,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 24),
                            Flexible(
                              child: Text(
                                step.title,
                                maxLines: 2,
                                textScaler: TextScaler.noScaling,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    Theme.of(context).textTheme.headlineSmall!,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                step.copy,
                                textScaler: TextScaler.noScaling,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyLarge!,
                              ),
                            ),
                            SizedBox(height: 24),
                            Flexible(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: PrimaryButton(
                                  onPressed: () {
                                    context.router.push(LoginRoute());
                                  },
                                  child: dz.right(loginString),
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            Flexible(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: SecondaryButton(
                                  onPressed: () {
                                    context.router.push(SignUpRoute());
                                  },
                                  child: dz.right(createAccount),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            height: size.height * .1,
            child: SizedBox(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SmoothPageIndicator(
                    controller: controller,
                    count: overviewSteps.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Theme.of(context).primaryColor,
                      dotColor:
                          Theme.of(context).primaryColor.withValues(alpha: .6),
                      paintStyle: PaintingStyle.stroke,
                      dotWidth: 8,
                      dotHeight: 8,
                      radius: 8,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
