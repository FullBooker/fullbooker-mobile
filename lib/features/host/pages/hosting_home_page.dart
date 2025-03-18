import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/data_mocks.dart';
import 'package:fullbooker/shared/entities/event_creation_model.dart';
import 'package:fullbooker/shared/widgets/event_creation_steps.dart';
import 'package:fullbooker/shared/widgets/product_setup_nav_bar.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';
import 'package:fullbooker/shared/widgets/old_buttons.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';

@RoutePage()
class HostingHomePage extends StatefulWidget {
  const HostingHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HostingHomePageState();
}

class _HostingHomePageState extends State<HostingHomePage> {
  // bool hasLoaded = false;
  // ProductViewModel productsController = ProductViewModel();

  // @override
  // void initState() {
  //   super.initState();
  //   productsController.repository
  //       .post(<String, Object?>{}, hostsEndpoint).then((dynamic host) {
  //     productsController.repository.pullMultiple(
  //       1,
  //       100,
  //       processResponseAsPage: true,
  //       filters: <String, dynamic>{'host': host['id']},
  //     ).then((List<Product> products_) {
  //       WidgetsBinding.instance.addPostFrameCallback((_) {
  //         if (products_.isEmpty) {
  //           setState(() => hasLoaded = true);
  //           return;
  //         }

  //         context.router.push(HostProductSummaryRoute(host: host['id']));
  //       });
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const ProductSetupNavBar(),
      bottomNavigationBar: const BottomNavBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                const PageHeader(
                  '',
                  letsGetStarted,
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
              child: OldButton(
                () => context.router.push(CategorySelectionRoute()),
                actionLabel: continueString,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
