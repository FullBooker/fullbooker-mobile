import 'package:flutter/material.dart';
import 'package:fullbooker/core/environments.dart';
import 'package:fullbooker/features/auth/pages/login.dart';
import 'package:fullbooker/features/host/pages/summary.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppWidget extends StatelessWidget {
  const MyAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

    return MaterialApp(
      title: 'Fullbooker',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xfff55E00),
          primary: const Color(0xfff55E00),
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.openSansTextTheme(),
      ),
      home: (currentToken == null) ? const Login() : const EventsSummary(),
    );
  }
}
