import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/features/host/controllers/product_controller.dart';
import 'package:fullbooker/features/host/models/old_product.dart';
import 'package:fullbooker/shared/widgets/activities_table_widget.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/product_setup_nav_bar.dart';

@RoutePage()
class HostProductSummaryPage extends StatefulWidget {
  const HostProductSummaryPage({super.key, required this.host});

  final String host;

  @override
  State<StatefulWidget> createState() => _HostProductSummaryPageState();
}

class _HostProductSummaryPageState extends State<HostProductSummaryPage> {
  List<OldProduct>? products;
  ProductController productsController = ProductController();

  String? _errorMessage;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      final List<OldProduct> fetchedProducts =
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
          _errorMessage = failedToLoadProductsError;
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
                                      Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 10,
                                          ),
                                          child: Text(
                                            activitiesString,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
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
        ],
      ),
    );
  }
}
