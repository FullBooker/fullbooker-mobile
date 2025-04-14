import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/infrastructure/location/location_handler.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:fullbooker/shared/widgets/custom_text_input.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:heroicons/heroicons.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/actions/update_current_product_action.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

@RoutePage()
class ChooseLocationPage extends StatefulWidget {
  const ChooseLocationPage({super.key});

  @override
  State<ChooseLocationPage> createState() => _ChooseLocationPageState();
}

class _ChooseLocationPageState extends State<ChooseLocationPage> {
  late MapLibreMapController _mapController;
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> _searchResults = <Map<String, dynamic>>[];

  LatLng selectedLatLng = LatLng(
    kDefaultLocation.latitude,
    kDefaultLocation.longitude,
  );
  String selectedAddress = '';
  String selectedCity = '';
  bool _showSearchResults = false;

  @override
  void initState() {
    super.initState();
    _initLocation();
  }

  Future<void> _initLocation() async {
    final LatLng userLocation = await LocationHandler.getUserLocation();
    setState(() => selectedLatLng = userLocation);
  }

  Future<void> _onSearchChanged(String query) async {
    final List<Map<String, dynamic>> results =
        await LocationHandler.searchLocation(query);
    setState(() {
      _searchResults
        ..clear()
        ..addAll(results);
      _showSearchResults = results.isNotEmpty;
    });
  }

  Future<void> _selectLocation(Map<String, dynamic> location) async {
    final Map<String, dynamic>? resolved =
        await LocationHandler.resolvePlace(location['place_id']);
    if (resolved != null) {
      final LatLng latLng = LatLng(
        resolved['geometry']['location']['lat'],
        resolved['geometry']['location']['lng'],
      );

      _updateSelectedLocation(
        latLng,
        resolved['name'] ?? location['description'],
        resolved['formatted_address'] ?? '',
      );

      await _mapController.moveCamera(CameraUpdate.newLatLng(latLng));
      _setMarker(latLng);
    }
  }

  void _updateSelectedLocation(LatLng latLng, String address, String city) {
    setState(() {
      selectedLatLng = latLng;
      selectedAddress = address;
      selectedCity = city;
      _searchController.text = address;
      _showSearchResults = false;
    });

    context.dispatch(
      UpdateCurrentProductAction(
        lat: latLng.latitude.toString(),
        long: latLng.longitude.toString(),
        address: address,
        city: city,
      ),
    );
  }

  void _setMarker(LatLng latLng) {
    _mapController.clearSymbols();
    _mapController.addSymbol(
      SymbolOptions(
        geometry: latLng,
        iconImage: 'marker-15',
        iconSize: 1.5,
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showBell: false, title: pickLocation),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: <Widget>[
                CustomTextInput(
                  hintText: searchLocation,
                  onChanged: _onSearchChanged,
                  keyboardType: TextInputType.name,
                  prefixIconData: HeroIcons.mapPin,
                  initialValue: _searchController.text,
                ),
                if (_showSearchResults)
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _searchResults.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Map<String, dynamic> location =
                          _searchResults[index];
                      return ListTile(
                        onTap: () => _selectLocation(location),
                        leading: const HeroIcon(HeroIcons.mapPin),
                        title: Text(location['description'] ?? ''),
                      );
                    },
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: MapLibreMap(
              styleString:
                  'https://api.maptiler.com/maps/streets/style.json?key=$kMapTilerAPIKey',
              initialCameraPosition: CameraPosition(
                target: selectedLatLng,
                zoom: 14,
              ),
              myLocationEnabled: true,
              onMapCreated: (MapLibreMapController controller) {
                _mapController = controller;
                _setMarker(selectedLatLng);
              },
              onMapClick: (Point<double> point, LatLng latLng) async {
                final Map<String, dynamic>? result =
                    await LocationHandler.reverseGeocode(latLng);
                final String address =
                    result?['address_components']?.first['long_name'] ??
                        UNKNOWN;
                final String city = result?['formatted_address'] ??
                    '${latLng.latitude}, ${latLng.longitude}';
                _updateSelectedLocation(latLng, address, city);
                _setMarker(latLng);
              },
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: AppColors.bodyTextColor.withAlpha(25),
                  blurRadius: 6,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (selectedAddress.isNotEmpty)
                  Text(
                    selectedAddress,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                if (selectedCity.isNotEmpty)
                  Text(
                    selectedCity,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                const SizedBox(height: 12),
                PrimaryButton(
                  onPressed: () {
                    context.dispatch(
                      UpdateCurrentProductAction(
                        lat: selectedLatLng.latitude.toString(),
                        long: selectedLatLng.longitude.toString(),
                        address: selectedAddress,
                        city: selectedCity,
                      ),
                    );
                    context.router.maybePop();
                  },
                  child: d.right(continueString),
                ),
                SecondaryButton(
                  onPressed: () => context.router.maybePop(),
                  child: d.right(cancelString),
                  fillColor: Colors.transparent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
