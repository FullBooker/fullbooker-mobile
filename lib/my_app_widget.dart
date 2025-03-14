import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/config/environments.dart';
import 'package:fullbooker/core/common/app_router.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppWidget extends StatelessWidget {
  const MyAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();

    return MaterialApp.router(
      routerConfig: appRouter.config(
        deepLinkBuilder: (PlatformDeepLink deepLink) {
          if (currentToken == null) {
            return DeepLink(
              <PageRouteInfo<dynamic>>[LoginRoute()],
            );
          }
          return const DeepLink(
            <PageRouteInfo<dynamic>>[EventsSummaryRoute()],
          );
        },
        navigatorObservers: () => <NavigatorObserver>[],
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          primary: AppColors.primaryColor,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.openSansTextTheme(),
      ),
    );
  }
}
