import 'package:auto_route/auto_route.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(page: ConsumerHomeRoute.page, initial: true),
        AutoRoute(page: SharedLandingRoute.page),
        AutoRoute(page: OverviewRoute.page),
        AutoRoute(page: EventDetailsRoute.page),
        AutoRoute(page: ImagePreviewRoute.page),
        AutoRoute(page: PaymentConfirmationRoute.page),
        AutoRoute(page: PaymentSummaryRoute.page),
        AutoRoute(page: ChangePasswordRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RequestOTPRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: VerifyOTPRoute.page),
        AutoRoute(page: ActivityDateSelectionRoute.page),
        AutoRoute(page: ActivityDayPassRoute.page),
        AutoRoute(page: ActivityPricingRoute.page),
        AutoRoute(page: ActivitySubscriptionRoute.page),
        AutoRoute(page: CategorySelectionRoute.page),
        AutoRoute(page: DateSelectionRoute.page),
        AutoRoute(page: EventCategoryRoute.page),
        AutoRoute(page: EventsSummaryRoute.page),
        AutoRoute(page: HostProductSummaryRoute.page),
        AutoRoute(page: ImageSelectionRoute.page),
        AutoRoute(page: LocationSelectionRoute.page),
        AutoRoute(page: ProductDetailsRoute.page),
        AutoRoute(page: TicketsSummaryRoute.page),
        AutoRoute(page: VideoSelectionRoute.page),
        AutoRoute(page: HostingHomeRoute.page),
        AutoRoute(page: GalleryRoute.page),
      ];
}
