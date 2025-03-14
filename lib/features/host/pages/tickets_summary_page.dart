import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/features/host/controllers/product_controller.dart';
import 'package:fullbooker/features/host/models/currency.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/product_setup_nav_bar.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/card.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';

@RoutePage()
class TicketsSummaryPage extends StatefulWidget {
  const TicketsSummaryPage({
    super.key,
    required this.product,
    required this.prices,
    required this.amounts,
    required this.currency,
    required this.selectedCategories,
  });

  final Map<String, int> amounts;
  final Currency currency;
  final Map<String, double> prices;
  final Product product;
  final List<String> selectedCategories;

  @override
  State<StatefulWidget> createState() => _TicketsSummaryPageState();
}

class _TicketsSummaryPageState extends State<TicketsSummaryPage> {
  bool isLoading = false;
  ProductViewModel productController = ProductViewModel();

  void onContinueClick() {
    setState(() => isLoading = true);
    productController
        .createPricing(
      widget.product.id,
      widget.selectedCategories,
      widget.currency.id,
      widget.prices,
      widget.amounts,
    )
        .then((List<Map<String, Object?>>? prices) {
      if (prices == null) {
        setState(() => isLoading = false);
        if (mounted) {
          showSnackBar(
            'Failed to create pricing for product ${widget.product.name}',
            context,
          );
        }
        return;
      } else {
        setState(() => isLoading = false);

        context.router
            .push(HostProductSummaryRoute(host: widget.product.host.id));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    const double fontSize = 16;
    return Scaffold(
      appBar: const ProductSetupNavBar(step: ProductSteps.Products),
      bottomNavigationBar: const BottomNavBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                const PageHeader(
                  'Charges Summary',
                  '',
                  withLogo: false,
                  widthFactor: 0.9,
                  pageDescriptionPadding: 0,
                  pageTitleBottomPadding: 10,
                  pageHeaderFontSize: 20,
                  pageDescriptionTopPadding: 0,
                  pageDescriptionFontSize: 0,
                ),
                for (String category in widget.selectedCategories)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: CustomCard(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              '$category TICKET'.toUpperCase(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Text(
                            'TOTAL CHARGEABLE (PER TICKET)',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SizedBox(
                              width: width * 0.7,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 10,
                                          ),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Amount (${widget.currency.code})',
                                              style: const TextStyle(
                                                fontSize: fontSize,
                                              ),
                                              softWrap: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          widget.prices[category]!.toString(),
                                          style: const TextStyle(
                                            fontSize: fontSize,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        const Expanded(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Service Fee (5%)',
                                              softWrap: true,
                                              style:
                                                  TextStyle(fontSize: fontSize),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            (widget.prices[category]! * 0.05)
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: fontSize,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Total',
                                            style: TextStyle(
                                              color: Color(0xf008AE32),
                                              fontSize: fontSize + 2,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            (widget.prices[category]! * 1.05)
                                                .toString(),
                                            style: const TextStyle(
                                              color: Color(0xf008AE32),
                                              fontSize: fontSize + 2,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: width / 8, vertical: 30),
              child: Button(
                onContinueClick,
                actionLabel: 'Publish',
                loading: isLoading,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
