import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fullbooker/features/consumer/pages/event_details.dart';
import 'package:fullbooker/features/consumer/utils.dart';
import 'package:fullbooker/features/consumer/widgets/category_conveyer.dart';
import 'package:fullbooker/features/consumer/widgets/events_section.dart';
import 'package:fullbooker/features/host/controllers/category_controller.dart';
import 'package:fullbooker/features/host/controllers/product_controller.dart';
import 'package:fullbooker/features/host/models/categories.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/shared/widgets/appbar.dart';
import 'package:shimmer/shimmer.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<StatefulWidget> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  var productsController = ProductViewModel();
  var categoriesController = CategoryViewModel();
  List<Product>? products;
  List<Category>? categories;
  bool isLoading = false;

  void goToEventDetails(Product event, String locationName) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return EventDetails(event: event, productLocationName: locationName);
      }));
    });
  }

  @override
  void initState() {
    super.initState();
    categoriesController.repository
        .pullMultiple(1, 200, processResponseAsPage: true)
        .then((fetchedCategories) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          categories = fetchedCategories;
          products = getMultipleProducts();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    try {
      return Scaffold(
          appBar: const StandardNavBar(iconsColor: Colors.black),
          backgroundColor: Colors.white,
          body: SafeArea(
              child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: products == null
                  ? _buildShimmerEffect(width)
                  : CategoryConveyer(
                      categories: categories == null ? [] : categories!),
            ),
            products == null
                ? _buildShimmerEffect(width)
                : Expanded(
                    child: ListView(children: [
                    products!.length < 2
                        ? const SizedBox()
                        : EventsSection(
                            sectionName: "Popular Now",
                            onSeAllClick: () {},
                            events:
                                products!.sublist(0, min(products!.length, 2))),
                    products!.length < 4
                        ? const SizedBox()
                        : EventsSection(
                            sectionName: "Near You",
                            onSeAllClick: () {},
                            events:
                                products!.sublist(2, min(products!.length, 4))),
                    products!.length < 6
                        ? const SizedBox()
                        : EventsSection(
                            sectionName: "Recommended For You",
                            onSeAllClick: () {},
                            events:
                                products!.sublist(4, min(products!.length, 6)))
                  ]))
          ])));
    } catch (e, stack) {
      debugPrint('Page Error: $e\n$stack');
      return Scaffold(body: Center(child: Text('Error loading page, $e')));
    }
  }

  // Shimmer loading effect
  Widget _buildShimmerEffect(double width) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: 200,
        color: Colors.grey[300],
      ),
    );
  }
}
