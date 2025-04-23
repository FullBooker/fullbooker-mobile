import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/entities/product_location.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPreviewWidget extends StatelessWidget {
  const LocationPreviewWidget({
    super.key,
    required this.location,
    this.readOnly = false,
    this.onChangePressed,
  });

  final ProductLocation? location;
  final bool readOnly;
  final VoidCallback? onChangePressed;

  @override
  Widget build(BuildContext context) {
    final LatLng? latLng = tryParseCoordinates(location?.coordinates);

    if (latLng == null) {
      return Text(
        locationUnavailable,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.greyTextColor,
            ),
      );
    }

    final CameraPosition cameraPosition = CameraPosition(
      target: latLng,
      zoom: 15,
    );

    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Theme.of(context).dividerColor.withAlpha(30),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: double.infinity,
              child: AbsorbPointer(
                child: GoogleMap(
                  initialCameraPosition: cameraPosition,
                  markers: <Marker>{
                    Marker(
                      markerId: const MarkerId('summaryLocation'),
                      position: latLng,
                    ),
                  },
                  zoomControlsEnabled: false,
                  scrollGesturesEnabled: false,
                  rotateGesturesEnabled: false,
                  tiltGesturesEnabled: false,
                  myLocationButtonEnabled: false,
                ),
              ),
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
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    location?.address ?? kUnknownAddress,
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if ((location?.city ?? UNKNOWN) != UNKNOWN)
                    Text(
                      location!.city!,
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
            if (!readOnly)
              Expanded(
                flex: 2,
                child: SecondaryButton(
                  onPressed: onChangePressed ??
                      () => context.router.push(const ChooseLocationRoute()),
                  child: right(changeString),
                ),
              ),
          ],
        ),
      ],
    );
  }

  LatLng? tryParseCoordinates(String? coordinates) {
    if (coordinates == null || coordinates.isEmpty) return null;

    try {
      return parseCoordinates(coordinates);
    } catch (_) {
      return null;
    }
  }
}
