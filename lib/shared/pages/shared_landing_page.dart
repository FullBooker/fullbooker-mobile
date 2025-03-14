import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/shared/pages/overview_page.dart';

@RoutePage()
class SharedLandingPage extends StatelessWidget {
  const SharedLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute<OverviewPage>(
          builder: (BuildContext context) => OverviewPage(),
        ),
      ),
    );

    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Image(image: AssetImage('assets/logo_splash.png')),
        ),
      ),
    );
  }
}
