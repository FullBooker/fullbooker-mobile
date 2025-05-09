import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/analytics_service.dart';
import 'package:fullbooker/core/common/app_router.dart';
import 'package:fullbooker/presentation/core/theme/app_theme.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FullBookerAppWidget extends StatefulWidget {
  const FullBookerAppWidget({super.key});

  @override
  State<FullBookerAppWidget> createState() => _FullBookerAppWidgetState();
}

class _FullBookerAppWidgetState extends State<FullBookerAppWidget>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.config(
        navigatorObservers: () => <NavigatorObserver>[
          AnalyticsService().getAnalyticsObserver(),
          SentryNavigatorObserver(),
        ],
      ),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getAppTheme(),
    );
  }
}
