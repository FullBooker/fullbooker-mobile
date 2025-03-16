import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';

@RoutePage()
class SharedLandingPage extends StatelessWidget {
  const SharedLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => context.router.replace(OverviewRoute()),
    );

    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Image(image: AssetImage(logoSplashImagePath)),
        ),
      ),
    );
  }
}
