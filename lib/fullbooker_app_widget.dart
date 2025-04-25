import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/actions/check_and_refresh_token_action.dart';
import 'package:fullbooker/application/core/services/analytics_service.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/core/common/app_router.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/presentation/core/theme/app_theme.dart';

class FullBookerAppWidget extends StatefulWidget {
  const FullBookerAppWidget({super.key});

  @override
  State<FullBookerAppWidget> createState() => _FullBookerAppWidgetState();
}

class _FullBookerAppWidgetState extends State<FullBookerAppWidget>
    with WidgetsBindingObserver {
  Timer? _refreshTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Start periodic refresh check
    _refreshTimer =
        Timer.periodic(Duration(minutes: kRefreshTokenTimerInterval), (_) {
      context.dispatch(
        CheckAndRefreshTokenAction(
          client: AppWrapperBase.of(context)!.customClient,
        ),
      );
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.dispatch(
        CheckAndRefreshTokenAction(
          client: AppWrapperBase.of(context)!.customClient,
        ),
      );
    }
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
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
        ],
      ),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getAppTheme(),
    );
  }
}
