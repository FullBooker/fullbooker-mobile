import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fullbooker/domain/core/entities/product_location.dart';

class LocationPreviewWidget extends StatelessWidget {
  const LocationPreviewWidget({
    super.key,
    required this.location,
    this.readOnly = false,
    this.showMap = false,
  });

  final ProductLocation? location;

  final bool readOnly;
  final bool showMap;

  @override
  Widget build(BuildContext context) {
    final LatLng latLng = parseCoordinates(location?.coordinates);

    final CameraPosition cameraPosition = CameraPosition(
      target: latLng,
      zoom: 16,
    );

    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (showMap)
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
        Row(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: <Widget>[
                  Text(
                    location?.address ?? UNKNOWN,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  if ((location?.city ?? UNKNOWN) != UNKNOWN)
                    Text(
                      location?.city ?? UNKNOWN,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                ],
              ),
            ),
            if (!readOnly)
              Expanded(
                flex: 2,
                child: SecondaryButton(
                  child: right(changeString),
                  onPressed: () => context.router.push(ChooseLocationRoute()),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
