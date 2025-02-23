import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:geocoding/geocoding.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:shimmer/shimmer.dart';

class EventCarousel extends StatefulWidget {
  final Product product;
  final String actionLabel;
  final Function(String) onActionClick;

  const EventCarousel(
      {super.key,
      required this.product,
      required this.onActionClick,
      this.actionLabel = ""});

  @override
  State<StatefulWidget> createState() => _EventCarouselState();
}

class _EventCarouselState extends State<EventCarousel> {
  String? locationName;
  bool isLoading = true; // Track loading state
  double? distanceFromEvent;

  ProductPricing getLowestPrice() {
    var pricings = List<ProductPricing>.from(widget.product.pricing);
    pricings
        .sort((a, b) => double.parse(a.cost).compareTo(double.parse(b.cost)));
    return pricings.first;
  }

  Future<void> fetchLocationName() async {
    try {
      var location = widget.product.locations.first;
      var coordinates = parseSRID(location.coordinates);
      var placeMark = await placemarkFromCoordinates(
        coordinates.latitude,
        coordinates.longitude,
      );
      var distanceAway = await calculateDistanceAway();
      if (mounted) {
        setState(() {
          locationName = placeMark.first.name;
          distanceFromEvent = distanceAway;
          isLoading = false; // Data fetched, stop loading
        });
      }
    } catch (e) {
      debugPrint("Error fetching location: $e");
      setState(
          () => isLoading = false); // Stop loading even if there's an error
    }
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<double> calculateDistanceAway() async {
    var location = widget.product.locations.first;
    var coordinates = parseSRID(location.coordinates);
    var currentLocation = await determinePosition();
    var p =
        0.017453292519943295; //conversion factor from radians to decimal degrees, exactly math.pi/180
    var c = cos;
    var a = 0.5 -
        c((coordinates.latitude - currentLocation.latitude) * p) / 2 +
        c(currentLocation.latitude * p) *
            c(coordinates.latitude * p) *
            (1 - c((coordinates.longitude - currentLocation.longitude) * p)) /
            2;
    var radiusOfEarth = 6371;
    return radiusOfEarth * 2 * asin(sqrt(a));
  }

  @override
  void initState() {
    super.initState();
    fetchLocationName();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    List<String> images =
        widget.product.image == null ? [] : [widget.product.image!.file];
    images = images.isEmpty && widget.product.image != null
        ? [widget.product.image!.file]
        : images;

    return Stack(
      children: [
        isLoading
            ? _buildShimmerEffect(width)
            : CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(seconds: 15),
                ),
                items: images.map((imageUrl) {
                  return Stack(children: [
                    Container(
                      width: width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(imageUrl), fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      width: width,
                      color: Colors.black.withValues(alpha: 0.45), // Dark overlay
                    )
                  ]);
                }).toList(),
              ),
        Positioned(
          bottom: 20,
          left: 10,
          child: SizedBox(
              width: width / 2.5,
              child: Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                        "${widget.product.name}, $locationName, ${distanceFromEvent?.toStringAsFixed(0) ?? "Error"} km away",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 16)),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("from KES ${getLowestPrice().cost}",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 16)),
                )
              ])),
        ),
        Positioned(
          bottom: 20,
          right: 10,
          child: SizedBox(
              width: 170,
              height: 28,
              child: Button(() => widget.onActionClick(locationName!),
                  actionLabel: widget.actionLabel,
                  verticalPadding: 0,
                  labelFontSize: 16)),
        )
      ],
    );
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
