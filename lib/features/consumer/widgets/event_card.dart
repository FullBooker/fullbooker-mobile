import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/features/consumer/pages/event_details.dart';
import 'package:fullbooker/features/consumer/widgets/event_meta.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:shimmer/shimmer.dart';

class EventCard extends StatefulWidget {
  final Product product;
  final VoidCallback? onBuyClick;

  const EventCard({super.key, required this.product, this.onBuyClick});

  @override
  State<StatefulWidget> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  String? locationName;
  bool isLoading = true; // Track loading state
  double? distanceFromEvent;

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

  void goToEventDetails(Product event) {
    //WidgetsBinding.instance.addPostFrameCallback((_) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return EventDetails(event: event, productLocationName: locationName!);
    }));
    //});
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

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
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

  ProductPricing getLowestPrice() {
    var pricings = widget.product.pricing;
    pricings
        .sort((a, b) => double.parse(a.cost).compareTo(double.parse(b.cost)));
    return pricings.first;
  }

  String getStartDate() {
    if (widget.product.availability!["start"] != null) {
      var dateTime = DateTime.parse(
          "${widget.product.availability!["start"]} ${widget.product.availability!["start_time"]}");
      return DateFormat("E dd MMMM, hh:mm").format(dateTime);
    }

    var openTimes = widget.product.availability!["open_days"] as List<dynamic>;
    return "${(openTimes[0]["day_name"] as String).substring(0, 3)} ${openTimes[0]["opening_at"]} "
        "- ${openTimes[0]["closing_at"]}";
  }

  String getEndDate() {
    if (widget.product.availability!["end"] != null) {
      var dateTime = DateTime.parse(
          "${widget.product.availability!["end"]} ${widget.product.availability!["end_time"]}");
      return DateFormat("E dd MMMM, hh:mm").format(dateTime);
    }

    var openTimes = widget.product.availability!["open_days"] as List<dynamic>;
    return "${(openTimes.last["day_name"] as String).substring(0, 3)} "
        "${openTimes.last["opening_at"]} - ${openTimes.last["closing_at"]}";
  }

  @override
  void initState() {
    super.initState();
    fetchLocationName();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: widget.onBuyClick,
      child: Container(
        width: width * 0.45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
            topRight: Radius.circular(8),
            topLeft: Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 30,
              color: Colors.black.withValues(alpha: .1),
            ),
          ],
        ),
        child: isLoading
            ? _buildShimmerEffect(width)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    height: height / 5.5,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(widget.product.image!.file),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        EventMetaRow(width: width * 0.45)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Text(
                          "$locationName, ${distanceFromEvent?.toStringAsFixed(0) ?? "_"} km away",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '${getStartDate()} - ${getEndDate()}',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'From KES ${getLowestPrice().cost}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Button(
                            widget.onBuyClick ??
                                () => goToEventDetails(widget.product),
                            actionLabel: "Buy Ticket",
                            verticalPadding: 4,
                            elevation: 0,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
