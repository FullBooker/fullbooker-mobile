import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/features/host/controllers/product_controller.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/shared/entities/bound.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/product_setup_nav_bar.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';
import 'package:fullbooker/shared/widgets/old_buttons.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';
import 'package:geocoding/geocoding.dart';
import 'package:map_location_picker/map_location_picker.dart';

@RoutePage()
class LocationSelectionPage extends StatefulWidget {
  const LocationSelectionPage(
    this.product, {
    super.key,
    required this.productType,
  });

  final Product product;
  final ProductTypes productType;

  @override
  State<StatefulWidget> createState() => _LocationSelectionPageState();
}

class _LocationSelectionPageState extends State<LocationSelectionPage> {
  Placemark? address;
  String? addressName;
  String? autocompletePlace;
  CameraPosition? cameraPosition;
  late LatLng defaultLatLng;
  String draggedAddress = '';
  late LatLng draggedLatLng;
  Completer<GoogleMapController> googleMapController =
      Completer<GoogleMapController>();

  Prediction? initialValue;
  bool isLoading = false;
  late String mapStyle;
  List<Placemark>? placeMarks;
  ProductViewModel productController = ProductViewModel();
  LatLng? selectedLocation;

  @override
  void initState() {
    super.initState();
    _gotoUserCurrentPosition();
    defaultLatLng = const LatLng(-1.286389, 36.817223);
    draggedLatLng = defaultLatLng;
    cameraPosition = CameraPosition(target: defaultLatLng, zoom: 15);
  }

  void onContinueClick() {
    if (selectedLocation == null) {
      showSnackBar(selectLocationPrompt);
      return;
    }
    setState(() => isLoading = true);
    _getAddress(selectedLocation!).then((String address) {
      productController
          .createLocation(
        widget.product.id,
        selectedLocation!.latitude,
        selectedLocation!.longitude,
        address,
      )
          .then((Map<String, Object?>? location) {
        if (location == null) {
          setState(() {
            isLoading = false;
          });
        } else {
          setState(() => isLoading = false);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (widget.productType == ProductTypes.Event) {
              context.router.push(
                DateSelectionRoute(
                  product: widget.product,
                  location: location,
                ),
              );
            } else {
              context.router.push(
                ActivityDateSelectionRoute(
                  product: widget.product,
                  location: location,
                ),
              );
            }
          });
        }
      });
    });
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: okThanksString,
          onPressed: () {
            // Code to execute.
          },
        ),
        content: Text(message),
        duration: const Duration(milliseconds: 5000),
        width: 340, // Width of the SnackBar.
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0, vertical: 10, // Inner padding for SnackBar content.
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<dynamic> _gotoUserCurrentPosition() async {
    final Position currentPosition = await _determineUserCurrentPosition();
    _gotoSpecificPosition(
      LatLng(currentPosition.latitude, currentPosition.longitude),
    );
  }

  Future<dynamic> _gotoSpecificPosition(LatLng position) async {
    final GoogleMapController mapController = await googleMapController.future;
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 15),
      ),
    );
    await _getAddress(position);
  }

  Future<String> _getAddress(LatLng position) async {
    placeMarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    address = placeMarks![0];
    final String addressString =
        '${address!.street},${address!.locality},${address!.administrativeArea}, ${address!.country}';
    setState(() {
      draggedAddress = addressString;
    });
    return addressString;
  }

  Future<dynamic> _determineUserCurrentPosition() async {
    LocationPermission locationPermission;
    final bool isLocationServiceEnabled =
        await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      // TODO(abiud): show a good error message here
      debugPrint("user don't enable location permission");
    }

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        // TODO(abiud): show a good error message here

        debugPrint('user denied location permission');
      }
    }
    if (locationPermission == LocationPermission.deniedForever) {
      // TODO(abiud): show a good error message here

      debugPrint('user denied permission forever');
    }
    return Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );
  }

  // checks if provided latlong is within a country
  bool _inBounds(LatLng point) {
    final Bound keBounds = Bound(east: 42, west: 35, north: 5.05, south: -4.7);
    final bool eastBound = point.longitude < keBounds.east;
    final bool westBound = point.longitude > keBounds.west;
    bool inLong;

    inLong = eastBound && westBound;

    final bool inLat =
        point.latitude > keBounds.south && point.latitude < keBounds.north;
    return inLat && inLong;
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const ProductSetupNavBar(step: ProductSteps.Products),
      bottomNavigationBar: const BottomNavBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                PageHeader(
                  'Where will this ${widget.productType.name} happen ?',
                  'This address will only be shared after clients have booked a ticket',
                  withLogo: false,
                  widthFactor: 0.9,
                  pageDescriptionPadding: 10,
                  pageTitleBottomPadding: 5,
                  pageHeaderFontSize: 20,
                ),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: SizedBox(
                          width: width,
                          child: MapLocationPicker(
                            apiKey: kMapsAPIKey,
                            popOnNextButtonTaped: true,
                            currentLatLng: cameraPosition!.target,
                            topCardColor: Colors.white,
                            backButton: Image.asset(locationIconPath),
                            hideBottomCard: true,
                            hideMoreOptions: true,
                            hideMapTypeButton: true,
                            hideLocationButton: true,
                            searchHintText: 'Where is the product located ?',
                            mapType: MapType.hybrid,
                            onNext: (GeocodingResult? result) {
                              if (result != null) {
                                final LatLng location = LatLng(
                                  result.geometry.location.lat,
                                  result.geometry.location.lng,
                                );
                                if (!_inBounds(location)) {
                                  showSnackBar(
                                    'Please select a location within Kenya',
                                  );
                                  return;
                                }
                                setState(() {
                                  addressName = result.formattedAddress ?? '';
                                  selectedLocation = location;
                                });
                              }
                            },
                            onSuggestionSelected:
                                (PlacesDetailsResponse? response) {
                              setState(() {
                                if (response != null) {
                                  addressName =
                                      response.result.formattedAddress ?? '';
                                  selectedLocation = LatLng(
                                    response.result.geometry!.location.lat,
                                    response.result.geometry!.location.lng,
                                  );
                                }
                              });
                            },
                            onLongPress: (LatLng latLng) {
                              if (!_inBounds(latLng)) {
                                return showSnackBar(selectLocationWithinKenya);
                              }
                              setState(() => selectedLocation = latLng);
                            },
                            onDecodeAddress:
                                (GeocodingResult? geocodingResult) {
                              if (geocodingResult != null) {
                                final LatLng location = LatLng(
                                  geocodingResult.geometry.location.lat,
                                  geocodingResult.geometry.location.lng,
                                );
                                if (!_inBounds(location)) {
                                  return showSnackBar(
                                    selectLocationWithinKenya,
                                  );
                                }
                                setState(() {
                                  selectedLocation = location;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: 100,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: width / 8,
                                  vertical: 30,
                                ),
                                child: OldButton(
                                  onContinueClick,
                                  actionLabel: continueString,
                                  loading: isLoading,
                                  verticalPadding: 0,
                                  elevation: 0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
