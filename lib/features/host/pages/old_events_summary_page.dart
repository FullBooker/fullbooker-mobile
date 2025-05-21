import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/endpoints.dart';
import 'package:fullbooker/features/host/controllers/product_controller.dart';
import 'package:fullbooker/features/host/models/old_product.dart';
import 'package:fullbooker/shared/entities/data_mocks.dart';
import 'package:fullbooker/shared/entities/event_creation_model.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/event_creation_steps.dart';
import 'package:fullbooker/shared/widgets/product_setup_nav_bar.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';

@RoutePage()
class EventsSummaryPage extends StatefulWidget {
  const EventsSummaryPage({super.key});

  @override
  State<StatefulWidget> createState() => _EventsSummaryPageState();
}

class _EventsSummaryPageState extends State<EventsSummaryPage> {
  bool hasLoaded = false;
  ProductController productsController = ProductController();

  @override
  void initState() {
    super.initState();
    productsController.repository
        .post(<String, Object?>{}, kDevHostsEndpoint).then((dynamic host) {
      productsController.repository.pullMultiple(
        1,
        100,
        processResponseAsPage: true,
        filters: <String, dynamic>{'host': host['id']},
      ).then((List<OldProduct> products_) {
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
    return Scaffold(
      appBar: const ProductSetupNavBar(),
      body: hasLoaded
          ? Column(
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
              ],
            )
          : const Center(child: AppLoading()),
    );
  }
}
