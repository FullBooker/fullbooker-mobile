import 'package:flutter/material.dart';
import 'package:fullbooker/core/environments.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/features/auth/pages/login_page.dart';
import 'package:fullbooker/features/host/pages/events_summary_page.dart';
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
          seedColor: AppColors.primaryColor,
          primary: AppColors.primaryColor,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.openSansTextTheme(),
      ),
      home: (currentToken == null)
          ? const LoginPage()
          : const EventsSummaryPage(),
    );
  }
}
