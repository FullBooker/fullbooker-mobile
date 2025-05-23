import 'dart:convert';
import 'package:fullbooker/shared/entities/location_perms_result.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:fullbooker/core/common/constants.dart';

class LocationHandler {
  static Future<LatLng> getUserLocation({
    LatLng fallback = kDefaultLocation,
  }) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return fallback;
    }

    try {
      final Position location = await Geolocator.getCurrentPosition();
      return LatLng(location.latitude, location.longitude);
    } catch (_) {
      return fallback;
    }
  }

  static Future<List<Map<String, dynamic>>> searchLocation(String query) async {
    if (query.trim().isEmpty) return <Map<String, dynamic>>[];

    final Uri url = Uri.parse(
      'https://maps.googleapis.com/maps/api/place/autocomplete/json'
      '?input=$query&key=$kMapsAPIKey',
    );

    try {
      final http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> predictions =
            json.decode(response.body)['predictions'];

        return predictions.take(4).map((dynamic item) {
          final Map<String, dynamic>? formatting =
              item['structured_formatting'] as Map<String, dynamic>?;

          return <String, dynamic>{
            'place_id': item['place_id'],
            'title': formatting?['main_text'] ?? item['description'] ?? '',
            'description': formatting?['secondary_text'] ?? '',
          };
        }).toList();
      }
    } catch (_) {
      return <Map<String, dynamic>>[];
    }

    return <Map<String, dynamic>>[];
  }

  static Future<Map<String, dynamic>?> resolvePlace(String placeId) async {
    final Uri detailsUrl = Uri.parse(
      'https://maps.googleapis.com/maps/api/place/details/json'
      '?place_id=$placeId'
      '&key=$kMapsAPIKey',
    );

    try {
      final http.Response response = await http.get(detailsUrl);
      if (response.statusCode == 200) {
        return json.decode(response.body)['result'];
      }
    } catch (_) {
      return null;
    }

    return null;
  }

  static Future<Map<String, dynamic>?> reverseGeocode(LatLng latLng) async {
    final Uri url = Uri.parse(
      'https://maps.googleapis.com/maps/api/geocode/json'
      '?latlng=${latLng.latitude},${latLng.longitude}'
      '&result_type=establishment|street_address|premise|point_of_interest'
      '&key=$kMapsAPIKey',
    );

    try {
      final http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> results = json.decode(response.body)['results'];
        return results.isNotEmpty
            ? results.first as Map<String, dynamic>
            : null;
      }
    } catch (_) {
      return null;
    }

    return null;
  }

  static Future<LocationPermsResult> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.unableToDetermine) {
      permission = await Geolocator.requestPermission();
    }

    final bool deniedForever = permission == LocationPermission.deniedForever;
    final bool denied = permission == LocationPermission.denied;

    return LocationPermsResult(
      denied: denied,
      deniedForever: deniedForever,
    );
  }
}
