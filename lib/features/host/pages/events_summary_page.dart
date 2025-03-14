import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/features/host/controllers/product_controller.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/shared/entities/data_mocks.dart';
import 'package:fullbooker/shared/entities/event_creation_model.dart';
import 'package:fullbooker/shared/widgets/event_creation_steps.dart';
import 'package:fullbooker/shared/widgets/product_setup_nav_bar.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';

@RoutePage()
class EventsSummaryPage extends StatefulWidget {
  const EventsSummaryPage({super.key});

  @override
  State<StatefulWidget> createState() => _EventsSummaryPageState();
}

class _EventsSummaryPageState extends State<EventsSummaryPage> {
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

          context.router.push(HostProductSummaryRoute(host: host['id']));
        });
      });
    });
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
                      () => context.router.push(CategorySelectionRoute()),
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
