import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/app_wrapper.dart';
import 'package:fullbooker/application/core/services/custom_client.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/app_entry_point_view_model.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:get_it/get_it.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fullbooker/application/core/services/analytics_service.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/refresh_token_action.dart';
import 'package:fullbooker/core/common/app_router.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/presentation/core/theme/app_theme.dart';

class FullBookerAppWidget extends StatefulWidget {
  const FullBookerAppWidget({
    super.key,
    required this.appName,
    required this.appStore,
    this.fcmToken,
  });

  final String appName;
  final Store<AppState> appStore;
  final String? fcmToken;

  @override
  State<FullBookerAppWidget> createState() => _FullBookerAppWidgetState();
}

class _FullBookerAppWidgetState extends State<FullBookerAppWidget>
    with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _handleTokenRefresh();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) => _handleTokenRefresh());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> _handleTokenRefresh() async {
    final AppState state = StoreProvider.state<AppState>(context);
    final bool isSignedIn = state.authState?.isSignedIn ?? false;
    final DateTime now = DateTime.now();

    final DateTime expiresAt = DateTime.tryParse(
          state.authState?.authCredentials?.expiresAt ?? '',
        ) ??
        now;

    if (isSignedIn && hasTokenExpired(expiresAt, now)) {
      await context.dispatch(
        RefreshTokenAction(
          client: AppWrapperBase.of(context)!.customClient,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.appStore,
      child: StoreConnector<AppState, AppEntryPointViewModel>(
        vm: () => AppEntryPointViewModelFactory(),
        builder: (BuildContext context, AppEntryPointViewModel vm) {
          final String accessToken = vm.accessToken ?? UNKNOWN;
          final String refreshToken = vm.refreshToken ?? UNKNOWN;
          final String refreshTokenEndpoint =
              GetIt.I.get<AppConfig>().refreshTokenEndpoint;
          final AppRouter appRouter = AppRouter();
          final bool isSignedIn = vm.isSignedIn;

          return AppWrapper(
            appName: widget.appName,
            customClient: CustomClient(
              accessToken: accessToken,
              context: context,
              refreshToken: refreshToken,
              refreshTokenEndpoint: refreshTokenEndpoint,
            ),
            child: MaterialApp.router(
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
            ),
          );
        },
      ),
    );
  }
}
