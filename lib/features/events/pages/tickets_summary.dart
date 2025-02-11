import 'package:flutter/material.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/features/events/controllers/product_controller.dart';
import 'package:fullbooker/features/events/models/currency.dart';
import 'package:fullbooker/features/events/models/product.dart';
import 'package:fullbooker/features/events/pages/host_product_summary.dart';
import 'package:fullbooker/shared/widgets/appbar.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/card.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';

class TicketsSummary extends StatefulWidget {
  final Product product;
  final Map<String, double> prices;
  final Map<String, int> amounts;
  final Currency currency;
  final List<String> selectedCategories;

  const TicketsSummary(
      {super.key,
      required this.product,
      required this.prices,
      required this.amounts,
      required this.currency,
      required this.selectedCategories});

  @override
  State<StatefulWidget> createState() => _TicketsSummaryState();
}

class _TicketsSummaryState extends State<TicketsSummary> {
  bool isLoading = false;
  var productController = ProductViewModel();

  void onContinueClick() {
    setState(() => isLoading = true);
    productController
        .createPricing(widget.product.id, widget.selectedCategories,
            widget.currency.id, widget.prices, widget.amounts)
        .then((prices) {
      if (prices == null) {
        setState(() => isLoading = false);
        if (mounted) {
          showSnackBar(
              "Failed to create pricing for product ${widget.product.name}",
              context);
        }
        return;
      } else {
        setState(() => isLoading = false);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => HostProductSummary(host: widget.product.host)));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double fontSize = 16;
    return Scaffold(
      appBar: const ProductSetupNavBar(step: ProductSteps.Products),
      body: Column(children: [
        Expanded(
            child: ListView(children: [
          PageHeader("", "Charges Summary",
              withLogo: false,
              widthFactor: 0.9,
              pageDescriptionPadding: 20,
              headerTopPadding: 0,
              pageTitleBottomPadding: 0,
              pageDescriptionFontSize: fontSize),
          for (var category in widget.selectedCategories)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: CustomCard(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text("$category TICKET".toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                  const Text("TOTAL CHARGEABLE (PER TICKET)",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        width: width * 0.7,
                        child: Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        "Amount (${widget.currency.code})",
                                        style: TextStyle(fontSize: fontSize)),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                      widget.prices[category]!.toString(),
                                      style: TextStyle(fontSize: fontSize)),
                                )
                              ]),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Service Fee (5%)",
                                        style: TextStyle(fontSize: fontSize)),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                        (widget.prices[category]! * 0.05)
                                            .toString(),
                                        style: TextStyle(fontSize: fontSize)),
                                  )
                                ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Total",
                                        style: TextStyle(
                                            color: const Color(0xf008AE32),
                                            fontSize: fontSize + 2,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                        (widget.prices[category]! * 1.05)
                                            .toString(),
                                        style: TextStyle(
                                            color: const Color(0xf008AE32),
                                            fontSize: fontSize + 2,
                                            fontWeight: FontWeight.w700)),
                                  )
                                ]),
                          )
                        ]),
                      ))
                ]),
              ),
            )
        ])),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: width / 8, vertical: 30),
              child: Button(onContinueClick,
                  actionLabel: "Publish", loading: isLoading),
            ))
      ]),
    );
  }
}
