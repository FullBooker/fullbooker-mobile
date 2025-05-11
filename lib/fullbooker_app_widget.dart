import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/analytics_service.dart';
import 'package:fullbooker/application/redux/actions/check_refresh_token_action.dart';
import 'package:fullbooker/application/redux/actions/logout_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/app_router.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/core/theme/app_theme.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FullBookerAppWidget extends StatefulWidget {
  const FullBookerAppWidget({super.key});

  @override
  State<FullBookerAppWidget> createState() => _FullBookerAppWidgetState();
}

class _FullBookerAppWidgetState extends State<FullBookerAppWidget>
    with WidgetsBindingObserver {
  final AppRouter appRouter = AppRouter();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkToken(showExpiredSnack: true);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkToken());
  }

  void _checkToken({bool showExpiredSnack = false}) {
    StoreProvider.dispatch<AppState>(
      context,
      CheckRefreshTokenAction(
        onExpired: () {
          StoreProvider.dispatch<AppState>(
            context,
            LogoutAction(
              onDone: () {
                if (showExpiredSnack) {
                  scaffoldMessengerKey.currentState
                    ?..hideCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(
                        content: Text(sessionExpired),
                        duration: Duration(seconds: 10),
                      ),
                    );
                }
                appRouter.pushAndPopUntil(
                  const LoginRoute(),
                  predicate: (_) => false,
                );
              },
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: scaffoldMessengerKey,
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
