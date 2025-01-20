import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fullbooker/shared/pages/overview.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Overview())));
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              child: Image(image: AssetImage("assets/logo_splash.png")))),
    );
  }
}
