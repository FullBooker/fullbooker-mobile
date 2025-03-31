import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/infrastructure/location/location_handler.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/presentation/core/components/generic_zero_state.dart';
import 'package:fullbooker/shared/entities/location_perms_result.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class ProductLocationPage extends StatefulWidget {
  const ProductLocationPage({super.key});

  @override
  State<ProductLocationPage> createState() => _ProductLocationPageState();
}

class _ProductLocationPageState extends State<ProductLocationPage> {
  late LocationPermsResult locationResult;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _handlePermission();
  }

  Future<void> _handlePermission() async {
    final LocationPermsResult result =
        await LocationHandler.checkLocationPermission();
    if (mounted) {
      setState(() {
        locationResult = result;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return AppLoading();

    return Scaffold(
      appBar: CustomAppBar(
        showBell: false,
        title: setupEvent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: <Widget>[
                          Text(
                            location,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            locationCopy,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      if (locationResult.denied || locationResult.deniedForever)
                        GenericZeroState(
                          iconPath: locationSVGPath,
                          title: locationPermsTitle,
                          description: locationPermsCopy,
                          onCTATap: () {
                            if (locationResult.deniedForever) {
                              openAppSettings();
                            } else {
                              _handlePermission();
                            }
                          },
                          ctaText: locationResult.deniedForever
                              ? openSettings
                              : enableLocation,
                        ),
                      GenericZeroState(
                        iconPath: locationSVGPath,
                        title: setEventLocation,
                        description: locationZeroStateCopy,
                        onCTATap: () {
                          context.router.push(NewChooseLocationRoute());
                        },
                        ctaText: pickLocation,
                      ),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   spacing: 8,
                      //   children: <Widget>[
                      //     Text(
                      //       kicc,
                      //       style: Theme.of(context).textTheme.titleMedium,
                      //     ),
                      //     Text(
                      //       nairobi,
                      //       style: Theme.of(context).textTheme.bodySmall,
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ],
              ),
            ),
            PrimaryButton(
              onPressed: () {
                context.router.push(ProductDateTimeRouteRoute());
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
    );
  }
}
