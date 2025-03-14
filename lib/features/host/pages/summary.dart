import 'package:flutter/material.dart';
import 'package:fullbooker/features/host/controllers/product_controller.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/features/host/pages/category_selection_page.dart';
import 'package:fullbooker/features/host/pages/host_product_summary.dart';
import 'package:fullbooker/shared/widgets/product_setup_nav_bar.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';
import 'package:fullbooker/shared/widgets/rounded_floating_action.dart';

class EventCreationStepModel {
  const EventCreationStepModel(this.number, this.title, this.description);

  final String description;
  final int number;
  final String title;
}

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

const List<EventCreationStepModel> eventCreationSteps =
    <EventCreationStepModel>[
  EventCreationStepModel(
    1,
    'Tell us about your product',
    'What activities do you have?  When do they happen?  Where are they located?',
  ),
  EventCreationStepModel(
    2,
    'Upload Photos and videos of your product',
    'A picture is worth a thousand words, share photos and videos that showcase your products',
  ),
  EventCreationStepModel(
    3,
    'Publish Your Product',
    'Make it official, publish your product and start selling',
  ),
];

class EventsSummary extends StatefulWidget {
  const EventsSummary({super.key});

  @override
  State<StatefulWidget> createState() => _EventsSummaryState();
}

class _EventsSummaryState extends State<EventsSummary> {
  bool hasLoaded = false;
  ProductViewModel productsController = ProductViewModel();

  @override
  void initState() {
    super.initState();
    productsController.repository
        .post(<String, Object?>{}, '/hosts/').then((dynamic host) {
      productsController.repository.pullMultiple(
        1,
        100,
        processResponseAsPage: true,
        filters: <String, dynamic>{'host': host['id']},
      ).then((List<Product> products_) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (products_.isEmpty) {
            setState(() => hasLoaded = true);
            return;
          }
          Navigator.of(context).push(
            MaterialPageRoute<HostProductSummary>(
              builder: (_) => HostProductSummary(host: host['id']),
            ),
          );
        });
      });
    });
  }

  void goToCategorySelection(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<CategorySelectionPage>(
        builder: (BuildContext context) => const CategorySelectionPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const ProductSetupNavBar(),
      bottomNavigationBar: const BottomNavBar(),
      body: hasLoaded
          ? Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      const PageHeader(
                        '',
                        "Let's Get you Started",
                        withLogo: false,
                        widthFactor: 0.9,
                        pageDescriptionPadding: 40,
                      ),
                      for (EventCreationStepModel step in eventCreationSteps)
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: EventCreationStep(step),
                        ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width / 8,
                      vertical: 30,
                    ),
                    child: Button(
                      () => goToCategorySelection(context),
                      actionLabel: 'Continue',
                    ),
                  ),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
