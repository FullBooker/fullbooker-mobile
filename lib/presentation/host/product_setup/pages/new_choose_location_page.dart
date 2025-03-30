import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/infrastructure/location/location_handler.dart';
import 'package:fullbooker/shared/widgets/custom_text_input.dart';
import 'package:heroicons/heroicons.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@RoutePage()
class NewChooseLocationPage extends StatefulWidget {
  const NewChooseLocationPage({super.key});

  @override
  State<NewChooseLocationPage> createState() => _NewChooseLocationPageState();
}

class _NewChooseLocationPageState extends State<NewChooseLocationPage> {
  late String selectedAddress;
  late String selectedCity;

  LatLng selectedLatLng = kDefaultLocation;

  late GoogleMapController _mapController;
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> _searchResults = <Map<String, dynamic>>[];
  bool _showSearchResults = false;

  @override
  void initState() {
    super.initState();
    selectedAddress = '';
    selectedCity = '';

    _setUserLocation();
  }

  Future<void> _setUserLocation() async {
    final LatLng location = await LocationHandler.getUserLocation();
    setState(() {
      selectedLatLng = location;
    });
  }

  Future<void> _onSearchChanged(String value) async {
    final List<Map<String, dynamic>> results =
        await LocationHandler.searchLocation(value);
    setState(() {
      _searchResults.clear();
      _searchResults.addAll(results);
      _showSearchResults = results.isNotEmpty;
    });
  }

  Future<void> _selectLocation(Map<String, dynamic> location) async {
    final Map<String, dynamic>? result =
        await LocationHandler.resolvePlace(location['place_id']);

    if (result != null) {
      final LatLng latLng = LatLng(
        result['geometry']['location']['lat'],
        result['geometry']['location']['lng'],
      );

      setState(() {
        selectedLatLng = latLng;
        selectedAddress = result['name'] ?? location['description'];
        selectedCity = result['formatted_address'] ?? '';
        _searchController.text = location['description'];
        _showSearchResults = false;
      });

      await _mapController.animateCamera(
        CameraUpdate.newLatLng(latLng),
      );
    }
  }

  Future<void> _onMapTapped(LatLng latLng) async {
    final Map<String, dynamic>? result =
        await LocationHandler.reverseGeocode(latLng);
    setState(() {
      selectedLatLng = latLng;
      selectedAddress = result?['address_components']?.first['long_name'] ??
          'Selected location';
      selectedCity = result?['formatted_address'] ??
          '${latLng.latitude.toStringAsFixed(5)}, ${latLng.longitude.toStringAsFixed(5)}';
      _showSearchResults = false;
    });
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      final String description = location['description'] ?? '';
                      return GestureDetector(
                        onTap: () => _selectLocation(location),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: <Widget>[
                              const HeroIcon(HeroIcons.mapPin, size: 32),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  description,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  overflow: TextOverflow.ellipsis,
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
          const SizedBox(height: 12),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: selectedLatLng,
                zoom: 15,
              ),
              myLocationEnabled: true,
              onMapCreated: (GoogleMapController controller) =>
                  _mapController = controller,
              onTap: _onMapTapped,
              markers: <Marker>{
                Marker(
                  markerId: const MarkerId('selected'),
                  position: selectedLatLng,
                ),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
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
                PrimaryButton(
                  onPressed: () {
                    // TODO(abiud): set the location and pop
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
