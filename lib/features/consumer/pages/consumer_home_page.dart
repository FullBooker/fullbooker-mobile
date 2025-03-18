import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/features/consumer/utils.dart';
import 'package:fullbooker/features/consumer/widgets/category_conveyer_widget.dart';
import 'package:fullbooker/features/consumer/widgets/events_section_widget.dart';
import 'package:fullbooker/features/host/controllers/category_controller.dart';
import 'package:fullbooker/features/host/controllers/product_controller.dart';
import 'package:fullbooker/features/host/models/categories.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/presentation/core/components/shimmers.dart';
import 'package:fullbooker/shared/widgets/standard_nav_bar.dart';

@RoutePage()
class ConsumerHomePage extends StatefulWidget {
  const ConsumerHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _ConsumerHomePageState();
}

class _ConsumerHomePageState extends State<ConsumerHomePage> {
  ProductViewModel productsController = ProductViewModel();
  CategoryViewModel categoriesController = CategoryViewModel();
  List<Product>? products;
  Map<String, Category>? categories;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        categories = getCategories();
        products = getMultipleProducts();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StandardNavBar(iconsColor: Colors.black),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: products == null
                  ? LandingPageShimmer()
                  : CategoryConveyerWidget(
                      categories: categories == null
                          ? <String, Category>{}
                          : categories!,
                    ),
            ),
            if (products == null)
              LandingPageShimmer()
            else
              Expanded(
                child: ListView(
                  children: <Widget>[
                    if (products!.length < 2)
                      const SizedBox()
                    else
                      EventsSectionWidget(
                        sectionName: popularNowString,
                        onSeAllClick: () {},
                        events: products!.sublist(0, min(products!.length, 2)),
                      ),
                    if (products!.length < 4)
                      const SizedBox()
                    else
                      EventsSectionWidget(
                        sectionName: nearYouString,
                        onSeAllClick: () {},
                        events: products!.sublist(2, min(products!.length, 4)),
                      ),
                    if (products!.length < 6)
                      const SizedBox()
                    else
                      EventsSectionWidget(
                        sectionName: recommendedString,
                        onSeAllClick: () {},
                        events: products!.sublist(4, min(products!.length, 6)),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
