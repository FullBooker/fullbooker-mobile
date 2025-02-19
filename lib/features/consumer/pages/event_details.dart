import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/features/consumer/pages/purchase_summary.dart';
import 'package:fullbooker/features/consumer/widgets/event_carousel.dart';
import 'package:fullbooker/features/consumer/widgets/host_details.dart';
import 'package:fullbooker/features/consumer/widgets/ratings.dart';
import 'package:fullbooker/features/consumer/widgets/ticket_booking.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:shimmer/shimmer.dart';

class EventDetails extends StatefulWidget {
  final Product event;
  final String productLocationName;

  const EventDetails(
      {super.key, required this.event, required this.productLocationName});

  @override
  State<StatefulWidget> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  bool isLoading = true;
  Polyline? routePolyline;
  Position? currentPosition;
  LatLng? eventLocation;

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

  Future<void> setPolyLines() async {
    try {
      var location = widget.event.locations.first;
      var coordinates = parseSRID(location.coordinates);
      var currentPos = await determinePosition();
      List<LatLng> po = [];
      po.add(coordinates);
      po.add(LatLng(currentPos.latitude, currentPos.longitude));
      var routePolylineSet = Polyline(
          polylineId: const PolylineId("Routes"),
          color: const Color(0xff4a54cd),
          width: 4,
          points: po);
      if (mounted) {
        setState(() {
          eventLocation = coordinates;
          currentPosition = currentPos;
          routePolyline = routePolylineSet;
          isLoading = false; // Data fetched, stop loading
        });
      }
    } catch (e) {
      debugPrint("Error fetching location: $e");
      setState(
          () => isLoading = false); // Stop loading even if there's an error
    }
  }

  @override
  void initState() {
    super.initState();
    setPolyLines();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final List<Map<String, dynamic>> reviews = [
      {
        "name": "Jane Mbithe",
        "profilePic": null,
        "rating": 5,
        "timeAgo": "6 months ago",
        "review":
            "The rock concert was pure energy from start to finish! The band was on fire, delivering every song with passion and precision. The lighting and sound setup amplified the atmosphere, creating an unforgettable experience."
      },
      {
        "name": "Brian Ochonga",
        "profilePic": null,
        "rating": 4,
        "timeAgo": "7 months ago",
        "review":
            "The band gave a raw and authentic performance, proving why they’re one of the rising stars in rock. The drummer’s solo was a highlight, and the lyrics hit home with so many in the audience."
      },
      {
        "name": "George Onsarigo",
        "profilePic": null,
        "rating": 3,
        "timeAgo": "2 years ago",
        "review":
            "What a show! From the moment the lights dimmed, the energy was electric. The hard rock numbers shook the venue, and the slower ballads gave us a chance to catch our breath."
      },
    ];

    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        Stack(children: [
          EventCarousel(
              product: widget.event,
              actionLabel: "View Map",
              onActionClick: (_) {}),
          Row(children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                    child: const Icon(Icons.app_registration_rounded,
                        color: Color(0xf0808080))),
              ),
            )
          ]),
        ]),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: HostDetails(hostID: widget.event.host),
        ),
        Expanded(
            child: ListView(shrinkWrap: true, children: [
          TicketBookingWidget(product: widget.event),
          CheckoutCard(
              product: widget.event, locationName: widget.productLocationName),
          currentPosition == null || eventLocation == null
              ? _buildShimmerEffect(width)
              : SizedBox(
                  width: width - 40,
                  child: AspectRatio(
                    aspectRatio: 1.5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: GoogleMap(
                        myLocationButtonEnabled: false,
                        myLocationEnabled: false,
                        zoomControlsEnabled: true,
                        gestureRecognizers: Set()
                          ..add(Factory<EagerGestureRecognizer>(
                              () => EagerGestureRecognizer())),
                        initialCameraPosition: CameraPosition(
                            zoom: 256,
                            target: LatLng(currentPosition!.latitude,
                                currentPosition!.longitude)),
                        polylines:
                            routePolyline == null ? {} : {routePolyline!},
                        markers: {
                          Marker(
                              markerId: const MarkerId("1"),
                              icon: BitmapDescriptor.defaultMarker,
                              position: LatLng(currentPosition!.latitude,
                                  currentPosition!.longitude)),
                          Marker(
                              markerId: const MarkerId("12"),
                              icon: BitmapDescriptor.defaultMarker,
                              position: eventLocation!),
                        },
                      ),
                    ),
                  ),
                ),
          Divider(thickness: 1, color: Colors.grey[300]),
          const RatingSummary(),
          for (var review in reviews) ReviewCard(review: review)
        ]))
      ]),
    ));
  }
}
