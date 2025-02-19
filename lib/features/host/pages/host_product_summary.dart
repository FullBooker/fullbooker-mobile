import 'package:flutter/material.dart';
import 'package:fullbooker/features/host/controllers/product_controller.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/features/host/pages/category_selection.dart';
import 'package:fullbooker/shared/widgets/appbar.dart';
import 'package:fullbooker/shared/widgets/button.dart';

class ActivitiesTable extends StatelessWidget {
  final List<Product> products;
  const ActivitiesTable({super.key, this.products = const []});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      border: TableBorder.all(width: 1),
      columnSpacing: 10,
      horizontalMargin: 5,
      columns: const <DataColumn>[
        DataColumn(label: Text('Tracking \nNumber')),
        DataColumn(label: Text('Product \nName')),
        DataColumn(label: Text('Price')),
        DataColumn(label: Text('Status')),
        DataColumn(label: Flexible(child: Text('Next \nActions'))),
      ],
      rows: [
        for (var product in products)
          if (product.pricing.isNotEmpty)
            DataRow(
              cells: <DataCell>[
                DataCell(
                    SizedBox(width: 80, child: Text("#${product.number}"))),
                DataCell(Text(product.name)),
                DataCell(SizedBox(
                  width: 80,
                  child: Text("KES ${product.pricing.first.cost.toString()}",
                      style: const TextStyle(color: Color(0xf015B9FF)),
                      overflow: TextOverflow.visible,
                      softWrap: true),
                )),
                DataCell(Text(product.active ? "Active" : "Disabled",
                    style: TextStyle(
                        color: product.active ? Colors.green : Colors.red))),
                const DataCell(
                    Text('Edit', style: TextStyle(color: Colors.orange))),
              ],
            )
      ],
    );
  }
}

class HostProductSummary extends StatefulWidget {
  final String host;

  const HostProductSummary({super.key, required this.host});

  @override
  State<StatefulWidget> createState() => _HostProductSummaryState();
}

class _HostProductSummaryState extends State<HostProductSummary> {
  List<Product>? products;
  var productsController = ProductViewModel();

  void onContinueClick(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const CategorySelection()));
    });
  }

  @override
  void initState() {
    super.initState();
    productsController.repository.pullMultiple(1, 100,
        processResponseAsPage: false,
        filters: {"host": widget.host}).then((products_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() => products = products_);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const ProductSetupNavBar(step: ProductSteps.Products),
      body: Column(children: [
        Expanded(
            child: ListView(children: [
          Center(
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: products == null
                      ? const Center(child: CircularProgressIndicator())
                      : SizedBox(
                          width: width - 20,
                          child: Column(
                            children: [
                              const Center(
                                  child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Text("Activities & Events",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22)),
                              )),
                              ActivitiesTable(products: products!),
                            ],
                          ))))
        ])),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: width / 8, vertical: 30),
              child: Button(() => onContinueClick(context),
                  actionLabel: "New Product"),
            ))
      ]),
    );
  }
}
