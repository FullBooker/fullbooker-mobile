import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/features/consumer/pages/gallery.dart';
import 'package:fullbooker/features/consumer/pages/landing.dart';
import 'package:fullbooker/features/consumer/widgets/date_picker.dart';
import 'package:fullbooker/features/consumer/widgets/event_carousel.dart';
import 'package:fullbooker/features/consumer/widgets/host_details.dart';
import 'package:fullbooker/features/consumer/widgets/ratings.dart';
import 'package:fullbooker/features/consumer/widgets/ticket_booking.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/shared/widgets/appbar.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
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
  DateTime? selectedDate;

  var mapKey = GlobalKey();

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

  void goHome() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const Landing()));
  }

  void goToGallery() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const Gallery(images: [])));
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
        "profilePic": "https://i.imgur.com/aen9woM.png",
        "rating": 5,
        "timeAgo": "6 months ago",
        "review":
            "The rock concert was pure energy from start to finish! The band was on fire, delivering every song with passion and precision. The lighting and sound setup amplified the atmosphere, creating an unforgettable experience."
      },
      {
        "name": "Brian Ochonga",
        "profilePic": "https://i.imgur.com/aen9woM.png",
        "rating": 4,
        "timeAgo": "7 months ago",
        "review":
            "The band gave a raw and authentic performance, proving why they’re one of the rising stars in rock. The drummer’s solo was a highlight, and the lyrics hit home with so many in the audience."
      },
      {
        "name": "George Onsarigo",
        "profilePic": "https://i.imgur.com/aen9woM.png",
        "rating": 3,
        "timeAgo": "2 years ago",
        "review":
            "What a show! From the moment the lights dimmed, the energy was electric. The hard rock numbers shook the venue, and the slower ballads gave us a chance to catch our breath."
      },
    ];

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(children: [
                Stack(children: [
                  GestureDetector(
                    onTap: () => goToGallery(),
                    child: EventCarousel(
                        product: widget.event,
                        actionLabel: "View Map",
                        onActionClick: (_) => Scrollable.ensureVisible(
                            mapKey.currentContext!,
                            duration: const Duration(milliseconds: 500))),
                  ),
                  const StandardNavBar(
                      showSearchBar: false, pageTitle: "Event Details")
                ]),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Column(spacing: 12, children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: Wrap(
                          runAlignment: WrapAlignment.spaceBetween,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.start,
                          spacing: 32,
                          children: [
                            HostDetails(
                                product: widget.event, width: width / 2),
                            DatePicker(
                                product: widget.event,
                                onDateSelected: (date) =>
                                    setState(() => selectedDate = date))
                          ]),
                    ),
                    TicketBookingWidget(
                        product: widget.event,
                        selectedDate: selectedDate,
                        productLocationName: widget.productLocationName),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Map",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              Text("${widget.event.name}, "
                                  "${widget.productLocationName}")
                            ]),
                      ),
                    ),
                    currentPosition == null || eventLocation == null
                        ? _buildShimmerEffect(width)
                        : SizedBox(
                            width: width - 10,
                            child: AspectRatio(
                              aspectRatio: 1.5,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                child: _googleMapWidget(),
                              ),
                            ),
                          ),
                    SizedBox(
                      width: width * 0.6,
                      child: SecondaryButton(goHome,
                          actionLabel: "Back Home", elevation: 0),
                    ),
                    Divider(thickness: 1, color: Colors.grey[300]),
                    const RatingSummary(),
                    for (var review in reviews) ReviewCard(review: review)
                  ]),
                ),
              ]),
            ))
          ]),
        ));
  }

  Widget _googleMapWidget() {
    return GoogleMap(
      key: mapKey,
      myLocationButtonEnabled: false,
      myLocationEnabled: false,
      zoomControlsEnabled: true,
      gestureRecognizers: {}
        ..add(Factory<EagerGestureRecognizer>(() => EagerGestureRecognizer())),
      initialCameraPosition: CameraPosition(zoom: 15, target: eventLocation!),
      markers: {
        Marker(
            markerId: const MarkerId("12"),
            icon: BitmapDescriptor.defaultMarker,
            position: eventLocation!),
      },
    );
  }
}
