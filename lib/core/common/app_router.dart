import 'package:auto_route/auto_route.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        // Shared landing page
        AutoRoute(page: SharedLandingRoute.page, initial: true),

        // Home pages
        AutoRoute(page: ConsumerHomeRoute.page),
        AutoRoute(page: HostingHomeRoute.page),

        AutoRoute(page: OverviewRoute.page),
        AutoRoute(page: EventDetailsRoute.page),
        AutoRoute(page: ImagePreviewRoute.page),
        AutoRoute(page: PaymentConfirmationRoute.page),
        AutoRoute(page: PaymentSummaryRoute.page),
        AutoRoute(page: ChangePasswordRoute.page),
        AutoRoute(page: UpdatePasswordRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RequestOTPRoute.page),
        AutoRoute(page: CreateAccountRoute.page),
        AutoRoute(page: VerifyOTPRoute.page),
        AutoRoute(page: ActivityDateSelectionRoute.page),
        AutoRoute(page: EventCategoryRoute.page),
        AutoRoute(page: EventsSummaryRoute.page),
        AutoRoute(page: HostProductSummaryRoute.page),
        AutoRoute(page: ImageSelectionRoute.page),
        AutoRoute(page: ImageGalleryRoute.page),
        AutoRoute(page: OldGalleryRoute.page),
        AutoRoute(page: ProductsRoute.page),
        AutoRoute(page: ProfileRoute.page),

        // Hosting side product setup
        AutoRoute(page: ProductCategoryRoute.page),
        AutoRoute(page: ProductSubCategoryRoute.page),
        AutoRoute(page: ProductSetupPreviewRoute.page),
        AutoRoute(page: ProductBasicDetailsRoute.page),
        AutoRoute(page: ProductLocationRoute.page),
        AutoRoute(page: ProductScheduleRoute.page),
        AutoRoute(page: ProductPhotosRoute.page),
        AutoRoute(page: ProductVideosRoute.page),
        AutoRoute(page: ProductModeOfAccessRoute.page),
        AutoRoute(page: ProductPricingRoute.page),
        AutoRoute(page: AddProductPricingRoute.page),
        AutoRoute(page: ProductReviewAndSubmitRoute.page),
        AutoRoute(page: ChooseLocationRoute.page),
        AutoRoute(page: ProductDetailRoute.page),
        AutoRoute(page: ProductBookingsRoute.page),
        AutoRoute(page: ScanTicketsRoute.page),
        AutoRoute(page: FullscreenVideoPlayerRoute.page),
        AutoRoute(page: TermsAndConditionsRoute.page),
        AutoRoute(page: ProductBookingDetailsRoute.page),
      ];
}
