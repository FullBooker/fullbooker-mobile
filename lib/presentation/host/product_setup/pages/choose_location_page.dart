import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/actions/select_location_action.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/infrastructure/location/location_handler.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:fullbooker/presentation/shared/custom_bottom_nav_container.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/custom_text_input.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class ChooseLocationPage extends StatefulWidget {
  const ChooseLocationPage({super.key});

  @override
  State<ChooseLocationPage> createState() => _ChooseLocationPageState();
}

class _ChooseLocationPageState extends State<ChooseLocationPage> {
  LatLng selectedLatLng = kDefaultLocation;
  late GoogleMapController _mapController;

  String selectedAddress = '';
  String selectedCity = '';

  bool _isSearching = false;
  bool _isResolving = false;

  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> _searchResults = <Map<String, dynamic>>[];
  final Completer<GoogleMapController> _controllerCompleter =
      Completer<GoogleMapController>();

  bool _showSearchResults = false;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _setUserLocation() async {
    setState(() {
      _isResolving = true;
    });

    final LatLng location = await LocationHandler.getUserLocation();

    final Map<String, dynamic>? geoResult =
        await LocationHandler.reverseGeocode(location);

    if (!mounted) return;

    if (geoResult != null) {
      final List<dynamic>? components = geoResult['address_components'];
      final String address = geoResult['formatted_address'] ?? kUnknownAddress;

      final String city = components?.firstWhere(
            (dynamic comp) =>
                (comp['types'] as List<dynamic>).contains('locality'),
            orElse: () => null,
          )?['long_name'] ??
          'Unknown City';

      context.dispatch(
        SelectLocationAction(
          lat: location.latitude.toString(),
          long: location.longitude.toString(),
          address: address,
          city: city,
          coordinates:
              'SRID=4326;POINT (${location.longitude} ${location.latitude})',
        ),
      );

      setState(() {
        selectedLatLng = location;
        selectedAddress = address;
        selectedCity = city;
        _showSearchResults = false;
        _isResolving = false;
      });

      await _mapController.animateCamera(
        CameraUpdate.newLatLngZoom(location, 15),
      );
    }
  }

  Future<void> _onSearchChanged(String query) async {
    _debounceTimer?.cancel();

    setState(() {
      _isSearching = true;
      _searchResults.clear();
      _showSearchResults = false;
    });

    if (query.length < 3) {
      setState(() {
        _isSearching = false;
      });
      return;
    }

    _debounceTimer = Timer(const Duration(seconds: 1), () async {
      final List<Map<String, dynamic>> results =
          await LocationHandler.searchLocation(query);

      if (!mounted) return;

      setState(() {
        _searchResults.addAll(results);
        _showSearchResults = results.isNotEmpty;
        _isSearching = false;
      });

      FocusScope.of(context).unfocus();
    });
  }

  Future<void> selectLocation(Map<String, dynamic> location) async {
    setState(() => _isResolving = true);

    final Map<String, dynamic>? result =
        await LocationHandler.resolvePlace(location['place_id']);

    if (result == null) {
      setState(() => _isResolving = false);
      return;
    }

    final LatLng latLng = LatLng(
      result['geometry']['location']['lat'],
      result['geometry']['location']['lng'],
    );

    final String address = result['name'] ?? location['description'];
    final String city = result['formatted_address'] ?? '';

    context.dispatch(
      SelectLocationAction(
        lat: latLng.latitude.toString(),
        long: latLng.longitude.toString(),
        address: address,
        city: city,
        coordinates: 'SRID=4326;POINT (${latLng.longitude} ${latLng.latitude})',
      ),
    );

    setState(() {
      selectedLatLng = latLng;
      selectedAddress = address;
      selectedCity = city;
      _searchController.clear();
      _showSearchResults = false;
      _isResolving = false;
    });

    await _mapController.animateCamera(CameraUpdate.newLatLng(latLng));
  }

  Future<void> _onMapTap(LatLng latLng) async {
    if (latLng == selectedLatLng) return;

    setState(() => _isResolving = true);

    final Map<String, dynamic>? result =
        await LocationHandler.reverseGeocode(latLng);

    final List<dynamic>? components = result?['address_components'];
    final String address = result?['formatted_address'] ?? kUnknownAddress;

    final String city = components?.firstWhere(
          (dynamic comp) =>
              (comp['types'] as List<dynamic>).contains('locality'),
          orElse: () => null,
        )?['long_name'] ??
        'Unknown City';

    context.dispatch(
      SelectLocationAction(
        lat: latLng.latitude.toString(),
        long: latLng.longitude.toString(),
        address: address,
        city: city,
        coordinates: 'SRID=4326;POINT (${latLng.longitude} ${latLng.latitude})',
      ),
    );

    setState(() {
      selectedLatLng = latLng;
      selectedAddress = address;
      selectedCity = city;
      _showSearchResults = false;
      _isResolving = false;
    });
  }

  @override
  void dispose() {
    _mapController.dispose();
    _searchController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: pickLocation),
        bottomNavigationBar: CustomBottomNavContainer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (_isResolving)
                AppLoading()
              else if (selectedAddress.isNotEmpty || selectedCity.isNotEmpty)
                Column(
                  spacing: 8,
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
                  ],
                ),
              Row(
                spacing: 16,
                children: <Widget>[
                  Flexible(
                    child: SecondaryButton(
                      disabled: _isResolving || _isSearching,
                      addBorder: true,
                      onPressed: () => context.router.maybePop(),
                      child: d.right(cancelString),
                      fillColor: Colors.transparent,
                    ),
                  ),
                  Flexible(
                    child: PrimaryButton(
                      isLoading: _isResolving || _isSearching,
                      onPressed: () {
                        context.dispatch(
                          SelectLocationAction(
                            lat: selectedLatLng.latitude.toString(),
                            long: selectedLatLng.longitude.toString(),
                            address: selectedAddress,
                            city: selectedCity,
                            coordinates:
                                'SRID=4326;POINT (${selectedLatLng.longitude}'
                                ' ${selectedLatLng.latitude})',
                          ),
                        );
                        context.router.maybePop();
                      },
                      child: d.right(continueString),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Column(
          spacing: 12,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                spacing: 8,
                children: <Widget>[
                  CustomTextInput(
                    hintText: searchLocation,
                    onChanged: _onSearchChanged,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.name,
                    prefixIconData: HeroIcons.mapPin,
                    initialValue: _searchController.text,
                  ),
                  if (_isSearching)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: AppLoading(),
                    ),
                  if (_showSearchResults)
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _searchResults.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Map<String, dynamic> location =
                            _searchResults[index];

                        final String title =
                            location['title'] ?? kUnknownAddress;
                        final String subtitle =
                            location['description'] ?? kUnknownAddress;

                        return InkWell(
                          splashColor: Theme.of(context)
                              .primaryColor
                              .withValues(alpha: .1),
                          borderRadius: BorderRadius.circular(8),
                          highlightColor: Theme.of(context)
                              .primaryColor
                              .withValues(alpha: .1),
                          onTap: () => selectLocation(location),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              spacing: 8,
                              children: <Widget>[
                                const HeroIcon(HeroIcons.mapPin, size: 32),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 4,
                                    children: <Widget>[
                                      Text(
                                        title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: AppColors.textBlackColor,
                                            ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      if (subtitle.isNotEmpty)
                                        Text(
                                          subtitle,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
            Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: selectedLatLng,
                  zoom: 15,
                ),
                myLocationEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  _mapController = controller;
                  _controllerCompleter.complete(controller);
                  _setUserLocation();
                },
                onTap: _onMapTap,
                markers: <Marker>{
                  Marker(
                    markerId: const MarkerId('selected'),
                    position: selectedLatLng,
                  ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
