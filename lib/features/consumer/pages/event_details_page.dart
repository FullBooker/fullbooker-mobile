import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/features/consumer/widgets/date_picker_widget.dart';
import 'package:fullbooker/features/consumer/widgets/event_carousel_widget.dart';
import 'package:fullbooker/features/consumer/widgets/host_details_widget.dart';
import 'package:fullbooker/features/consumer/widgets/rating_summary_widget.dart';
import 'package:fullbooker/features/consumer/widgets/review_card_widget.dart';
import 'package:fullbooker/features/consumer/widgets/ticket_booking_widget.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/presentation/core/components/shimmers.dart';
import 'package:fullbooker/shared/entities/data_mocks.dart';
import 'package:fullbooker/shared/widgets/old_secondary_button.dart';
import 'package:fullbooker/shared/widgets/standard_nav_bar.dart';
import 'package:map_location_picker/map_location_picker.dart';

@RoutePage()
class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({
    super.key,
    required this.event,
    required this.productLocationName,
  });

  final Product event;
  final String productLocationName;

  @override
  State<StatefulWidget> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  Position? currentPosition;
  LatLng? eventLocation;
  bool isLoading = true;
  GlobalKey<State<StatefulWidget>> mapKey = GlobalKey();
  Polyline? routePolyline;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    setPolyLines();
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

  Future<void> setPolyLines() async {
    try {
      final ProductLocation location = widget.event.locations.first;
      final LatLng coordinates = parseSRID(location.coordinates);
      final Position currentPos = await determinePosition();
      final List<LatLng> po = <LatLng>[];
      po.add(coordinates);
      po.add(LatLng(currentPos.latitude, currentPos.longitude));
      final Polyline routePolylineSet = Polyline(
        polylineId: const PolylineId('Routes'),
        color: const Color(0xff4a54cd),
        width: 4,
        points: po,
      );
      if (mounted) {
        setState(() {
          eventLocation = coordinates;
          currentPosition = currentPos;
          routePolyline = routePolylineSet;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(
        () => isLoading = false,
      );
    }
  }

  Widget _googleMapWidget() {
    return GoogleMap(
      key: mapKey,
      myLocationButtonEnabled: false,
      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{}
        ..add(Factory<EagerGestureRecognizer>(() => EagerGestureRecognizer())),
      initialCameraPosition: CameraPosition(zoom: 15, target: eventLocation!),
      markers: <Marker>{
        Marker(
          markerId: const MarkerId('12'),
          position: eventLocation!,
        ),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => context.router
                              .push(GalleryRoute(images: const <String>[])),
                          child: EventCarouselWidget(
                            product: widget.event,
                            actionLabel: viewMapString,
                            onActionClick: (_) => Scrollable.ensureVisible(
                              mapKey.currentContext!,
                              duration: const Duration(milliseconds: 500),
                            ),
                          ),
                        ),
                        const StandardNavBar(
                          showSearchBar: false,
                          pageTitle: eventDetailsString,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      child: Column(
                        spacing: 12,
                        children: <Widget>[
                          SizedBox(
                            width: double.maxFinite,
                            child: Wrap(
                              runAlignment: WrapAlignment.spaceBetween,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 32,
                              children: <Widget>[
                                HostDetailsWidget(
                                  product: widget.event,
                                  width: width / 2,
                                ),
                                DatePickerWidget(
                                  product: widget.event,
                                  onDateSelected: (DateTime? date) =>
                                      setState(() => selectedDate = date),
                                ),
                              ],
                            ),
                          ),
                          TicketBookingWidget(
                            product: widget.event,
                            selectedDate: selectedDate,
                            productLocationName: widget.productLocationName,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text(
                                    mapString,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text('${widget.event.name}, '
                                      '${widget.productLocationName}'),
                                ],
                              ),
                            ),
                          ),
                          if (currentPosition == null || eventLocation == null)
                            LandingPageShimmer()
                          else
                            SizedBox(
                              width: width - 10,
                              child: AspectRatio(
                                aspectRatio: 1.5,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 10,
                                  ),
                                  child: _googleMapWidget(),
                                ),
                              ),
                            ),
                          SizedBox(
                            width: width * 0.6,
                            child: OldSecondaryButton(
                              () => context.router.push(ConsumerHomeRoute()),
                              actionLabel: backHomeString,
                              elevation: 0,
                            ),
                          ),
                          Divider(thickness: 1, color: Colors.grey[300]),
                          const RatingSummaryWidget(),
                          for (Map<String, dynamic> review
                              in eventReviewsDummyData)
                            ReviewCardWidget(review: review),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
