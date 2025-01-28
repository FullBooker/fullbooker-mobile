import 'package:flutter/material.dart';
import 'package:fullbooker/features/auth/pages/login.dart';
import 'package:fullbooker/shared/widgets/button.dart';

class EventsSummary extends StatelessWidget {
  const EventsSummary({super.key});

  void goToLogIn(BuildContext context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => const Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SizedBox(
        height: 40,
        child: Button(() => goToLogIn(context), actionLabel: "Log Out"),
      ),
    ));
  }
}
