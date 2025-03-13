import 'package:flutter/material.dart';
import 'package:fullbooker/features/host/controllers/product_controller.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/features/host/pages/category_selection.dart';
import 'package:fullbooker/shared/widgets/appbar.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';
import 'package:fullbooker/shared/widgets/button.dart';

class ActivitiesTable extends StatelessWidget {
  final List<Product> products;
  const ActivitiesTable({super.key, this.products = const []});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        border: const TableBorder(
          top: BorderSide(color: Colors.black12, width: 1),
          horizontalInside: BorderSide(color: Colors.black12, width: 1),
          verticalInside: BorderSide(color: Colors.black12, width: 1),
          left: BorderSide.none,
          right: BorderSide.none,
          bottom: BorderSide.none,
        ),
        columnSpacing: 10,
        horizontalMargin: 5,
        columns: const [
          DataColumn(label: _TableHeaderText('Tracking Number')),
          DataColumn(label: _TableHeaderText('Product Name')),
          DataColumn(label: _TableHeaderText('Price')),
          DataColumn(label: _TableHeaderText('Status')),
          DataColumn(label: _TableHeaderText('Next Actions')),
        ],
        rows: products.map((product) {
          return DataRow(
            cells: [
              DataCell(Text("#${product.number}", textAlign: TextAlign.center)),
              DataCell(Text(product.name, textAlign: TextAlign.center)),
              DataCell(Text(
                  product.pricing.isNotEmpty
                      ? "KES ${product.pricing.first.cost}"
                      : "_",
                  textAlign: TextAlign.center)),
              DataCell(Text(
                product.active ? "Active" : "Disabled",
                style: TextStyle(
                    color: product.active ? Colors.green : Colors.red),
                textAlign: TextAlign.center,
              )),
              const DataCell(
                  Text("Edit", style: TextStyle(color: Colors.orange))),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _TableHeaderText extends StatelessWidget {
  final String text;
  const _TableHeaderText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(fontWeight: FontWeight.bold),
      softWrap: true,
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
  bool _loading = true;
  String? _errorMessage;

  void _fetchProducts() async {
    try {
      var fetchedProducts = await productsController.repository
          .pullMultiple(1, 100, filters: {"host": widget.host});
      if (mounted) {
        setState(() {
          products = fetchedProducts;
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = "Failed to load products.";
          _loading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  void onContinueClick(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const CategorySelection()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const ProductSetupNavBar(step: ProductSteps.Products),
      bottomNavigationBar: const BottomNavBar(),
      body: Column(children: [
        Expanded(
          child: ListView(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: _loading
                      ? const Center(child: CircularProgressIndicator())
                      : _errorMessage != null
                          ? Center(child: Text(_errorMessage!))
                          : SizedBox(
                              width: width - 20,
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    const Center(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Text(
                                          "Activities",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17),
                                        ),
                                      ),
                                    ),
                                    ActivitiesTable(products: products!),
                                  ],
                                ),
                              ),
                            ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 8, vertical: 30),
            child: Button(() => onContinueClick(context),
                actionLabel: "New Product"),
          ),
        ),
      ]),
    );
  }
}
