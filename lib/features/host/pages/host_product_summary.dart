import 'package:flutter/material.dart';
import 'package:fullbooker/features/host/controllers/product_controller.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/features/host/pages/category_selection.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/appbar.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';
import 'package:fullbooker/shared/widgets/button.dart';

class ActivitiesTable extends StatelessWidget {
  const ActivitiesTable({super.key, this.products = const <Product>[]});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        border: const TableBorder(
          top: BorderSide(color: Colors.black12),
          horizontalInside: BorderSide(color: Colors.black12),
          verticalInside: BorderSide(color: Colors.black12),
        ),
        columnSpacing: 10,
        horizontalMargin: 5,
        columns: const <DataColumn>[
          DataColumn(label: _TableHeaderText('Tracking Number')),
          DataColumn(label: _TableHeaderText('Product Name')),
          DataColumn(label: _TableHeaderText('Price')),
          DataColumn(label: _TableHeaderText('Status')),
          DataColumn(label: _TableHeaderText('Next Actions')),
        ],
        rows: products.map((Product product) {
          return DataRow(
            cells: <DataCell>[
              DataCell(Text('#${product.number}', textAlign: TextAlign.center)),
              DataCell(Text(product.name, textAlign: TextAlign.center)),
              DataCell(
                Text(
                  product.pricing.isNotEmpty
                      ? 'KES ${product.pricing.first.cost}'
                      : '_',
                  textAlign: TextAlign.center,
                ),
              ),
              DataCell(
                Text(
                  product.active ? 'Active' : 'Disabled',
                  style: TextStyle(
                    color: product.active ? Colors.green : Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const DataCell(
                Text('Edit', style: TextStyle(color: Colors.orange)),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _TableHeaderText extends StatelessWidget {
  const _TableHeaderText(this.text);

  final String text;

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
  const HostProductSummary({super.key, required this.host});

  final String host;

  @override
  State<StatefulWidget> createState() => _HostProductSummaryState();
}

class _HostProductSummaryState extends State<HostProductSummary> {
  List<Product>? products;
  ProductViewModel productsController = ProductViewModel();

  String? _errorMessage;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  void onContinueClick(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).push(
        MaterialPageRoute<CategorySelection>(
          builder: (_) => const CategorySelection(),
        ),
      );
    });
  }

  Future<void> _fetchProducts() async {
    try {
      final List<Product> fetchedProducts =
          await productsController.repository.pullMultiple(
        1,
        100,
        filters: <String, dynamic>{'host': widget.host},
      );
      if (mounted) {
        setState(() {
          products = fetchedProducts;
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Failed to load products.';
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const ProductSetupNavBar(step: ProductSteps.Products),
      bottomNavigationBar: const BottomNavBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
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
                                    border: Border.all(),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: <Widget>[
                                      const Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 10,
                                          ),
                                          child: Text(
                                            'Activities',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17,
                                            ),
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
              padding:
                  EdgeInsets.symmetric(horizontal: width / 8, vertical: 30),
              child: Button(
                () => onContinueClick(context),
                actionLabel: 'New Product',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
