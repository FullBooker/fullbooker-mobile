import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/app_widget_view_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fullbooker/application/core/services/analytics_service.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/check_and_refresh_token_action.dart';
import 'package:fullbooker/core/common/app_router.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/presentation/core/theme/app_theme.dart';

class FullBookerAppWidget extends StatefulWidget {
  const FullBookerAppWidget({super.key});

  @override
  State<FullBookerAppWidget> createState() => _FullBookerAppWidgetState();
}

class _FullBookerAppWidgetState extends State<FullBookerAppWidget>
    with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (state == AppLifecycleState.resumed) {
        context.dispatch(
          CheckAndRefreshTokenAction(
            client: AppWrapperBase.of(context)!.customClient,
          ),
        );
      }
    });
  }

  // TODO(abiud): restore this when the server returns local time
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     context.dispatch(
  //       CheckAndRefreshTokenAction(
  //         client: AppWrapperBase.of(context)!.customClient,
  //       ),
  //     );
  //   });
  // }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppWidgetViewModel>(
      converter: (Store<AppState> store) => AppWidgetViewModel.fromStore(store),
      builder: (BuildContext context, AppWidgetViewModel vm) {
        final AppRouter appRouter = AppRouter();
        final bool isSignedIn = vm.isSignedIn;

        return MaterialApp.router(
          routerConfig: appRouter.config(
            deepLinkBuilder: (PlatformDeepLink deepLink) {
              if (isSignedIn) {
                return DeepLink(<PageRouteInfo<dynamic>>[
                  HostingHomeRoute(),
                ]);
              }
              return const DeepLink(<PageRouteInfo<dynamic>>[LoginRoute()]);
            },
            navigatorObservers: () => <NavigatorObserver>[
              AnalyticsService().getAnalyticsObserver(),
            ],
          ),
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getAppTheme(),
        );
      },
    );
  }
}
