import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fullbooker/domain/core/entities/product_location.dart';

class LocationPreviewWidget extends StatelessWidget {
  const LocationPreviewWidget({super.key, required this.location});

  final ProductLocation location;

  @override
  Widget build(BuildContext context) {
    final LatLng latLng = LatLng(
      double.tryParse(location.lat ?? '0') ?? 0,
      double.tryParse(location.long ?? '0') ?? 0,
    );

    final CameraPosition cameraPosition = CameraPosition(
      target: latLng,
      zoom: 16,
    );

    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: 180,
            width: double.infinity,
            child: GoogleMap(
              initialCameraPosition: cameraPosition,
              markers: <Marker>{
                Marker(
                  markerId: const MarkerId('summaryLocation'),
                  position: latLng,
                ),
              },
              zoomControlsEnabled: false,
              zoomGesturesEnabled: false,
              scrollGesturesEnabled: false,
              rotateGesturesEnabled: false,
              tiltGesturesEnabled: false,
              myLocationButtonEnabled: false,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: <Widget>[
            Text(
              location.address ?? UNKNOWN,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              location.city ?? UNKNOWN,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}
