// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i40;
import 'package:flutter/foundation.dart' as _i44;
import 'package:flutter/material.dart' as _i41;
import 'package:fullbooker/features/consumer/pages/consumer_home_page.dart'
    as _i8;
import 'package:fullbooker/features/consumer/pages/event_details_page.dart'
    as _i11;
import 'package:fullbooker/features/consumer/pages/gallery_page.dart' as _i13;
import 'package:fullbooker/features/consumer/pages/image_preview_page.dart'
    as _i16;
import 'package:fullbooker/features/consumer/pages/payment_confirmation_page.dart'
    as _i20;
import 'package:fullbooker/features/consumer/pages/payment_summary_page.dart'
    as _i21;
import 'package:fullbooker/features/host/models/currency.dart' as _i47;
import 'package:fullbooker/features/host/models/old_product.dart' as _i42;
import 'package:fullbooker/features/host/pages/activity_date_selection_page.dart'
    as _i1;
import 'package:fullbooker/features/host/pages/activity_day_pass_page.dart'
    as _i2;
import 'package:fullbooker/features/host/pages/activity_pricing_page.dart'
    as _i3;
import 'package:fullbooker/features/host/pages/activity_subscription_page.dart'
    as _i4;
import 'package:fullbooker/features/host/pages/event_category_page.dart'
    as _i10;
import 'package:fullbooker/features/host/pages/host_product_summary_page.dart'
    as _i14;
import 'package:fullbooker/features/host/pages/image_selection_page.dart'
    as _i17;
import 'package:fullbooker/features/host/pages/old_events_summary_page.dart'
    as _i12;
import 'package:fullbooker/features/host/pages/tickets_summary_page.dart'
    as _i37;
import 'package:fullbooker/features/host/pages/video_selection_page.dart'
    as _i39;
import 'package:fullbooker/presentation/host/home/pages/hosting_home_page.dart'
    as _i15;
import 'package:fullbooker/presentation/host/product_setup/pages/add_product_pricing_page.dart'
    as _i5;
import 'package:fullbooker/presentation/host/product_setup/pages/choose_location_page.dart'
    as _i7;
import 'package:fullbooker/presentation/host/product_setup/pages/product_basic_details_page.dart'
    as _i22;
import 'package:fullbooker/presentation/host/product_setup/pages/product_date_time_page.dart'
    as _i24;
import 'package:fullbooker/presentation/host/product_setup/pages/product_location_page.dart'
    as _i26;
import 'package:fullbooker/presentation/host/product_setup/pages/product_photos_page.dart'
    as _i27;
import 'package:fullbooker/presentation/host/product_setup/pages/product_pricing_page.dart'
    as _i28;
import 'package:fullbooker/presentation/host/product_setup/pages/product_review_and_submit_page.dart'
    as _i29;
import 'package:fullbooker/presentation/host/product_setup/pages/product_setup_preview_page.dart'
    as _i30;
import 'package:fullbooker/presentation/host/product_setup/pages/setup_product_category_page.dart'
    as _i34;
import 'package:fullbooker/presentation/host/product_setup/pages/setup_product_type_page.dart'
    as _i35;
import 'package:fullbooker/presentation/host/products/pages/product_bookings_page.dart'
    as _i23;
import 'package:fullbooker/presentation/host/products/pages/product_detail_page.dart'
    as _i25;
import 'package:fullbooker/presentation/host/products/pages/products_page.dart'
    as _i31;
import 'package:fullbooker/presentation/onboarding/pages/change_password_page.dart'
    as _i6;
import 'package:fullbooker/presentation/onboarding/pages/create_account_page.dart'
    as _i9;
import 'package:fullbooker/presentation/onboarding/pages/login_page.dart'
    as _i18;
import 'package:fullbooker/presentation/onboarding/pages/request_otp_page.dart'
    as _i33;
import 'package:fullbooker/presentation/onboarding/pages/verify_otp_page.dart'
    as _i38;
import 'package:fullbooker/presentation/profile/pages/profile_page.dart'
    as _i32;
import 'package:fullbooker/shared/entities/enums.dart' as _i45;
import 'package:fullbooker/shared/entities/session_pricing.dart' as _i43;
import 'package:fullbooker/shared/entities/ticket.dart' as _i46;
import 'package:fullbooker/shared/pages/overview_page.dart' as _i19;
import 'package:fullbooker/shared/pages/shared_landing_page.dart' as _i36;

/// generated route for
/// [_i1.ActivityDateSelectionPage]
class ActivityDateSelectionRoute
    extends _i40.PageRouteInfo<ActivityDateSelectionRouteArgs> {
  ActivityDateSelectionRoute({
    _i41.Key? key,
    required _i42.OldProduct product,
    required Map<String, Object?> location,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         ActivityDateSelectionRoute.name,
         args: ActivityDateSelectionRouteArgs(
           key: key,
           product: product,
           location: location,
         ),
         initialChildren: children,
       );

  static const String name = 'ActivityDateSelectionRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ActivityDateSelectionRouteArgs>();
      return _i1.ActivityDateSelectionPage(
        key: args.key,
        product: args.product,
        location: args.location,
      );
    },
  );
}

class ActivityDateSelectionRouteArgs {
  const ActivityDateSelectionRouteArgs({
    this.key,
    required this.product,
    required this.location,
  });

  final _i41.Key? key;

  final _i42.OldProduct product;

  final Map<String, Object?> location;

  @override
  String toString() {
    return 'ActivityDateSelectionRouteArgs{key: $key, product: $product, location: $location}';
  }
}

/// generated route for
/// [_i2.ActivityDayPassPage]
class ActivityDayPassRoute
    extends _i40.PageRouteInfo<ActivityDayPassRouteArgs> {
  ActivityDayPassRoute({
    _i41.Key? key,
    required _i42.OldProduct product,
    required _i43.SessionPricing sessionPricing,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         ActivityDayPassRoute.name,
         args: ActivityDayPassRouteArgs(
           key: key,
           product: product,
           sessionPricing: sessionPricing,
         ),
         initialChildren: children,
       );

  static const String name = 'ActivityDayPassRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ActivityDayPassRouteArgs>();
      return _i2.ActivityDayPassPage(
        key: args.key,
        product: args.product,
        sessionPricing: args.sessionPricing,
      );
    },
  );
}

class ActivityDayPassRouteArgs {
  const ActivityDayPassRouteArgs({
    this.key,
    required this.product,
    required this.sessionPricing,
  });

  final _i41.Key? key;

  final _i42.OldProduct product;

  final _i43.SessionPricing sessionPricing;

  @override
  String toString() {
    return 'ActivityDayPassRouteArgs{key: $key, product: $product, sessionPricing: $sessionPricing}';
  }
}

/// generated route for
/// [_i3.ActivityPricingPage]
class ActivityPricingRoute
    extends _i40.PageRouteInfo<ActivityPricingRouteArgs> {
  ActivityPricingRoute({
    _i41.Key? key,
    required _i42.OldProduct product,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         ActivityPricingRoute.name,
         args: ActivityPricingRouteArgs(key: key, product: product),
         initialChildren: children,
       );

  static const String name = 'ActivityPricingRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ActivityPricingRouteArgs>();
      return _i3.ActivityPricingPage(key: args.key, product: args.product);
    },
  );
}

class ActivityPricingRouteArgs {
  const ActivityPricingRouteArgs({this.key, required this.product});

  final _i41.Key? key;

  final _i42.OldProduct product;

  @override
  String toString() {
    return 'ActivityPricingRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i4.ActivitySubscriptionPage]
class ActivitySubscriptionRoute
    extends _i40.PageRouteInfo<ActivitySubscriptionRouteArgs> {
  ActivitySubscriptionRoute({
    _i41.Key? key,
    required _i42.OldProduct product,
    required _i43.SessionPricing sessionPricing,
    _i43.SessionPricing? dayPassPricing,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         ActivitySubscriptionRoute.name,
         args: ActivitySubscriptionRouteArgs(
           key: key,
           product: product,
           sessionPricing: sessionPricing,
           dayPassPricing: dayPassPricing,
         ),
         initialChildren: children,
       );

  static const String name = 'ActivitySubscriptionRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ActivitySubscriptionRouteArgs>();
      return _i4.ActivitySubscriptionPage(
        key: args.key,
        product: args.product,
        sessionPricing: args.sessionPricing,
        dayPassPricing: args.dayPassPricing,
      );
    },
  );
}

class ActivitySubscriptionRouteArgs {
  const ActivitySubscriptionRouteArgs({
    this.key,
    required this.product,
    required this.sessionPricing,
    this.dayPassPricing,
  });

  final _i41.Key? key;

  final _i42.OldProduct product;

  final _i43.SessionPricing sessionPricing;

  final _i43.SessionPricing? dayPassPricing;

  @override
  String toString() {
    return 'ActivitySubscriptionRouteArgs{key: $key, product: $product, sessionPricing: $sessionPricing, dayPassPricing: $dayPassPricing}';
  }
}

/// generated route for
/// [_i5.AddProductPricingPage]
class AddProductPricingRoute extends _i40.PageRouteInfo<void> {
  const AddProductPricingRoute({List<_i40.PageRouteInfo>? children})
    : super(AddProductPricingRoute.name, initialChildren: children);

  static const String name = 'AddProductPricingRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i5.AddProductPricingPage();
    },
  );
}

/// generated route for
/// [_i6.ChangePasswordPage]
class ChangePasswordRoute extends _i40.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i40.PageRouteInfo>? children})
    : super(ChangePasswordRoute.name, initialChildren: children);

  static const String name = 'ChangePasswordRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i6.ChangePasswordPage();
    },
  );
}

/// generated route for
/// [_i7.ChooseLocationPage]
class ChooseLocationRoute extends _i40.PageRouteInfo<void> {
  const ChooseLocationRoute({List<_i40.PageRouteInfo>? children})
    : super(ChooseLocationRoute.name, initialChildren: children);

  static const String name = 'ChooseLocationRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i7.ChooseLocationPage();
    },
  );
}

/// generated route for
/// [_i8.ConsumerHomePage]
class ConsumerHomeRoute extends _i40.PageRouteInfo<void> {
  const ConsumerHomeRoute({List<_i40.PageRouteInfo>? children})
    : super(ConsumerHomeRoute.name, initialChildren: children);

  static const String name = 'ConsumerHomeRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i8.ConsumerHomePage();
    },
  );
}

/// generated route for
/// [_i9.CreateAccountPage]
class CreateAccountRoute extends _i40.PageRouteInfo<void> {
  const CreateAccountRoute({List<_i40.PageRouteInfo>? children})
    : super(CreateAccountRoute.name, initialChildren: children);

  static const String name = 'CreateAccountRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i9.CreateAccountPage();
    },
  );
}

/// generated route for
/// [_i10.EventCategoryPage]
class EventCategoryRoute extends _i40.PageRouteInfo<EventCategoryRouteArgs> {
  EventCategoryRoute({
    _i41.Key? key,
    required _i42.OldProduct product,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         EventCategoryRoute.name,
         args: EventCategoryRouteArgs(key: key, product: product),
         initialChildren: children,
       );

  static const String name = 'EventCategoryRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventCategoryRouteArgs>();
      return _i10.EventCategoryPage(key: args.key, product: args.product);
    },
  );
}

class EventCategoryRouteArgs {
  const EventCategoryRouteArgs({this.key, required this.product});

  final _i41.Key? key;

  final _i42.OldProduct product;

  @override
  String toString() {
    return 'EventCategoryRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i11.EventDetailsPage]
class EventDetailsRoute extends _i40.PageRouteInfo<EventDetailsRouteArgs> {
  EventDetailsRoute({
    _i44.Key? key,
    required _i42.OldProduct event,
    required String productLocationName,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         EventDetailsRoute.name,
         args: EventDetailsRouteArgs(
           key: key,
           event: event,
           productLocationName: productLocationName,
         ),
         initialChildren: children,
       );

  static const String name = 'EventDetailsRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventDetailsRouteArgs>();
      return _i11.EventDetailsPage(
        key: args.key,
        event: args.event,
        productLocationName: args.productLocationName,
      );
    },
  );
}

class EventDetailsRouteArgs {
  const EventDetailsRouteArgs({
    this.key,
    required this.event,
    required this.productLocationName,
  });

  final _i44.Key? key;

  final _i42.OldProduct event;

  final String productLocationName;

  @override
  String toString() {
    return 'EventDetailsRouteArgs{key: $key, event: $event, productLocationName: $productLocationName}';
  }
}

/// generated route for
/// [_i12.EventsSummaryPage]
class EventsSummaryRoute extends _i40.PageRouteInfo<void> {
  const EventsSummaryRoute({List<_i40.PageRouteInfo>? children})
    : super(EventsSummaryRoute.name, initialChildren: children);

  static const String name = 'EventsSummaryRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i12.EventsSummaryPage();
    },
  );
}

/// generated route for
/// [_i13.GalleryPage]
class GalleryRoute extends _i40.PageRouteInfo<GalleryRouteArgs> {
  GalleryRoute({
    _i41.Key? key,
    required List<String> images,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         GalleryRoute.name,
         args: GalleryRouteArgs(key: key, images: images),
         initialChildren: children,
       );

  static const String name = 'GalleryRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GalleryRouteArgs>();
      return _i13.GalleryPage(key: args.key, images: args.images);
    },
  );
}

class GalleryRouteArgs {
  const GalleryRouteArgs({this.key, required this.images});

  final _i41.Key? key;

  final List<String> images;

  @override
  String toString() {
    return 'GalleryRouteArgs{key: $key, images: $images}';
  }
}

/// generated route for
/// [_i14.HostProductSummaryPage]
class HostProductSummaryRoute
    extends _i40.PageRouteInfo<HostProductSummaryRouteArgs> {
  HostProductSummaryRoute({
    _i41.Key? key,
    required String host,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         HostProductSummaryRoute.name,
         args: HostProductSummaryRouteArgs(key: key, host: host),
         initialChildren: children,
       );

  static const String name = 'HostProductSummaryRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HostProductSummaryRouteArgs>();
      return _i14.HostProductSummaryPage(key: args.key, host: args.host);
    },
  );
}

class HostProductSummaryRouteArgs {
  const HostProductSummaryRouteArgs({this.key, required this.host});

  final _i41.Key? key;

  final String host;

  @override
  String toString() {
    return 'HostProductSummaryRouteArgs{key: $key, host: $host}';
  }
}

/// generated route for
/// [_i15.HostingHomePage]
class HostingHomeRoute extends _i40.PageRouteInfo<void> {
  const HostingHomeRoute({List<_i40.PageRouteInfo>? children})
    : super(HostingHomeRoute.name, initialChildren: children);

  static const String name = 'HostingHomeRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i15.HostingHomePage();
    },
  );
}

/// generated route for
/// [_i16.ImagePreviewPage]
class ImagePreviewRoute extends _i40.PageRouteInfo<ImagePreviewRouteArgs> {
  ImagePreviewRoute({
    _i41.Key? key,
    required String imageUrl,
    bool isOffline = false,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         ImagePreviewRoute.name,
         args: ImagePreviewRouteArgs(
           key: key,
           imageUrl: imageUrl,
           isOffline: isOffline,
         ),
         initialChildren: children,
       );

  static const String name = 'ImagePreviewRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ImagePreviewRouteArgs>();
      return _i16.ImagePreviewPage(
        key: args.key,
        imageUrl: args.imageUrl,
        isOffline: args.isOffline,
      );
    },
  );
}

class ImagePreviewRouteArgs {
  const ImagePreviewRouteArgs({
    this.key,
    required this.imageUrl,
    this.isOffline = false,
  });

  final _i41.Key? key;

  final String imageUrl;

  final bool isOffline;

  @override
  String toString() {
    return 'ImagePreviewRouteArgs{key: $key, imageUrl: $imageUrl, isOffline: $isOffline}';
  }
}

/// generated route for
/// [_i17.ImageSelectionPage]
class ImageSelectionRoute extends _i40.PageRouteInfo<ImageSelectionRouteArgs> {
  ImageSelectionRoute({
    _i41.Key? key,
    required _i42.OldProduct product,
    _i45.ProductTypes type = _i45.ProductTypes.Event,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         ImageSelectionRoute.name,
         args: ImageSelectionRouteArgs(key: key, product: product, type: type),
         initialChildren: children,
       );

  static const String name = 'ImageSelectionRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ImageSelectionRouteArgs>();
      return _i17.ImageSelectionPage(
        key: args.key,
        product: args.product,
        type: args.type,
      );
    },
  );
}

class ImageSelectionRouteArgs {
  const ImageSelectionRouteArgs({
    this.key,
    required this.product,
    this.type = _i45.ProductTypes.Event,
  });

  final _i41.Key? key;

  final _i42.OldProduct product;

  final _i45.ProductTypes type;

  @override
  String toString() {
    return 'ImageSelectionRouteArgs{key: $key, product: $product, type: $type}';
  }
}

/// generated route for
/// [_i18.LoginPage]
class LoginRoute extends _i40.PageRouteInfo<void> {
  const LoginRoute({List<_i40.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i18.LoginPage();
    },
  );
}

/// generated route for
/// [_i19.OverviewPage]
class OverviewRoute extends _i40.PageRouteInfo<void> {
  const OverviewRoute({List<_i40.PageRouteInfo>? children})
    : super(OverviewRoute.name, initialChildren: children);

  static const String name = 'OverviewRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i19.OverviewPage();
    },
  );
}

/// generated route for
/// [_i20.PaymentConfirmationPage]
class PaymentConfirmationRoute
    extends _i40.PageRouteInfo<PaymentConfirmationRouteArgs> {
  PaymentConfirmationRoute({
    _i41.Key? key,
    required _i42.OldProduct product,
    required String locationName,
    required _i46.Ticket ticket,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         PaymentConfirmationRoute.name,
         args: PaymentConfirmationRouteArgs(
           key: key,
           product: product,
           locationName: locationName,
           ticket: ticket,
         ),
         initialChildren: children,
       );

  static const String name = 'PaymentConfirmationRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PaymentConfirmationRouteArgs>();
      return _i20.PaymentConfirmationPage(
        key: args.key,
        product: args.product,
        locationName: args.locationName,
        ticket: args.ticket,
      );
    },
  );
}

class PaymentConfirmationRouteArgs {
  const PaymentConfirmationRouteArgs({
    this.key,
    required this.product,
    required this.locationName,
    required this.ticket,
  });

  final _i41.Key? key;

  final _i42.OldProduct product;

  final String locationName;

  final _i46.Ticket ticket;

  @override
  String toString() {
    return 'PaymentConfirmationRouteArgs{key: $key, product: $product, locationName: $locationName, ticket: $ticket}';
  }
}

/// generated route for
/// [_i21.PaymentSummaryPage]
class PaymentSummaryRoute extends _i40.PageRouteInfo<PaymentSummaryRouteArgs> {
  PaymentSummaryRoute({
    _i41.Key? key,
    required _i42.OldProduct product,
    required String locationName,
    required List<_i46.Ticket> tickets,
    required DateTime selectedDateTime,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         PaymentSummaryRoute.name,
         args: PaymentSummaryRouteArgs(
           key: key,
           product: product,
           locationName: locationName,
           tickets: tickets,
           selectedDateTime: selectedDateTime,
         ),
         initialChildren: children,
       );

  static const String name = 'PaymentSummaryRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PaymentSummaryRouteArgs>();
      return _i21.PaymentSummaryPage(
        key: args.key,
        product: args.product,
        locationName: args.locationName,
        tickets: args.tickets,
        selectedDateTime: args.selectedDateTime,
      );
    },
  );
}

class PaymentSummaryRouteArgs {
  const PaymentSummaryRouteArgs({
    this.key,
    required this.product,
    required this.locationName,
    required this.tickets,
    required this.selectedDateTime,
  });

  final _i41.Key? key;

  final _i42.OldProduct product;

  final String locationName;

  final List<_i46.Ticket> tickets;

  final DateTime selectedDateTime;

  @override
  String toString() {
    return 'PaymentSummaryRouteArgs{key: $key, product: $product, locationName: $locationName, tickets: $tickets, selectedDateTime: $selectedDateTime}';
  }
}

/// generated route for
/// [_i22.ProductBasicDetailsPage]
class ProductBasicDetailsRoute extends _i40.PageRouteInfo<void> {
  const ProductBasicDetailsRoute({List<_i40.PageRouteInfo>? children})
    : super(ProductBasicDetailsRoute.name, initialChildren: children);

  static const String name = 'ProductBasicDetailsRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i22.ProductBasicDetailsPage();
    },
  );
}

/// generated route for
/// [_i23.ProductBookingsPage]
class ProductBookingsRoute extends _i40.PageRouteInfo<void> {
  const ProductBookingsRoute({List<_i40.PageRouteInfo>? children})
    : super(ProductBookingsRoute.name, initialChildren: children);

  static const String name = 'ProductBookingsRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i23.ProductBookingsPage();
    },
  );
}

/// generated route for
/// [_i24.ProductDateTimePage]
class ProductDateTimeRoute extends _i40.PageRouteInfo<void> {
  const ProductDateTimeRoute({List<_i40.PageRouteInfo>? children})
    : super(ProductDateTimeRoute.name, initialChildren: children);

  static const String name = 'ProductDateTimeRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i24.ProductDateTimePage();
    },
  );
}

/// generated route for
/// [_i25.ProductDetailPage]
class ProductDetailRoute extends _i40.PageRouteInfo<void> {
  const ProductDetailRoute({List<_i40.PageRouteInfo>? children})
    : super(ProductDetailRoute.name, initialChildren: children);

  static const String name = 'ProductDetailRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i25.ProductDetailPage();
    },
  );
}

/// generated route for
/// [_i26.ProductLocationPage]
class ProductLocationRoute extends _i40.PageRouteInfo<void> {
  const ProductLocationRoute({List<_i40.PageRouteInfo>? children})
    : super(ProductLocationRoute.name, initialChildren: children);

  static const String name = 'ProductLocationRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i26.ProductLocationPage();
    },
  );
}

/// generated route for
/// [_i27.ProductPhotosPage]
class ProductPhotosRoute extends _i40.PageRouteInfo<void> {
  const ProductPhotosRoute({List<_i40.PageRouteInfo>? children})
    : super(ProductPhotosRoute.name, initialChildren: children);

  static const String name = 'ProductPhotosRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i27.ProductPhotosPage();
    },
  );
}

/// generated route for
/// [_i28.ProductPricingPage]
class ProductPricingRoute extends _i40.PageRouteInfo<void> {
  const ProductPricingRoute({List<_i40.PageRouteInfo>? children})
    : super(ProductPricingRoute.name, initialChildren: children);

  static const String name = 'ProductPricingRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i28.ProductPricingPage();
    },
  );
}

/// generated route for
/// [_i29.ProductReviewAndSubmitPage]
class ProductReviewAndSubmitRoute extends _i40.PageRouteInfo<void> {
  const ProductReviewAndSubmitRoute({List<_i40.PageRouteInfo>? children})
    : super(ProductReviewAndSubmitRoute.name, initialChildren: children);

  static const String name = 'ProductReviewAndSubmitRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i29.ProductReviewAndSubmitPage();
    },
  );
}

/// generated route for
/// [_i30.ProductSetupPreviewPage]
class ProductSetupPreviewRoute extends _i40.PageRouteInfo<void> {
  const ProductSetupPreviewRoute({List<_i40.PageRouteInfo>? children})
    : super(ProductSetupPreviewRoute.name, initialChildren: children);

  static const String name = 'ProductSetupPreviewRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i30.ProductSetupPreviewPage();
    },
  );
}

/// generated route for
/// [_i31.ProductsPage]
class ProductsRoute extends _i40.PageRouteInfo<void> {
  const ProductsRoute({List<_i40.PageRouteInfo>? children})
    : super(ProductsRoute.name, initialChildren: children);

  static const String name = 'ProductsRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i31.ProductsPage();
    },
  );
}

/// generated route for
/// [_i32.ProfilePage]
class ProfileRoute extends _i40.PageRouteInfo<void> {
  const ProfileRoute({List<_i40.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i32.ProfilePage();
    },
  );
}

/// generated route for
/// [_i33.RequestOTPPage]
class RequestOTPRoute extends _i40.PageRouteInfo<void> {
  const RequestOTPRoute({List<_i40.PageRouteInfo>? children})
    : super(RequestOTPRoute.name, initialChildren: children);

  static const String name = 'RequestOTPRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i33.RequestOTPPage();
    },
  );
}

/// generated route for
/// [_i34.SetupProductCategoryPage]
class SetupProductCategoryRoute extends _i40.PageRouteInfo<void> {
  const SetupProductCategoryRoute({List<_i40.PageRouteInfo>? children})
    : super(SetupProductCategoryRoute.name, initialChildren: children);

  static const String name = 'SetupProductCategoryRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i34.SetupProductCategoryPage();
    },
  );
}

/// generated route for
/// [_i35.SetupProductTypePage]
class SetupProductTypeRoute extends _i40.PageRouteInfo<void> {
  const SetupProductTypeRoute({List<_i40.PageRouteInfo>? children})
    : super(SetupProductTypeRoute.name, initialChildren: children);

  static const String name = 'SetupProductTypeRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i35.SetupProductTypePage();
    },
  );
}

/// generated route for
/// [_i36.SharedLandingPage]
class SharedLandingRoute extends _i40.PageRouteInfo<void> {
  const SharedLandingRoute({List<_i40.PageRouteInfo>? children})
    : super(SharedLandingRoute.name, initialChildren: children);

  static const String name = 'SharedLandingRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i36.SharedLandingPage();
    },
  );
}

/// generated route for
/// [_i37.TicketsSummaryPage]
class TicketsSummaryRoute extends _i40.PageRouteInfo<TicketsSummaryRouteArgs> {
  TicketsSummaryRoute({
    _i41.Key? key,
    required _i42.OldProduct product,
    required Map<String, double> prices,
    required Map<String, int> amounts,
    required _i47.Currency currency,
    required List<String> selectedCategories,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         TicketsSummaryRoute.name,
         args: TicketsSummaryRouteArgs(
           key: key,
           product: product,
           prices: prices,
           amounts: amounts,
           currency: currency,
           selectedCategories: selectedCategories,
         ),
         initialChildren: children,
       );

  static const String name = 'TicketsSummaryRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TicketsSummaryRouteArgs>();
      return _i37.TicketsSummaryPage(
        key: args.key,
        product: args.product,
        prices: args.prices,
        amounts: args.amounts,
        currency: args.currency,
        selectedCategories: args.selectedCategories,
      );
    },
  );
}

class TicketsSummaryRouteArgs {
  const TicketsSummaryRouteArgs({
    this.key,
    required this.product,
    required this.prices,
    required this.amounts,
    required this.currency,
    required this.selectedCategories,
  });

  final _i41.Key? key;

  final _i42.OldProduct product;

  final Map<String, double> prices;

  final Map<String, int> amounts;

  final _i47.Currency currency;

  final List<String> selectedCategories;

  @override
  String toString() {
    return 'TicketsSummaryRouteArgs{key: $key, product: $product, prices: $prices, amounts: $amounts, currency: $currency, selectedCategories: $selectedCategories}';
  }
}

/// generated route for
/// [_i38.VerifyOTPPage]
class VerifyOTPRoute extends _i40.PageRouteInfo<void> {
  const VerifyOTPRoute({List<_i40.PageRouteInfo>? children})
    : super(VerifyOTPRoute.name, initialChildren: children);

  static const String name = 'VerifyOTPRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i38.VerifyOTPPage();
    },
  );
}

/// generated route for
/// [_i39.VideoSelectionPage]
class VideoSelectionRoute extends _i40.PageRouteInfo<VideoSelectionRouteArgs> {
  VideoSelectionRoute({
    _i41.Key? key,
    required _i42.OldProduct product,
    required _i45.ProductTypes type,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         VideoSelectionRoute.name,
         args: VideoSelectionRouteArgs(key: key, product: product, type: type),
         initialChildren: children,
       );

  static const String name = 'VideoSelectionRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VideoSelectionRouteArgs>();
      return _i39.VideoSelectionPage(
        key: args.key,
        product: args.product,
        type: args.type,
      );
    },
  );
}

class VideoSelectionRouteArgs {
  const VideoSelectionRouteArgs({
    this.key,
    required this.product,
    required this.type,
  });

  final _i41.Key? key;

  final _i42.OldProduct product;

  final _i45.ProductTypes type;

  @override
  String toString() {
    return 'VideoSelectionRouteArgs{key: $key, product: $product, type: $type}';
  }
}
