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
        MaterialPageRoute<Overview>(
          builder: (BuildContext context) => Overview(),
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
