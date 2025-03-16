import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/features/host/controllers/product_controller.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/shared/entities/activities_table_widget.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/product_setup_nav_bar.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';
import 'package:fullbooker/shared/widgets/buttons.dart';

@RoutePage()
class HostProductSummaryPage extends StatefulWidget {
  const HostProductSummaryPage({super.key, required this.host});

  final String host;

  @override
  State<StatefulWidget> createState() => _HostProductSummaryPageState();
}

class _HostProductSummaryPageState extends State<HostProductSummaryPage> {
  List<Product>? products;
  ProductViewModel productsController = ProductViewModel();

  String? _errorMessage;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
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
                        ? const Center(child: AppLoading())
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
                                      ActivitiesTableTable(products: products!),
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
                () => context.router.push(CategorySelectionRoute()),
                actionLabel: 'New Product',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
