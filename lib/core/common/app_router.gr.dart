// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i46;
import 'package:flutter/foundation.dart' as _i50;
import 'package:flutter/material.dart' as _i47;
import 'package:fullbooker/features/consumer/pages/consumer_home_page.dart'
    as _i8;
import 'package:fullbooker/features/consumer/pages/event_details_page.dart'
    as _i11;
import 'package:fullbooker/features/consumer/pages/old_gallery_page.dart'
    as _i20;
import 'package:fullbooker/features/consumer/pages/payment_confirmation_page.dart'
    as _i22;
import 'package:fullbooker/features/consumer/pages/payment_summary_page.dart'
    as _i23;
import 'package:fullbooker/features/host/models/old_currency.dart' as _i53;
import 'package:fullbooker/features/host/models/old_product.dart' as _i48;
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
    as _i18;
import 'package:fullbooker/features/host/pages/old_events_summary_page.dart'
    as _i12;
import 'package:fullbooker/features/host/pages/tickets_summary_page.dart'
    as _i42;
import 'package:fullbooker/features/host/pages/video_selection_page.dart'
    as _i45;
import 'package:fullbooker/presentation/host/home/pages/hosting_home_page.dart'
    as _i15;
import 'package:fullbooker/presentation/host/product_setup/pages/add_product_pricing_page.dart'
    as _i5;
import 'package:fullbooker/presentation/host/product_setup/pages/choose_location_page.dart'
    as _i7;
import 'package:fullbooker/presentation/host/product_setup/pages/product_basic_details_page.dart'
    as _i24;
import 'package:fullbooker/presentation/host/product_setup/pages/product_location_page.dart'
    as _i27;
import 'package:fullbooker/presentation/host/product_setup/pages/product_photos_page.dart'
    as _i28;
import 'package:fullbooker/presentation/host/product_setup/pages/product_pricing_page.dart'
    as _i29;
import 'package:fullbooker/presentation/host/product_setup/pages/product_review_and_submit_page.dart'
    as _i30;
import 'package:fullbooker/presentation/host/product_setup/pages/product_setup_preview_page.dart'
    as _i32;
import 'package:fullbooker/presentation/host/product_setup/pages/product_shedule_page.dart'
    as _i31;
import 'package:fullbooker/presentation/host/product_setup/pages/product_videos_page.dart'
    as _i33;
import 'package:fullbooker/presentation/host/product_setup/pages/setup_product_category_page.dart'
    as _i38;
import 'package:fullbooker/presentation/host/product_setup/pages/setup_product_type_page.dart'
    as _i39;
import 'package:fullbooker/presentation/host/products/pages/product_bookings_page.dart'
    as _i25;
import 'package:fullbooker/presentation/host/products/pages/product_detail_page.dart'
    as _i26;
import 'package:fullbooker/presentation/host/products/pages/products_page.dart'
    as _i34;
import 'package:fullbooker/presentation/host/products/pages/scan_tickets_page.dart'
    as _i37;
import 'package:fullbooker/presentation/onboarding/pages/change_password_page.dart'
    as _i6;
import 'package:fullbooker/presentation/onboarding/pages/create_account_page.dart'
    as _i9;
import 'package:fullbooker/presentation/onboarding/pages/login_page.dart'
    as _i19;
import 'package:fullbooker/presentation/onboarding/pages/request_otp_page.dart'
    as _i36;
import 'package:fullbooker/presentation/onboarding/pages/update_password_page.dart'
    as _i43;
import 'package:fullbooker/presentation/onboarding/pages/verify_otp_page.dart'
    as _i44;
import 'package:fullbooker/presentation/profile/pages/profile_page.dart'
    as _i35;
import 'package:fullbooker/presentation/shared/full_screen_video_player_page.dart'
    as _i13;
import 'package:fullbooker/presentation/shared/image_gallery_page.dart' as _i16;
import 'package:fullbooker/presentation/shared/image_preview_page.dart' as _i17;
import 'package:fullbooker/presentation/shared/terms_and_conditions_page.dart'
    as _i41;
import 'package:fullbooker/shared/entities/enums.dart' as _i51;
import 'package:fullbooker/shared/entities/session_pricing.dart' as _i49;
import 'package:fullbooker/shared/entities/ticket.dart' as _i52;
import 'package:fullbooker/shared/pages/overview_page.dart' as _i21;
import 'package:fullbooker/shared/pages/shared_landing_page.dart' as _i40;

/// generated route for
/// [_i1.ActivityDateSelectionPage]
class ActivityDateSelectionRoute
    extends _i46.PageRouteInfo<ActivityDateSelectionRouteArgs> {
  ActivityDateSelectionRoute({
    _i47.Key? key,
    required _i48.OldProduct product,
    required Map<String, Object?> location,
    List<_i46.PageRouteInfo>? children,
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

  static _i46.PageInfo page = _i46.PageInfo(
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

  final _i47.Key? key;

  final _i48.OldProduct product;

  final Map<String, Object?> location;

  @override
  String toString() {
    return 'ActivityDateSelectionRouteArgs{key: $key, product: $product, location: $location}';
  }
}

/// generated route for
/// [_i2.ActivityDayPassPage]
class ActivityDayPassRoute
    extends _i46.PageRouteInfo<ActivityDayPassRouteArgs> {
  ActivityDayPassRoute({
    _i47.Key? key,
    required _i48.OldProduct product,
    required _i49.SessionPricing sessionPricing,
    List<_i46.PageRouteInfo>? children,
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

  static _i46.PageInfo page = _i46.PageInfo(
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

  final _i47.Key? key;

  final _i48.OldProduct product;

  final _i49.SessionPricing sessionPricing;

  @override
  String toString() {
    return 'ActivityDayPassRouteArgs{key: $key, product: $product, sessionPricing: $sessionPricing}';
  }
}

/// generated route for
/// [_i3.ActivityPricingPage]
class ActivityPricingRoute
    extends _i46.PageRouteInfo<ActivityPricingRouteArgs> {
  ActivityPricingRoute({
    _i47.Key? key,
    required _i48.OldProduct product,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         ActivityPricingRoute.name,
         args: ActivityPricingRouteArgs(key: key, product: product),
         initialChildren: children,
       );

  static const String name = 'ActivityPricingRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ActivityPricingRouteArgs>();
      return _i3.ActivityPricingPage(key: args.key, product: args.product);
    },
  );
}

class ActivityPricingRouteArgs {
  const ActivityPricingRouteArgs({this.key, required this.product});

  final _i47.Key? key;

  final _i48.OldProduct product;

  @override
  String toString() {
    return 'ActivityPricingRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i4.ActivitySubscriptionPage]
class ActivitySubscriptionRoute
    extends _i46.PageRouteInfo<ActivitySubscriptionRouteArgs> {
  ActivitySubscriptionRoute({
    _i47.Key? key,
    required _i48.OldProduct product,
    required _i49.SessionPricing sessionPricing,
    _i49.SessionPricing? dayPassPricing,
    List<_i46.PageRouteInfo>? children,
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

  static _i46.PageInfo page = _i46.PageInfo(
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

  final _i47.Key? key;

  final _i48.OldProduct product;

  final _i49.SessionPricing sessionPricing;

  final _i49.SessionPricing? dayPassPricing;

  @override
  String toString() {
    return 'ActivitySubscriptionRouteArgs{key: $key, product: $product, sessionPricing: $sessionPricing, dayPassPricing: $dayPassPricing}';
  }
}

/// generated route for
/// [_i5.AddProductPricingPage]
class AddProductPricingRoute extends _i46.PageRouteInfo<void> {
  const AddProductPricingRoute({List<_i46.PageRouteInfo>? children})
    : super(AddProductPricingRoute.name, initialChildren: children);

  static const String name = 'AddProductPricingRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i5.AddProductPricingPage();
    },
  );
}

/// generated route for
/// [_i6.ChangePasswordPage]
class ChangePasswordRoute extends _i46.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i46.PageRouteInfo>? children})
    : super(ChangePasswordRoute.name, initialChildren: children);

  static const String name = 'ChangePasswordRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i6.ChangePasswordPage();
    },
  );
}

/// generated route for
/// [_i7.ChooseLocationPage]
class ChooseLocationRoute extends _i46.PageRouteInfo<void> {
  const ChooseLocationRoute({List<_i46.PageRouteInfo>? children})
    : super(ChooseLocationRoute.name, initialChildren: children);

  static const String name = 'ChooseLocationRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i7.ChooseLocationPage();
    },
  );
}

/// generated route for
/// [_i8.ConsumerHomePage]
class ConsumerHomeRoute extends _i46.PageRouteInfo<void> {
  const ConsumerHomeRoute({List<_i46.PageRouteInfo>? children})
    : super(ConsumerHomeRoute.name, initialChildren: children);

  static const String name = 'ConsumerHomeRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i8.ConsumerHomePage();
    },
  );
}

/// generated route for
/// [_i9.CreateAccountPage]
class CreateAccountRoute extends _i46.PageRouteInfo<void> {
  const CreateAccountRoute({List<_i46.PageRouteInfo>? children})
    : super(CreateAccountRoute.name, initialChildren: children);

  static const String name = 'CreateAccountRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i9.CreateAccountPage();
    },
  );
}

/// generated route for
/// [_i10.EventCategoryPage]
class EventCategoryRoute extends _i46.PageRouteInfo<EventCategoryRouteArgs> {
  EventCategoryRoute({
    _i47.Key? key,
    required _i48.OldProduct product,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         EventCategoryRoute.name,
         args: EventCategoryRouteArgs(key: key, product: product),
         initialChildren: children,
       );

  static const String name = 'EventCategoryRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventCategoryRouteArgs>();
      return _i10.EventCategoryPage(key: args.key, product: args.product);
    },
  );
}

class EventCategoryRouteArgs {
  const EventCategoryRouteArgs({this.key, required this.product});

  final _i47.Key? key;

  final _i48.OldProduct product;

  @override
  String toString() {
    return 'EventCategoryRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i11.EventDetailsPage]
class EventDetailsRoute extends _i46.PageRouteInfo<EventDetailsRouteArgs> {
  EventDetailsRoute({
    _i50.Key? key,
    required _i48.OldProduct event,
    required String productLocationName,
    List<_i46.PageRouteInfo>? children,
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

  static _i46.PageInfo page = _i46.PageInfo(
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

  final _i50.Key? key;

  final _i48.OldProduct event;

  final String productLocationName;

  @override
  String toString() {
    return 'EventDetailsRouteArgs{key: $key, event: $event, productLocationName: $productLocationName}';
  }
}

/// generated route for
/// [_i12.EventsSummaryPage]
class EventsSummaryRoute extends _i46.PageRouteInfo<void> {
  const EventsSummaryRoute({List<_i46.PageRouteInfo>? children})
    : super(EventsSummaryRoute.name, initialChildren: children);

  static const String name = 'EventsSummaryRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i12.EventsSummaryPage();
    },
  );
}

/// generated route for
/// [_i13.FullscreenVideoPlayerPage]
class FullscreenVideoPlayerRoute
    extends _i46.PageRouteInfo<FullscreenVideoPlayerRouteArgs> {
  FullscreenVideoPlayerRoute({
    _i47.Key? key,
    required String videoUrl,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         FullscreenVideoPlayerRoute.name,
         args: FullscreenVideoPlayerRouteArgs(key: key, videoUrl: videoUrl),
         initialChildren: children,
       );

  static const String name = 'FullscreenVideoPlayerRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FullscreenVideoPlayerRouteArgs>();
      return _i13.FullscreenVideoPlayerPage(
        key: args.key,
        videoUrl: args.videoUrl,
      );
    },
  );
}

class FullscreenVideoPlayerRouteArgs {
  const FullscreenVideoPlayerRouteArgs({this.key, required this.videoUrl});

  final _i47.Key? key;

  final String videoUrl;

  @override
  String toString() {
    return 'FullscreenVideoPlayerRouteArgs{key: $key, videoUrl: $videoUrl}';
  }
}

/// generated route for
/// [_i14.HostProductSummaryPage]
class HostProductSummaryRoute
    extends _i46.PageRouteInfo<HostProductSummaryRouteArgs> {
  HostProductSummaryRoute({
    _i47.Key? key,
    required String host,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         HostProductSummaryRoute.name,
         args: HostProductSummaryRouteArgs(key: key, host: host),
         initialChildren: children,
       );

  static const String name = 'HostProductSummaryRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HostProductSummaryRouteArgs>();
      return _i14.HostProductSummaryPage(key: args.key, host: args.host);
    },
  );
}

class HostProductSummaryRouteArgs {
  const HostProductSummaryRouteArgs({this.key, required this.host});

  final _i47.Key? key;

  final String host;

  @override
  String toString() {
    return 'HostProductSummaryRouteArgs{key: $key, host: $host}';
  }
}

/// generated route for
/// [_i15.HostingHomePage]
class HostingHomeRoute extends _i46.PageRouteInfo<void> {
  const HostingHomeRoute({List<_i46.PageRouteInfo>? children})
    : super(HostingHomeRoute.name, initialChildren: children);

  static const String name = 'HostingHomeRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i15.HostingHomePage();
    },
  );
}

/// generated route for
/// [_i16.ImageGalleryPage]
class ImageGalleryRoute extends _i46.PageRouteInfo<ImageGalleryRouteArgs> {
  ImageGalleryRoute({
    _i47.Key? key,
    required List<String> images,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         ImageGalleryRoute.name,
         args: ImageGalleryRouteArgs(key: key, images: images),
         initialChildren: children,
       );

  static const String name = 'ImageGalleryRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ImageGalleryRouteArgs>();
      return _i16.ImageGalleryPage(key: args.key, images: args.images);
    },
  );
}

class ImageGalleryRouteArgs {
  const ImageGalleryRouteArgs({this.key, required this.images});

  final _i47.Key? key;

  final List<String> images;

  @override
  String toString() {
    return 'ImageGalleryRouteArgs{key: $key, images: $images}';
  }
}

/// generated route for
/// [_i17.ImagePreviewPage]
class ImagePreviewRoute extends _i46.PageRouteInfo<ImagePreviewRouteArgs> {
  ImagePreviewRoute({
    _i47.Key? key,
    required List<String?>? imageUrls,
    required String imageUrl,
    bool isOffline = false,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         ImagePreviewRoute.name,
         args: ImagePreviewRouteArgs(
           key: key,
           imageUrls: imageUrls,
           imageUrl: imageUrl,
           isOffline: isOffline,
         ),
         initialChildren: children,
       );

  static const String name = 'ImagePreviewRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ImagePreviewRouteArgs>();
      return _i17.ImagePreviewPage(
        key: args.key,
        imageUrls: args.imageUrls,
        imageUrl: args.imageUrl,
        isOffline: args.isOffline,
      );
    },
  );
}

class ImagePreviewRouteArgs {
  const ImagePreviewRouteArgs({
    this.key,
    required this.imageUrls,
    required this.imageUrl,
    this.isOffline = false,
  });

  final _i47.Key? key;

  final List<String?>? imageUrls;

  final String imageUrl;

  final bool isOffline;

  @override
  String toString() {
    return 'ImagePreviewRouteArgs{key: $key, imageUrls: $imageUrls, imageUrl: $imageUrl, isOffline: $isOffline}';
  }
}

/// generated route for
/// [_i18.ImageSelectionPage]
class ImageSelectionRoute extends _i46.PageRouteInfo<ImageSelectionRouteArgs> {
  ImageSelectionRoute({
    _i47.Key? key,
    required _i48.OldProduct product,
    _i51.ProductTypes type = _i51.ProductTypes.Event,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         ImageSelectionRoute.name,
         args: ImageSelectionRouteArgs(key: key, product: product, type: type),
         initialChildren: children,
       );

  static const String name = 'ImageSelectionRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ImageSelectionRouteArgs>();
      return _i18.ImageSelectionPage(
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
    this.type = _i51.ProductTypes.Event,
  });

  final _i47.Key? key;

  final _i48.OldProduct product;

  final _i51.ProductTypes type;

  @override
  String toString() {
    return 'ImageSelectionRouteArgs{key: $key, product: $product, type: $type}';
  }
}

/// generated route for
/// [_i19.LoginPage]
class LoginRoute extends _i46.PageRouteInfo<void> {
  const LoginRoute({List<_i46.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i19.LoginPage();
    },
  );
}

/// generated route for
/// [_i20.OldGalleryPage]
class OldGalleryRoute extends _i46.PageRouteInfo<OldGalleryRouteArgs> {
  OldGalleryRoute({
    _i47.Key? key,
    required List<String> images,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         OldGalleryRoute.name,
         args: OldGalleryRouteArgs(key: key, images: images),
         initialChildren: children,
       );

  static const String name = 'OldGalleryRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OldGalleryRouteArgs>();
      return _i20.OldGalleryPage(key: args.key, images: args.images);
    },
  );
}

class OldGalleryRouteArgs {
  const OldGalleryRouteArgs({this.key, required this.images});

  final _i47.Key? key;

  final List<String> images;

  @override
  String toString() {
    return 'OldGalleryRouteArgs{key: $key, images: $images}';
  }
}

/// generated route for
/// [_i21.OverviewPage]
class OverviewRoute extends _i46.PageRouteInfo<void> {
  const OverviewRoute({List<_i46.PageRouteInfo>? children})
    : super(OverviewRoute.name, initialChildren: children);

  static const String name = 'OverviewRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i21.OverviewPage();
    },
  );
}

/// generated route for
/// [_i22.PaymentConfirmationPage]
class PaymentConfirmationRoute
    extends _i46.PageRouteInfo<PaymentConfirmationRouteArgs> {
  PaymentConfirmationRoute({
    _i47.Key? key,
    required _i48.OldProduct product,
    required String locationName,
    required _i52.Ticket ticket,
    List<_i46.PageRouteInfo>? children,
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

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PaymentConfirmationRouteArgs>();
      return _i22.PaymentConfirmationPage(
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

  final _i47.Key? key;

  final _i48.OldProduct product;

  final String locationName;

  final _i52.Ticket ticket;

  @override
  String toString() {
    return 'PaymentConfirmationRouteArgs{key: $key, product: $product, locationName: $locationName, ticket: $ticket}';
  }
}

/// generated route for
/// [_i23.PaymentSummaryPage]
class PaymentSummaryRoute extends _i46.PageRouteInfo<PaymentSummaryRouteArgs> {
  PaymentSummaryRoute({
    _i47.Key? key,
    required _i48.OldProduct product,
    required String locationName,
    required List<_i52.Ticket> tickets,
    required DateTime selectedDateTime,
    List<_i46.PageRouteInfo>? children,
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

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PaymentSummaryRouteArgs>();
      return _i23.PaymentSummaryPage(
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

  final _i47.Key? key;

  final _i48.OldProduct product;

  final String locationName;

  final List<_i52.Ticket> tickets;

  final DateTime selectedDateTime;

  @override
  String toString() {
    return 'PaymentSummaryRouteArgs{key: $key, product: $product, locationName: $locationName, tickets: $tickets, selectedDateTime: $selectedDateTime}';
  }
}

/// generated route for
/// [_i24.ProductBasicDetailsPage]
class ProductBasicDetailsRoute
    extends _i46.PageRouteInfo<ProductBasicDetailsRouteArgs> {
  ProductBasicDetailsRoute({
    _i47.Key? key,
    required _i51.WorkflowState workflowState,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         ProductBasicDetailsRoute.name,
         args: ProductBasicDetailsRouteArgs(
           key: key,
           workflowState: workflowState,
         ),
         initialChildren: children,
       );

  static const String name = 'ProductBasicDetailsRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductBasicDetailsRouteArgs>();
      return _i24.ProductBasicDetailsPage(
        key: args.key,
        workflowState: args.workflowState,
      );
    },
  );
}

class ProductBasicDetailsRouteArgs {
  const ProductBasicDetailsRouteArgs({this.key, required this.workflowState});

  final _i47.Key? key;

  final _i51.WorkflowState workflowState;

  @override
  String toString() {
    return 'ProductBasicDetailsRouteArgs{key: $key, workflowState: $workflowState}';
  }
}

/// generated route for
/// [_i25.ProductBookingsPage]
class ProductBookingsRoute extends _i46.PageRouteInfo<void> {
  const ProductBookingsRoute({List<_i46.PageRouteInfo>? children})
    : super(ProductBookingsRoute.name, initialChildren: children);

  static const String name = 'ProductBookingsRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i25.ProductBookingsPage();
    },
  );
}

/// generated route for
/// [_i26.ProductDetailPage]
class ProductDetailRoute extends _i46.PageRouteInfo<void> {
  const ProductDetailRoute({List<_i46.PageRouteInfo>? children})
    : super(ProductDetailRoute.name, initialChildren: children);

  static const String name = 'ProductDetailRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i26.ProductDetailPage();
    },
  );
}

/// generated route for
/// [_i27.ProductLocationPage]
class ProductLocationRoute
    extends _i46.PageRouteInfo<ProductLocationRouteArgs> {
  ProductLocationRoute({
    _i47.Key? key,
    required _i51.WorkflowState workflowState,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         ProductLocationRoute.name,
         args: ProductLocationRouteArgs(key: key, workflowState: workflowState),
         initialChildren: children,
       );

  static const String name = 'ProductLocationRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductLocationRouteArgs>();
      return _i27.ProductLocationPage(
        key: args.key,
        workflowState: args.workflowState,
      );
    },
  );
}

class ProductLocationRouteArgs {
  const ProductLocationRouteArgs({this.key, required this.workflowState});

  final _i47.Key? key;

  final _i51.WorkflowState workflowState;

  @override
  String toString() {
    return 'ProductLocationRouteArgs{key: $key, workflowState: $workflowState}';
  }
}

/// generated route for
/// [_i28.ProductPhotosPage]
class ProductPhotosRoute extends _i46.PageRouteInfo<void> {
  const ProductPhotosRoute({List<_i46.PageRouteInfo>? children})
    : super(ProductPhotosRoute.name, initialChildren: children);

  static const String name = 'ProductPhotosRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i28.ProductPhotosPage();
    },
  );
}

/// generated route for
/// [_i29.ProductPricingPage]
class ProductPricingRoute extends _i46.PageRouteInfo<void> {
  const ProductPricingRoute({List<_i46.PageRouteInfo>? children})
    : super(ProductPricingRoute.name, initialChildren: children);

  static const String name = 'ProductPricingRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i29.ProductPricingPage();
    },
  );
}

/// generated route for
/// [_i30.ProductReviewAndSubmitPage]
class ProductReviewAndSubmitRoute
    extends _i46.PageRouteInfo<ProductReviewAndSubmitRouteArgs> {
  ProductReviewAndSubmitRoute({
    _i47.Key? key,
    required _i51.WorkflowState workflowState,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         ProductReviewAndSubmitRoute.name,
         args: ProductReviewAndSubmitRouteArgs(
           key: key,
           workflowState: workflowState,
         ),
         initialChildren: children,
       );

  static const String name = 'ProductReviewAndSubmitRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductReviewAndSubmitRouteArgs>();
      return _i30.ProductReviewAndSubmitPage(
        key: args.key,
        workflowState: args.workflowState,
      );
    },
  );
}

class ProductReviewAndSubmitRouteArgs {
  const ProductReviewAndSubmitRouteArgs({
    this.key,
    required this.workflowState,
  });

  final _i47.Key? key;

  final _i51.WorkflowState workflowState;

  @override
  String toString() {
    return 'ProductReviewAndSubmitRouteArgs{key: $key, workflowState: $workflowState}';
  }
}

/// generated route for
/// [_i31.ProductSchedulePage]
class ProductScheduleRoute
    extends _i46.PageRouteInfo<ProductScheduleRouteArgs> {
  ProductScheduleRoute({
    _i47.Key? key,
    required _i51.WorkflowState workflowState,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         ProductScheduleRoute.name,
         args: ProductScheduleRouteArgs(key: key, workflowState: workflowState),
         initialChildren: children,
       );

  static const String name = 'ProductScheduleRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductScheduleRouteArgs>();
      return _i31.ProductSchedulePage(
        key: args.key,
        workflowState: args.workflowState,
      );
    },
  );
}

class ProductScheduleRouteArgs {
  const ProductScheduleRouteArgs({this.key, required this.workflowState});

  final _i47.Key? key;

  final _i51.WorkflowState workflowState;

  @override
  String toString() {
    return 'ProductScheduleRouteArgs{key: $key, workflowState: $workflowState}';
  }
}

/// generated route for
/// [_i32.ProductSetupPreviewPage]
class ProductSetupPreviewRoute extends _i46.PageRouteInfo<void> {
  const ProductSetupPreviewRoute({List<_i46.PageRouteInfo>? children})
    : super(ProductSetupPreviewRoute.name, initialChildren: children);

  static const String name = 'ProductSetupPreviewRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i32.ProductSetupPreviewPage();
    },
  );
}

/// generated route for
/// [_i33.ProductVideosPage]
class ProductVideosRoute extends _i46.PageRouteInfo<void> {
  const ProductVideosRoute({List<_i46.PageRouteInfo>? children})
    : super(ProductVideosRoute.name, initialChildren: children);

  static const String name = 'ProductVideosRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i33.ProductVideosPage();
    },
  );
}

/// generated route for
/// [_i34.ProductsPage]
class ProductsRoute extends _i46.PageRouteInfo<void> {
  const ProductsRoute({List<_i46.PageRouteInfo>? children})
    : super(ProductsRoute.name, initialChildren: children);

  static const String name = 'ProductsRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i34.ProductsPage();
    },
  );
}

/// generated route for
/// [_i35.ProfilePage]
class ProfileRoute extends _i46.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({_i47.Key? key, List<_i46.PageRouteInfo>? children})
    : super(
        ProfileRoute.name,
        args: ProfileRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'ProfileRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileRouteArgs>(
        orElse: () => const ProfileRouteArgs(),
      );
      return _i35.ProfilePage(key: args.key);
    },
  );
}

class ProfileRouteArgs {
  const ProfileRouteArgs({this.key});

  final _i47.Key? key;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i36.RequestOTPPage]
class RequestOTPRoute extends _i46.PageRouteInfo<void> {
  const RequestOTPRoute({List<_i46.PageRouteInfo>? children})
    : super(RequestOTPRoute.name, initialChildren: children);

  static const String name = 'RequestOTPRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i36.RequestOTPPage();
    },
  );
}

/// generated route for
/// [_i37.ScanTicketsPage]
class ScanTicketsRoute extends _i46.PageRouteInfo<void> {
  const ScanTicketsRoute({List<_i46.PageRouteInfo>? children})
    : super(ScanTicketsRoute.name, initialChildren: children);

  static const String name = 'ScanTicketsRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i37.ScanTicketsPage();
    },
  );
}

/// generated route for
/// [_i38.SetupProductCategoryPage]
class SetupProductCategoryRoute extends _i46.PageRouteInfo<void> {
  const SetupProductCategoryRoute({List<_i46.PageRouteInfo>? children})
    : super(SetupProductCategoryRoute.name, initialChildren: children);

  static const String name = 'SetupProductCategoryRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i38.SetupProductCategoryPage();
    },
  );
}

/// generated route for
/// [_i39.SetupProductTypePage]
class SetupProductTypeRoute extends _i46.PageRouteInfo<void> {
  const SetupProductTypeRoute({List<_i46.PageRouteInfo>? children})
    : super(SetupProductTypeRoute.name, initialChildren: children);

  static const String name = 'SetupProductTypeRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i39.SetupProductTypePage();
    },
  );
}

/// generated route for
/// [_i40.SharedLandingPage]
class SharedLandingRoute extends _i46.PageRouteInfo<void> {
  const SharedLandingRoute({List<_i46.PageRouteInfo>? children})
    : super(SharedLandingRoute.name, initialChildren: children);

  static const String name = 'SharedLandingRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i40.SharedLandingPage();
    },
  );
}

/// generated route for
/// [_i41.TermsAndConditionsPage]
class TermsAndConditionsRoute extends _i46.PageRouteInfo<void> {
  const TermsAndConditionsRoute({List<_i46.PageRouteInfo>? children})
    : super(TermsAndConditionsRoute.name, initialChildren: children);

  static const String name = 'TermsAndConditionsRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i41.TermsAndConditionsPage();
    },
  );
}

/// generated route for
/// [_i42.TicketsSummaryPage]
class TicketsSummaryRoute extends _i46.PageRouteInfo<TicketsSummaryRouteArgs> {
  TicketsSummaryRoute({
    _i47.Key? key,
    required _i48.OldProduct product,
    required Map<String, double> prices,
    required Map<String, int> amounts,
    required _i53.OldCurrency currency,
    required List<String> selectedCategories,
    List<_i46.PageRouteInfo>? children,
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

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TicketsSummaryRouteArgs>();
      return _i42.TicketsSummaryPage(
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

  final _i47.Key? key;

  final _i48.OldProduct product;

  final Map<String, double> prices;

  final Map<String, int> amounts;

  final _i53.OldCurrency currency;

  final List<String> selectedCategories;

  @override
  String toString() {
    return 'TicketsSummaryRouteArgs{key: $key, product: $product, prices: $prices, amounts: $amounts, currency: $currency, selectedCategories: $selectedCategories}';
  }
}

/// generated route for
/// [_i43.UpdatePasswordPage]
class UpdatePasswordRoute extends _i46.PageRouteInfo<void> {
  const UpdatePasswordRoute({List<_i46.PageRouteInfo>? children})
    : super(UpdatePasswordRoute.name, initialChildren: children);

  static const String name = 'UpdatePasswordRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i43.UpdatePasswordPage();
    },
  );
}

/// generated route for
/// [_i44.VerifyOTPPage]
class VerifyOTPRoute extends _i46.PageRouteInfo<void> {
  const VerifyOTPRoute({List<_i46.PageRouteInfo>? children})
    : super(VerifyOTPRoute.name, initialChildren: children);

  static const String name = 'VerifyOTPRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i44.VerifyOTPPage();
    },
  );
}

/// generated route for
/// [_i45.VideoSelectionPage]
class VideoSelectionRoute extends _i46.PageRouteInfo<VideoSelectionRouteArgs> {
  VideoSelectionRoute({
    _i47.Key? key,
    required _i48.OldProduct product,
    required _i51.ProductTypes type,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         VideoSelectionRoute.name,
         args: VideoSelectionRouteArgs(key: key, product: product, type: type),
         initialChildren: children,
       );

  static const String name = 'VideoSelectionRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VideoSelectionRouteArgs>();
      return _i45.VideoSelectionPage(
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

  final _i47.Key? key;

  final _i48.OldProduct product;

  final _i51.ProductTypes type;

  @override
  String toString() {
    return 'VideoSelectionRouteArgs{key: $key, product: $product, type: $type}';
  }
}
