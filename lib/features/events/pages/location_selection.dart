import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fullbooker/features/events/controllers/product_controller.dart';
import 'package:fullbooker/features/events/models/product.dart';
import 'package:fullbooker/features/events/pages/activity_date_selection.dart';
import 'package:fullbooker/features/events/pages/category_selection.dart';
import 'package:fullbooker/features/events/pages/date_selection.dart';
import 'package:fullbooker/shared/widgets/appbar.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';
import 'package:geocoding/geocoding.dart';
import 'package:map_location_picker/map_location_picker.dart';

class Bound {
  double east;
  double west;
  double north;
  double south;

  Bound(
      {required this.east,
      required this.west,
      required this.north,
      required this.south});
}

class LocationSelection extends StatefulWidget {
  final Product product;
  final ProductTypes productType;

  const LocationSelection(this.product, {super.key, required this.productType});

  @override
  State<StatefulWidget> createState() => _LocationSelectionState();
}

class _LocationSelectionState extends State<LocationSelection> {
  String? addressName;
  String? autocompletePlace;
  Prediction? initialValue;
  Completer<GoogleMapController> googleMapController = Completer();
  CameraPosition? cameraPosition;
  late LatLng defaultLatLng;
  late LatLng draggedLatLng;
  String draggedAddress = "";
  late String mapStyle;
  Placemark? address;
  List<Placemark>? placeMarks;
  LatLng? selectedLocation;
  bool isLoading = false;
  var productController = ProductViewModel();

  Future _gotoUserCurrentPosition() async {
    Position currentPosition = await _determineUserCurrentPosition();
    _gotoSpecificPosition(
        LatLng(currentPosition.latitude, currentPosition.longitude));
  }

  Future _gotoSpecificPosition(LatLng position) async {
    GoogleMapController mapController = await googleMapController.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 15)));
    await _getAddress(position);
  }

  Future _getAddress(LatLng position) async {
    placeMarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    address = placeMarks![0];
    String addressString =
        "${address!.street},${address!.locality},${address!.administrativeArea}, ${address!.country}";
    setState(() {
      draggedAddress = addressString;
    });
  }

  Future _determineUserCurrentPosition() async {
    LocationPermission locationPermission;
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      debugPrint("user don't enable location permission");
    }

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        debugPrint("user denied location permission");
      }
    }
    if (locationPermission == LocationPermission.deniedForever) {
      debugPrint("user denied permission forever");
    }
    return await Geolocator.getCurrentPosition(
        locationSettings:
            const LocationSettings(accuracy: LocationAccuracy.high));
  }

  // checks if provided latlong is within a country
  bool _inBounds(LatLng point) {
    var keBounds = Bound(east: 42, west: 35, north: 5.05, south: -4.7);
    bool eastBound = point.longitude < keBounds.east;
    bool westBound = point.longitude > keBounds.west;
    bool inLong;

    inLong = eastBound && westBound;

    var inLat =
        point.latitude > keBounds.south && point.latitude < keBounds.north;
    return inLat && inLong;
  }

  void onContinueClick() {
    if (selectedLocation == null) {
      showSnackBar("Please select a location");
      return;
    }
    setState(() => isLoading = true);
    productController
        .createLocation(widget.product.id, selectedLocation!.latitude,
            selectedLocation!.longitude)
        .then((location) {
      if (location == null) {
        setState(() {
          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (widget.productType == ProductTypes.Event) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => DateSelection(
                    product: widget.product, location: location)));
          } else {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => ActivityDateSelection(
                    product: widget.product, location: location)));
          }
        });
      }
    });
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            // Code to execute.
          },
        ),
        content: Text(message),
        duration: const Duration(milliseconds: 5000),
        width: 340, // Width of the SnackBar.
        padding: const EdgeInsets.symmetric(
            horizontal: 8.0, vertical: 10 // Inner padding for SnackBar content.
            ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _gotoUserCurrentPosition();
    defaultLatLng = const LatLng(-1.286389, 36.817223);
    draggedLatLng = defaultLatLng;
    cameraPosition = CameraPosition(target: defaultLatLng, zoom: 15);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: const ProductSetupNavBar(step: ProductSteps.Products),
        body: Column(
          children: [
            Expanded(
              child: Column(children: [
                PageHeader(
                    "Where will this ${widget.productType.name} happen ?", "",
                    withLogo: false,
                    widthFactor: 0.9,
                    pageDescriptionPadding: 0,
                    headerTopPadding: 10,
                    pageTitleBottomPadding: 0,
                    pageHeaderFontSize: 20,
                    pageDescriptionTopPadding: 0),
                SizedBox(
                    height: height * 0.67,
                    width: width,
                    child: MapLocationPicker(
                        apiKey: "AIzaSyDen5uldAkBcBPog8ajqpThWXGsiXmYSyU",
                        popOnNextButtonTaped: true,
                        currentLatLng: cameraPosition!.target,
                        debounceDuration: const Duration(milliseconds: 500),
                        hideBackButton: true,
                        hideBottomCard: true,
                        hideMoreOptions: true,
                        searchHintText: "Where is the product located ?",
                        mapType: MapType.hybrid,
                        onNext: (GeocodingResult? result) {
                          if (result != null) {
                            var location = LatLng(result.geometry.location.lat,
                                result.geometry.location.lng);
                            if (!_inBounds(location)) {
                              showSnackBar(
                                  "Please select a location within Kenya");
                              return;
                            }
                            setState(() {
                              addressName = result.formattedAddress ?? "";
                              selectedLocation = location;
                            });
                          }
                        },
                        onSuggestionSelected:
                            (PlacesDetailsResponse? response) {
                          setState(() {
                            if (response != null) {
                              addressName =
                                  response.result.formattedAddress ?? "";
                              selectedLocation = LatLng(
                                  response.result.geometry!.location.lat,
                                  response.result.geometry!.location.lng);
                            }
                          });
                        },
                        onLongPress: (LatLng latLng) {
                          if (!_inBounds(latLng)) {
                            showSnackBar(
                                "Please select a location within Kenya");
                            return;
                          }
                          setState(() => selectedLocation = latLng);
                        },
                        onDecodeAddress: (GeocodingResult? geocodingResult) {
                          if (geocodingResult != null) {
                            var location = LatLng(
                                geocodingResult.geometry.location.lat,
                                geocodingResult.geometry.location.lng);
                            if (!_inBounds(location)) {
                              showSnackBar(
                                  "Please select a location within Kenya");
                              return;
                            }
                            setState(() {
                              selectedLocation = location;
                            });
                          }
                        })),
              ]),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: width / 8, vertical: 30),
                  child: Button(onContinueClick,
                      actionLabel: "Continue", loading: isLoading),
                ))
          ],
        ));
  }
}
