import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/features/consumer/pages/event_details_page.dart';
import 'package:fullbooker/features/consumer/utils.dart';
import 'package:fullbooker/features/consumer/widgets/category_conveyer_widget.dart';
import 'package:fullbooker/features/consumer/widgets/events_section_widget.dart';
import 'package:fullbooker/features/host/controllers/category_controller.dart';
import 'package:fullbooker/features/host/controllers/product_controller.dart';
import 'package:fullbooker/features/host/models/categories.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/shared/widgets/standard_nav_bar.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class ConsumerLandingPage extends StatefulWidget {
  const ConsumerLandingPage({super.key});

  @override
  State<StatefulWidget> createState() => _ConsumerLandingPageState();
}

class _ConsumerLandingPageState extends State<ConsumerLandingPage> {
  ProductViewModel productsController = ProductViewModel();
  CategoryViewModel categoriesController = CategoryViewModel();
  List<Product>? products;
  Map<String, Category>? categories;
  bool isLoading = false;

  void goToEventDetails(Product event, String locationName) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).push(
        MaterialPageRoute<EventDetailsPage>(
          builder: (_) {
            return EventDetailsPage(
              event: event,
              productLocationName: locationName,
            );
          },
        ),
      );
    });
  }

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
    final double width = MediaQuery.of(context).size.width;
    try {
      return Scaffold(
        appBar: const StandardNavBar(iconsColor: Colors.black),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: products == null
                    ? _buildShimmerEffect(width)
                    : CategoryConveyerWidget(
                        categories: categories == null
                            ? <String, Category>{}
                            : categories!,
                      ),
              ),
              if (products == null)
                _buildShimmerEffect(width)
              else
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      if (products!.length < 2)
                        const SizedBox()
                      else
                        EventsSectionWidget(
                          sectionName: 'Popular Now',
                          onSeAllClick: () {},
                          events:
                              products!.sublist(0, min(products!.length, 2)),
                        ),
                      if (products!.length < 4)
                        const SizedBox()
                      else
                        EventsSectionWidget(
                          sectionName: 'Near You',
                          onSeAllClick: () {},
                          events:
                              products!.sublist(2, min(products!.length, 4)),
                        ),
                      if (products!.length < 6)
                        const SizedBox()
                      else
                        EventsSectionWidget(
                          sectionName: 'Recommended For You',
                          onSeAllClick: () {},
                          events:
                              products!.sublist(4, min(products!.length, 6)),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      );
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
