import 'package:auto_route/auto_route.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(page: ConsumerLandingRoute.page, initial: true),
      ];
}
