import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/app_router.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/presentation/core/theme/app_theme.dart';

class FullbookerAppWidget extends StatelessWidget {
  const FullbookerAppWidget({super.key, required this.appStore});

  final Store<AppState> appStore;

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();

    return StoreProvider<AppState>(
      store: appStore,
      child: StoreConnector<AppState, AppState>(
        converter: (Store<AppState> store) => store.state,
        builder: (BuildContext context, AppState vm) {
          final bool isSignedIn = vm.authState?.isSignedIn ?? false;

          return MaterialApp.router(
            routerConfig: appRouter.config(
              deepLinkBuilder: (PlatformDeepLink deepLink) {
                if (isSignedIn) {
                  return const DeepLink(
                    <PageRouteInfo<dynamic>>[EventsSummaryRoute()],
                  );
                }
                return DeepLink(
                  <PageRouteInfo<dynamic>>[SharedLandingRoute()],
                );
              },
              navigatorObservers: () => <NavigatorObserver>[
                // TODO(abiud): add sentry and google analytics observers
              ],
            ),
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getAppTheme(),
          );
        },
      ),
    );
  }
}
