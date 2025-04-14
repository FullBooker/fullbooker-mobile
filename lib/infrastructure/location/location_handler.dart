import 'dart:convert';
import 'package:fullbooker/shared/entities/location_perms_result.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'package:fullbooker/core/common/constants.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

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
      'https://api.maptiler.com/geocoding/$query.json?key=$kMapTilerAPIKey&language=en&limit=5&country=ke',
    );

    try {
      final http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);
        final List<dynamic> features = data['features'];
        return features.map((dynamic feature) {
          return <String, dynamic>{
            'description': feature['place_name'],
            'center': feature['center'], // [lng, lat]
            'id': feature['id'],
          };
        }).toList();
      }
    } catch (_) {
      return <Map<String, dynamic>>[];
    }
    return <Map<String, dynamic>>[];
  }

  // 📍 Resolve place ID to coordinates — map back from search results
  static Future<Map<String, dynamic>?> resolvePlace(String idOrName) async {
    final List<Map<String, dynamic>> results = await searchLocation(idOrName);
    return results.isNotEmpty
        ? <String, dynamic>{
            'name': results.first['description'],
            'formatted_address': results.first['description'],
            'geometry': <String, Map<String, dynamic>>{
              'location': <String, dynamic>{
                'lat': results.first['center'][1],
                'lng': results.first['center'][0],
              },
            },
          }
        : null;
  }

  static Future<Map<String, dynamic>?> reverseGeocode(LatLng latLng) async {
    final Uri url = Uri.parse(
      'https://api.maptiler.com/geocoding/${latLng.longitude},${latLng.latitude}.json?key=$kMapTilerAPIKey&language=en',
    );

    try {
      final http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);
        final dynamic features = data['features'];
        return features.isNotEmpty ? features.first : null;
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
