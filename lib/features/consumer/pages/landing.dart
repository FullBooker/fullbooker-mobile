import 'package:flutter/material.dart';
import 'package:fullbooker/features/consumer/pages/event_details.dart';
import 'package:fullbooker/features/consumer/widgets/category_conveyer.dart';
import 'package:fullbooker/features/consumer/widgets/event_carousel.dart';
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
        .pullMultiple(1, 200)
        .then((fetchedCategories) {
      productsController.repository.pullMultiple(1, 100,
          processResponseAsPage: false,
          filters: {"active": "true"}).then((products_) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {
            categories = fetchedCategories;
            products = products_.where((product) {
              return product.image != null &&
                  product.pricing.isNotEmpty &&
                  product.locations.isNotEmpty &&
                  product.availability != null;
            }).toList();
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(children: [
          Stack(children: [
            products == null
                ? _buildShimmerEffect(width)
                : EventCarousel(
                    product: products!.firstWhere(
                        (product) => product.image != null,
                        orElse: () => products![0]),
                    actionLabel: "Buy This Ticket",
                    onActionClick: (locationName) =>
                        goToEventDetails(products![0], locationName)),
            const StandardNavBar(),
          ]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: products == null
                ? _buildShimmerEffect(width)
                : CategoryConveyer(
                    categories: categories == null ? [] : categories!),
          ),
          products == null
              ? Expanded(
                  child: ListView(children: [
                  _buildShimmerEffect(width),
                  _buildShimmerEffect(width),
                  _buildShimmerEffect(width)
                ]))
              : Expanded(
                  child: ListView(children: [
                  EventsSection(
                      sectionName: "Popular Now",
                      onSeAllClick: () {},
                      events: products!.sublist(0, 2)),
                  EventsSection(
                      sectionName: "Near You",
                      onSeAllClick: () {},
                      events: products!.sublist(2, 4)),
                  EventsSection(
                      sectionName: "Recommended For You",
                      onSeAllClick: () {},
                      events: products!.sublist(4, 6))
                ]))
        ])));
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
