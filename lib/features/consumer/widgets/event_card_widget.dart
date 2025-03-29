import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/features/consumer/widgets/event_meta_widget.dart';
import 'package:fullbooker/features/host/models/old_product.dart';
import 'package:fullbooker/presentation/core/components/shimmers.dart';
import 'package:fullbooker/shared/widgets/old_buttons.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:map_location_picker/map_location_picker.dart';

class EventCardWidget extends StatefulWidget {
  const EventCardWidget({super.key, required this.product, this.onBuyClick});

  final VoidCallback? onBuyClick;
  final OldProduct product;

  @override
  State<StatefulWidget> createState() => _EventCardWidgetState();
}

class _EventCardWidgetState extends State<EventCardWidget> {
  double? distanceFromEvent;
  bool isLoading = true;
  String? locationName;

  @override
  void initState() {
    super.initState();
    fetchLocationName();
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

  // TODO(abiud): this is repeated. Extract into a shared utils
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future<Position>.error(locationServicesDisabled);
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future<Position>.error(locationServicesDenied);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future<Position>.error(locationServicesPermanentlyDenied);
    }
    return Geolocator.getCurrentPosition();
  }

  Future<double> calculateDistanceAway() async {
    final ProductLocation location = widget.product.locations.first;
    final LatLng coordinates = parseSRID(location.coordinates);
    final Position currentLocation = await determinePosition();
    // Conversion factor from radians to decimal degrees, exactly math.pi/180
    const double p = 0.017453292519943295;
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

  ProductPricing getLowestPrice() {
    final List<ProductPricing> prices = widget.product.pricing;
    prices.sort(
      (ProductPricing a, ProductPricing b) =>
          double.parse(a.cost).compareTo(double.parse(b.cost)),
    );
    return prices.first;
  }

  String getStartDate() {
    if (widget.product.availability!['start'] != null) {
      final DateTime dateTime = DateTime.parse(
        "${widget.product.availability!["start"]} ${widget.product.availability!["start_time"]}",
      );
      return DateFormat('E dd MMMM, hh:mm').format(dateTime);
    }

    final List<dynamic> openTimes =
        widget.product.availability!['open_days'] as List<dynamic>;
    return "${(openTimes[0]["day_name"] as String).substring(0, 3)} ${openTimes[0]["opening_at"]} "
        "- ${openTimes[0]["closing_at"]}";
  }

  String getEndDate() {
    if (widget.product.availability!['end'] != null) {
      final DateTime dateTime = DateTime.parse(
        "${widget.product.availability!["end"]} ${widget.product.availability!["end_time"]}",
      );
      return DateFormat('E dd MMMM, hh:mm').format(dateTime);
    }

    final List<dynamic> openTimes =
        widget.product.availability!['open_days'] as List<dynamic>;
    return "${(openTimes.last["day_name"] as String).substring(0, 3)} "
        "${openTimes.last["opening_at"]} - ${openTimes.last["closing_at"]}";
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

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
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 30,
              color: Colors.black.withValues(alpha: .1),
            ),
          ],
        ),
        child: isLoading
            ? LandingPageShimmer()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    height: height / 5.5,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(widget.product.image!.file),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        EventMetaWidget(width: width * 0.45),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.product.name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Theme.of(context).primaryColor),
                        ),
                        Text(
                          "$locationName, ${distanceFromEvent?.toStringAsFixed(0) ?? "_"} km away",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          '${getStartDate()} - ${getEndDate()}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          'From KES ${getLowestPrice().cost}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: OldButton(
                            widget.onBuyClick ??
                                () => context.router.push(
                                      EventDetailsRoute(
                                        event: widget.product,
                                        productLocationName: locationName!,
                                      ),
                                    ),
                            actionLabel: buyTicketString,
                            verticalPadding: 4,
                            elevation: 0,
                          ),
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
