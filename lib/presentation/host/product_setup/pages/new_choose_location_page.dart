import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/shared/widgets/custom_text_input.dart';
import 'package:heroicons/heroicons.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

@RoutePage()
class NewChooseLocationPage extends StatefulWidget {
  const NewChooseLocationPage({super.key});

  @override
  State<NewChooseLocationPage> createState() => _NewChooseLocationPageState();
}

class _NewChooseLocationPageState extends State<NewChooseLocationPage> {
  LatLng selectedLatLng = const LatLng(-1.228003, 36.900032);
  late GoogleMapController _mapController;

  String selectedAddress = 'KICC';
  String selectedCity = 'Nairobi';

  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> _searchResults = <Map<String, dynamic>>[];
  bool _showSearchResults = false;

  Future<void> _onSearchChanged(String value) async {
    if (value.trim().isEmpty) {
      setState(() => _showSearchResults = false);
      return;
    }

    const String apiKey = kMapsAPIKey;
    final Uri url = Uri.parse(
      'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$value&components=country:ke&location=-1.286389,36.817223&radius=50000&strictbounds=true&key=$apiKey',
    );

    try {
      final http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> predictions =
            json.decode(response.body)['predictions'];
        setState(() {
          _searchResults.clear();
          _searchResults.addAll(
            predictions.take(4).map(
                  (dynamic item) => <String, dynamic>{
                    'description': item['description'],
                    'place_id': item['place_id'],
                  },
                ),
          );
          _showSearchResults = _searchResults.isNotEmpty;
        });
      }
    } catch (_) {}
  }

  Future<void> _selectLocation(Map<String, dynamic> location) async {
    const String apiKey = kMapsAPIKey;
    final Uri detailsUrl = Uri.parse(
      'https://maps.googleapis.com/maps/api/place/details/json?place_id=${location['place_id']}&key=$apiKey',
    );

    try {
      final http.Response detailsResponse = await http.get(detailsUrl);
      if (detailsResponse.statusCode == 200) {
        final dynamic result = json.decode(detailsResponse.body)['result'];
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
    } catch (_) {}
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
                        onTap: () {
                          _selectLocation(location);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            spacing: 8,
                            children: <Widget>[
                              const HeroIcon(HeroIcons.mapPin, size: 32),
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
              onMapCreated: (GoogleMapController controller) =>
                  _mapController = controller,
              onTap: (LatLng latLng) async {
                const String apiKey = kMapsAPIKey;
                final Uri reverseGeocodeUrl = Uri.parse(
                  'https://maps.googleapis.com/maps/api/geocode/json?latlng=${latLng.latitude},${latLng.longitude}&key=$apiKey',
                );

                try {
                  final http.Response response =
                      await http.get(reverseGeocodeUrl);
                  if (response.statusCode == 200) {
                    final List results =
                        json.decode(response.body)['results'] as List<dynamic>;
                    if (results.isNotEmpty) {
                      final result = results.first;
                      setState(() {
                        selectedLatLng = latLng;
                        selectedAddress =
                            result['address_components'].first['long_name'] ??
                                'Selected location';
                        selectedCity = result['formatted_address'] ??
                            '${latLng.latitude.toStringAsFixed(5)}, ${latLng.longitude.toStringAsFixed(5)}';
                        _showSearchResults = false;
                      });
                      return;
                    }
                  }
                } catch (_) {}

                setState(() {
                  selectedLatLng = latLng;
                  selectedAddress = 'Selected location';
                  selectedCity =
                      '${latLng.latitude.toStringAsFixed(5)}, ${latLng.longitude.toStringAsFixed(5)}';
                  _showSearchResults = false;
                });
              },
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
                  color: AppColors.bodyTextColor.withValues(alpha: .1),
                  blurRadius: 6,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  selectedAddress,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  selectedCity,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 16),
                PrimaryButton(
                  onPressed: () {
                    // TODO(abiud): pop and save the selected location
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
