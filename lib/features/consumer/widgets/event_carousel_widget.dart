import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/presentation/core/components/shimmers.dart';
import 'package:fullbooker/shared/widgets/old_buttons.dart';
import 'package:geocoding/geocoding.dart';
import 'package:map_location_picker/map_location_picker.dart';

class EventCarouselWidget extends StatefulWidget {
  final Product product;
  final String actionLabel;
  final Function(String) onActionClick;

  const EventCarouselWidget({
    super.key,
    required this.product,
    required this.onActionClick,
    this.actionLabel = '',
  });

  @override
  State<StatefulWidget> createState() => _EventCarouselWidgetState();
}

class _EventCarouselWidgetState extends State<EventCarouselWidget> {
  String? locationName;
  bool isLoading = true;
  double? distanceFromEvent;

  ProductPricing getLowestPrice() {
    final List<ProductPricing> prices =
        List<ProductPricing>.from(widget.product.pricing);
    prices.sort(
      (ProductPricing a, ProductPricing b) =>
          double.parse(a.cost).compareTo(double.parse(b.cost)),
    );
    return prices.first;
  }

  Future<void> fetchLocationName() async {
    try {
      final ProductLocation location = widget.product.locations.first;
      final LatLng coordinates = parseSRID(location.coordinates);
      final List<Placemark> placeMark = await placemarkFromCoordinates(
        coordinates.latitude,
        coordinates.longitude,
      );
      final double distanceAway = await calculateDistanceAway();
      if (mounted) {
        setState(() {
          locationName = placeMark.first.name;
          distanceFromEvent = distanceAway;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(
        () => isLoading = false,
      );
    }
  }

  // TODO(abiud): extract this into a shared util
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future<Position>.error(locationServicesDisabled);
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
        return Future<Position>.error(locationServicesDenied);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future<Position>.error(locationServicesPermanentlyDenied);
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return Geolocator.getCurrentPosition();
  }

  Future<double> calculateDistanceAway() async {
    final ProductLocation location = widget.product.locations.first;
    final LatLng coordinates = parseSRID(location.coordinates);
    final Position currentLocation = await determinePosition();
    const double p =
        0.017453292519943295; //conversion factor from radians to decimal degrees, exactly math.pi/180
    const double Function(num radians) c = cos;
    final double a = 0.5 -
        c((coordinates.latitude - currentLocation.latitude) * p) / 2 +
        c(currentLocation.latitude * p) *
            c(coordinates.latitude * p) *
            (1 - c((coordinates.longitude - currentLocation.longitude) * p)) /
            2;
    const int radiusOfEarth = 6371;
    return radiusOfEarth * 2 * asin(sqrt(a));
  }

  @override
  void initState() {
    super.initState();
    fetchLocationName();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    List<String> images = widget.product.image == null
        ? <String>[]
        : <String>[widget.product.image!.file];
    images = images.isEmpty && widget.product.image != null
        ? <String>[widget.product.image!.file]
        : images;

    return Stack(
      children: <Widget>[
        if (isLoading)
          LandingPageShimmer()
        else
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 15),
            ),
            items: images.map((String imageUrl) {
              return Stack(
                children: <Widget>[
                  Container(
                    width: width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    color: Colors.black.withValues(alpha: 0.45), // Dark overlay
                  ),
                ],
              );
            }).toList(),
          ),
        Positioned(
          bottom: 20,
          left: 10,
          child: SizedBox(
            width: width / 2.5,
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      // TODO(abiud): fix this. We can't show error in the distance to the user
                      "${widget.product.name}, $locationName, ${distanceFromEvent?.toStringAsFixed(0) ?? "Error"} km away",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'from KES ${getLowestPrice().cost}',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 10,
          child: SizedBox(
            width: 170,
            child: OldButton(
              () => widget.onActionClick(locationName!),
              actionLabel: widget.actionLabel,
              verticalPadding: 0,
            ),
          ),
        ),
      ],
    );
  }
}
