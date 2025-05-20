// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i43;
import 'package:flutter/foundation.dart' as _i46;
import 'package:flutter/material.dart' as _i44;
import 'package:fullbooker/features/consumer/pages/consumer_home_page.dart'
    as _i5;
import 'package:fullbooker/features/consumer/pages/event_details_page.dart'
    as _i8;
import 'package:fullbooker/features/consumer/pages/old_gallery_page.dart'
    as _i17;
import 'package:fullbooker/features/consumer/pages/payment_confirmation_page.dart'
    as _i19;
import 'package:fullbooker/features/consumer/pages/payment_summary_page.dart'
    as _i20;
import 'package:fullbooker/features/host/models/old_product.dart' as _i45;
import 'package:fullbooker/features/host/pages/activity_date_selection_page.dart'
    as _i1;
import 'package:fullbooker/features/host/pages/event_category_page.dart' as _i7;
import 'package:fullbooker/features/host/pages/host_product_summary_page.dart'
    as _i11;
import 'package:fullbooker/features/host/pages/image_selection_page.dart'
    as _i15;
import 'package:fullbooker/features/host/pages/old_events_summary_page.dart'
    as _i9;
import 'package:fullbooker/presentation/host/home/pages/hosting_home_page.dart'
    as _i12;
import 'package:fullbooker/presentation/host/product_setup/pages/add_product_pricing_page.dart'
    as _i2;
import 'package:fullbooker/presentation/host/product_setup/pages/choose_location_page.dart'
    as _i4;
import 'package:fullbooker/presentation/host/product_setup/pages/product_basic_details_page.dart'
    as _i21;
import 'package:fullbooker/presentation/host/product_setup/pages/product_category_page.dart'
    as _i24;
import 'package:fullbooker/presentation/host/product_setup/pages/product_location_page.dart'
    as _i26;
import 'package:fullbooker/presentation/host/product_setup/pages/product_mode_of_access_page.dart'
    as _i27;
import 'package:fullbooker/presentation/host/product_setup/pages/product_photos_page.dart'
    as _i28;
import 'package:fullbooker/presentation/host/product_setup/pages/product_pricing_page.dart'
    as _i29;
import 'package:fullbooker/presentation/host/product_setup/pages/product_review_and_submit_page.dart'
    as _i30;
import 'package:fullbooker/presentation/host/product_setup/pages/product_schedule_page.dart'
    as _i31;
import 'package:fullbooker/presentation/host/product_setup/pages/product_setup_preview_page.dart'
    as _i32;
import 'package:fullbooker/presentation/host/product_setup/pages/product_sub_category_page.dart'
    as _i33;
import 'package:fullbooker/presentation/host/product_setup/pages/product_videos_page.dart'
    as _i34;
import 'package:fullbooker/presentation/host/products/pages/product_booking_details_page.dart'
    as _i22;
import 'package:fullbooker/presentation/host/products/pages/product_bookings_page.dart'
    as _i23;
import 'package:fullbooker/presentation/host/products/pages/product_detail_page.dart'
    as _i25;
import 'package:fullbooker/presentation/host/products/pages/products_page.dart'
    as _i35;
import 'package:fullbooker/presentation/host/products/pages/scan_tickets_page.dart'
    as _i38;
import 'package:fullbooker/presentation/onboarding/pages/change_password_page.dart'
    as _i3;
import 'package:fullbooker/presentation/onboarding/pages/create_account_page.dart'
    as _i6;
import 'package:fullbooker/presentation/onboarding/pages/login_page.dart'
    as _i16;
import 'package:fullbooker/presentation/onboarding/pages/request_otp_page.dart'
    as _i37;
import 'package:fullbooker/presentation/onboarding/pages/update_password_page.dart'
    as _i41;
import 'package:fullbooker/presentation/onboarding/pages/verify_otp_page.dart'
    as _i42;
import 'package:fullbooker/presentation/profile/pages/profile_page.dart'
    as _i36;
import 'package:fullbooker/presentation/shared/full_screen_video_player_page.dart'
    as _i10;
import 'package:fullbooker/presentation/shared/image_gallery_page.dart' as _i13;
import 'package:fullbooker/presentation/shared/image_preview_page.dart' as _i14;
import 'package:fullbooker/presentation/shared/terms_and_conditions_page.dart'
    as _i40;
import 'package:fullbooker/shared/entities/enums.dart' as _i47;
import 'package:fullbooker/shared/entities/ticket.dart' as _i48;
import 'package:fullbooker/shared/pages/overview_page.dart' as _i18;
import 'package:fullbooker/shared/pages/shared_landing_page.dart' as _i39;

/// generated route for
/// [_i1.ActivityDateSelectionPage]
class ActivityDateSelectionRoute
    extends _i43.PageRouteInfo<ActivityDateSelectionRouteArgs> {
  ActivityDateSelectionRoute({
    _i44.Key? key,
    required _i45.OldProduct product,
    required Map<String, Object?> location,
    List<_i43.PageRouteInfo>? children,
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

  static _i43.PageInfo page = _i43.PageInfo(
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

  final _i44.Key? key;

  final _i45.OldProduct product;

  final Map<String, Object?> location;

  @override
  String toString() {
    return 'ActivityDateSelectionRouteArgs{key: $key, product: $product, location: $location}';
  }
}

/// generated route for
/// [_i2.AddProductPricingPage]
class AddProductPricingRoute extends _i43.PageRouteInfo<void> {
  const AddProductPricingRoute({List<_i43.PageRouteInfo>? children})
    : super(AddProductPricingRoute.name, initialChildren: children);

  static const String name = 'AddProductPricingRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i2.AddProductPricingPage();
    },
  );
}

/// generated route for
/// [_i3.ChangePasswordPage]
class ChangePasswordRoute extends _i43.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i43.PageRouteInfo>? children})
    : super(ChangePasswordRoute.name, initialChildren: children);

  static const String name = 'ChangePasswordRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i3.ChangePasswordPage();
    },
  );
}

/// generated route for
/// [_i4.ChooseLocationPage]
class ChooseLocationRoute extends _i43.PageRouteInfo<void> {
  const ChooseLocationRoute({List<_i43.PageRouteInfo>? children})
    : super(ChooseLocationRoute.name, initialChildren: children);

  static const String name = 'ChooseLocationRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i4.ChooseLocationPage();
    },
  );
}

/// generated route for
/// [_i5.ConsumerHomePage]
class ConsumerHomeRoute extends _i43.PageRouteInfo<void> {
  const ConsumerHomeRoute({List<_i43.PageRouteInfo>? children})
    : super(ConsumerHomeRoute.name, initialChildren: children);

  static const String name = 'ConsumerHomeRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i5.ConsumerHomePage();
    },
  );
}

/// generated route for
/// [_i6.CreateAccountPage]
class CreateAccountRoute extends _i43.PageRouteInfo<void> {
  const CreateAccountRoute({List<_i43.PageRouteInfo>? children})
    : super(CreateAccountRoute.name, initialChildren: children);

  static const String name = 'CreateAccountRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i6.CreateAccountPage();
    },
  );
}

/// generated route for
/// [_i7.EventCategoryPage]
class EventCategoryRoute extends _i43.PageRouteInfo<EventCategoryRouteArgs> {
  EventCategoryRoute({
    _i44.Key? key,
    required _i45.OldProduct product,
    List<_i43.PageRouteInfo>? children,
  }) : super(
         EventCategoryRoute.name,
         args: EventCategoryRouteArgs(key: key, product: product),
         initialChildren: children,
       );

  static const String name = 'EventCategoryRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventCategoryRouteArgs>();
      return _i7.EventCategoryPage(key: args.key, product: args.product);
    },
  );
}

class EventCategoryRouteArgs {
  const EventCategoryRouteArgs({this.key, required this.product});

  final _i44.Key? key;

  final _i45.OldProduct product;

  @override
  String toString() {
    return 'EventCategoryRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i8.EventDetailsPage]
class EventDetailsRoute extends _i43.PageRouteInfo<EventDetailsRouteArgs> {
  EventDetailsRoute({
    _i46.Key? key,
    required _i45.OldProduct event,
    required String productLocationName,
    List<_i43.PageRouteInfo>? children,
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

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventDetailsRouteArgs>();
      return _i8.EventDetailsPage(
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

  final _i46.Key? key;

  final _i45.OldProduct event;

  final String productLocationName;

  @override
  String toString() {
    return 'EventDetailsRouteArgs{key: $key, event: $event, productLocationName: $productLocationName}';
  }
}

/// generated route for
/// [_i9.EventsSummaryPage]
class EventsSummaryRoute extends _i43.PageRouteInfo<void> {
  const EventsSummaryRoute({List<_i43.PageRouteInfo>? children})
    : super(EventsSummaryRoute.name, initialChildren: children);

  static const String name = 'EventsSummaryRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i9.EventsSummaryPage();
    },
  );
}

/// generated route for
/// [_i10.FullscreenVideoPlayerPage]
class FullscreenVideoPlayerRoute
    extends _i43.PageRouteInfo<FullscreenVideoPlayerRouteArgs> {
  FullscreenVideoPlayerRoute({
    _i44.Key? key,
    required String videoUrl,
    List<_i43.PageRouteInfo>? children,
  }) : super(
         FullscreenVideoPlayerRoute.name,
         args: FullscreenVideoPlayerRouteArgs(key: key, videoUrl: videoUrl),
         initialChildren: children,
       );

  static const String name = 'FullscreenVideoPlayerRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FullscreenVideoPlayerRouteArgs>();
      return _i10.FullscreenVideoPlayerPage(
        key: args.key,
        videoUrl: args.videoUrl,
      );
    },
  );
}

class FullscreenVideoPlayerRouteArgs {
  const FullscreenVideoPlayerRouteArgs({this.key, required this.videoUrl});

  final _i44.Key? key;

  final String videoUrl;

  @override
  String toString() {
    return 'FullscreenVideoPlayerRouteArgs{key: $key, videoUrl: $videoUrl}';
  }
}

/// generated route for
/// [_i11.HostProductSummaryPage]
class HostProductSummaryRoute
    extends _i43.PageRouteInfo<HostProductSummaryRouteArgs> {
  HostProductSummaryRoute({
    _i44.Key? key,
    required String host,
    List<_i43.PageRouteInfo>? children,
  }) : super(
         HostProductSummaryRoute.name,
         args: HostProductSummaryRouteArgs(key: key, host: host),
         initialChildren: children,
       );

  static const String name = 'HostProductSummaryRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HostProductSummaryRouteArgs>();
      return _i11.HostProductSummaryPage(key: args.key, host: args.host);
    },
  );
}

class HostProductSummaryRouteArgs {
  const HostProductSummaryRouteArgs({this.key, required this.host});

  final _i44.Key? key;

  final String host;

  @override
  String toString() {
    return 'HostProductSummaryRouteArgs{key: $key, host: $host}';
  }
}

/// generated route for
/// [_i12.HostingHomePage]
class HostingHomeRoute extends _i43.PageRouteInfo<void> {
  const HostingHomeRoute({List<_i43.PageRouteInfo>? children})
    : super(HostingHomeRoute.name, initialChildren: children);

  static const String name = 'HostingHomeRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i12.HostingHomePage();
    },
  );
}

/// generated route for
/// [_i13.ImageGalleryPage]
class ImageGalleryRoute extends _i43.PageRouteInfo<ImageGalleryRouteArgs> {
  ImageGalleryRoute({
    _i44.Key? key,
    required List<String> images,
    List<_i43.PageRouteInfo>? children,
  }) : super(
         ImageGalleryRoute.name,
         args: ImageGalleryRouteArgs(key: key, images: images),
         initialChildren: children,
       );

  static const String name = 'ImageGalleryRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ImageGalleryRouteArgs>();
      return _i13.ImageGalleryPage(key: args.key, images: args.images);
    },
  );
}

class ImageGalleryRouteArgs {
  const ImageGalleryRouteArgs({this.key, required this.images});

  final _i44.Key? key;

  final List<String> images;

  @override
  String toString() {
    return 'ImageGalleryRouteArgs{key: $key, images: $images}';
  }
}

/// generated route for
/// [_i14.ImagePreviewPage]
class ImagePreviewRoute extends _i43.PageRouteInfo<ImagePreviewRouteArgs> {
  ImagePreviewRoute({
    _i44.Key? key,
    required List<String?>? imageUrls,
    required String imageUrl,
    bool isOffline = false,
    List<_i43.PageRouteInfo>? children,
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

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ImagePreviewRouteArgs>();
      return _i14.ImagePreviewPage(
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

  final _i44.Key? key;

  final List<String?>? imageUrls;

  final String imageUrl;

  final bool isOffline;

  @override
  String toString() {
    return 'ImagePreviewRouteArgs{key: $key, imageUrls: $imageUrls, imageUrl: $imageUrl, isOffline: $isOffline}';
  }
}

/// generated route for
/// [_i15.ImageSelectionPage]
class ImageSelectionRoute extends _i43.PageRouteInfo<ImageSelectionRouteArgs> {
  ImageSelectionRoute({
    _i44.Key? key,
    required _i45.OldProduct product,
    _i47.ProductTypes type = _i47.ProductTypes.Event,
    List<_i43.PageRouteInfo>? children,
  }) : super(
         ImageSelectionRoute.name,
         args: ImageSelectionRouteArgs(key: key, product: product, type: type),
         initialChildren: children,
       );

  static const String name = 'ImageSelectionRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ImageSelectionRouteArgs>();
      return _i15.ImageSelectionPage(
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
    this.type = _i47.ProductTypes.Event,
  });

  final _i44.Key? key;

  final _i45.OldProduct product;

  final _i47.ProductTypes type;

  @override
  String toString() {
    return 'ImageSelectionRouteArgs{key: $key, product: $product, type: $type}';
  }
}

/// generated route for
/// [_i16.LoginPage]
class LoginRoute extends _i43.PageRouteInfo<void> {
  const LoginRoute({List<_i43.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i16.LoginPage();
    },
  );
}

/// generated route for
/// [_i17.OldGalleryPage]
class OldGalleryRoute extends _i43.PageRouteInfo<OldGalleryRouteArgs> {
  OldGalleryRoute({
    _i44.Key? key,
    required List<String> images,
    List<_i43.PageRouteInfo>? children,
  }) : super(
         OldGalleryRoute.name,
         args: OldGalleryRouteArgs(key: key, images: images),
         initialChildren: children,
       );

  static const String name = 'OldGalleryRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OldGalleryRouteArgs>();
      return _i17.OldGalleryPage(key: args.key, images: args.images);
    },
  );
}

class OldGalleryRouteArgs {
  const OldGalleryRouteArgs({this.key, required this.images});

  final _i44.Key? key;

  final List<String> images;

  @override
  String toString() {
    return 'OldGalleryRouteArgs{key: $key, images: $images}';
  }
}

/// generated route for
/// [_i18.OverviewPage]
class OverviewRoute extends _i43.PageRouteInfo<void> {
  const OverviewRoute({List<_i43.PageRouteInfo>? children})
    : super(OverviewRoute.name, initialChildren: children);

  static const String name = 'OverviewRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i18.OverviewPage();
    },
  );
}

/// generated route for
/// [_i19.PaymentConfirmationPage]
class PaymentConfirmationRoute
    extends _i43.PageRouteInfo<PaymentConfirmationRouteArgs> {
  PaymentConfirmationRoute({
    _i44.Key? key,
    required _i45.OldProduct product,
    required String locationName,
    required _i48.Ticket ticket,
    List<_i43.PageRouteInfo>? children,
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

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PaymentConfirmationRouteArgs>();
      return _i19.PaymentConfirmationPage(
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

  final _i44.Key? key;

  final _i45.OldProduct product;

  final String locationName;

  final _i48.Ticket ticket;

  @override
  String toString() {
    return 'PaymentConfirmationRouteArgs{key: $key, product: $product, locationName: $locationName, ticket: $ticket}';
  }
}

/// generated route for
/// [_i20.PaymentSummaryPage]
class PaymentSummaryRoute extends _i43.PageRouteInfo<PaymentSummaryRouteArgs> {
  PaymentSummaryRoute({
    _i44.Key? key,
    required _i45.OldProduct product,
    required String locationName,
    required List<_i48.Ticket> tickets,
    required DateTime selectedDateTime,
    List<_i43.PageRouteInfo>? children,
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

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PaymentSummaryRouteArgs>();
      return _i20.PaymentSummaryPage(
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

  final _i44.Key? key;

  final _i45.OldProduct product;

  final String locationName;

  final List<_i48.Ticket> tickets;

  final DateTime selectedDateTime;

  @override
  String toString() {
    return 'PaymentSummaryRouteArgs{key: $key, product: $product, locationName: $locationName, tickets: $tickets, selectedDateTime: $selectedDateTime}';
  }
}

/// generated route for
/// [_i21.ProductBasicDetailsPage]
class ProductBasicDetailsRoute extends _i43.PageRouteInfo<void> {
  const ProductBasicDetailsRoute({List<_i43.PageRouteInfo>? children})
    : super(ProductBasicDetailsRoute.name, initialChildren: children);

  static const String name = 'ProductBasicDetailsRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i21.ProductBasicDetailsPage();
    },
  );
}

/// generated route for
/// [_i22.ProductBookingDetailsPage]
class ProductBookingDetailsRoute extends _i43.PageRouteInfo<void> {
  const ProductBookingDetailsRoute({List<_i43.PageRouteInfo>? children})
    : super(ProductBookingDetailsRoute.name, initialChildren: children);

  static const String name = 'ProductBookingDetailsRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i22.ProductBookingDetailsPage();
    },
  );
}

/// generated route for
/// [_i23.ProductBookingsPage]
class ProductBookingsRoute extends _i43.PageRouteInfo<void> {
  const ProductBookingsRoute({List<_i43.PageRouteInfo>? children})
    : super(ProductBookingsRoute.name, initialChildren: children);

  static const String name = 'ProductBookingsRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i23.ProductBookingsPage();
    },
  );
}

/// generated route for
/// [_i24.ProductCategoryPage]
class ProductCategoryRoute extends _i43.PageRouteInfo<void> {
  const ProductCategoryRoute({List<_i43.PageRouteInfo>? children})
    : super(ProductCategoryRoute.name, initialChildren: children);

  static const String name = 'ProductCategoryRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i24.ProductCategoryPage();
    },
  );
}

/// generated route for
/// [_i25.ProductDetailPage]
class ProductDetailRoute extends _i43.PageRouteInfo<void> {
  const ProductDetailRoute({List<_i43.PageRouteInfo>? children})
    : super(ProductDetailRoute.name, initialChildren: children);

  static const String name = 'ProductDetailRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i25.ProductDetailPage();
    },
  );
}

/// generated route for
/// [_i26.ProductLocationPage]
class ProductLocationRoute extends _i43.PageRouteInfo<void> {
  const ProductLocationRoute({List<_i43.PageRouteInfo>? children})
    : super(ProductLocationRoute.name, initialChildren: children);

  static const String name = 'ProductLocationRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i26.ProductLocationPage();
    },
  );
}

/// generated route for
/// [_i27.ProductModeOfAccessPage]
class ProductModeOfAccessRoute extends _i43.PageRouteInfo<void> {
  const ProductModeOfAccessRoute({List<_i43.PageRouteInfo>? children})
    : super(ProductModeOfAccessRoute.name, initialChildren: children);

  static const String name = 'ProductModeOfAccessRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i27.ProductModeOfAccessPage();
    },
  );
}

/// generated route for
/// [_i28.ProductPhotosPage]
class ProductPhotosRoute extends _i43.PageRouteInfo<void> {
  const ProductPhotosRoute({List<_i43.PageRouteInfo>? children})
    : super(ProductPhotosRoute.name, initialChildren: children);

  static const String name = 'ProductPhotosRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i28.ProductPhotosPage();
    },
  );
}

/// generated route for
/// [_i29.ProductPricingPage]
class ProductPricingRoute extends _i43.PageRouteInfo<void> {
  const ProductPricingRoute({List<_i43.PageRouteInfo>? children})
    : super(ProductPricingRoute.name, initialChildren: children);

  static const String name = 'ProductPricingRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i29.ProductPricingPage();
    },
  );
}

/// generated route for
/// [_i30.ProductReviewAndSubmitPage]
class ProductReviewAndSubmitRoute extends _i43.PageRouteInfo<void> {
  const ProductReviewAndSubmitRoute({List<_i43.PageRouteInfo>? children})
    : super(ProductReviewAndSubmitRoute.name, initialChildren: children);

  static const String name = 'ProductReviewAndSubmitRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i30.ProductReviewAndSubmitPage();
    },
  );
}

/// generated route for
/// [_i31.ProductSchedulePage]
class ProductScheduleRoute extends _i43.PageRouteInfo<void> {
  const ProductScheduleRoute({List<_i43.PageRouteInfo>? children})
    : super(ProductScheduleRoute.name, initialChildren: children);

  static const String name = 'ProductScheduleRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i31.ProductSchedulePage();
    },
  );
}

/// generated route for
/// [_i32.ProductSetupPreviewPage]
class ProductSetupPreviewRoute extends _i43.PageRouteInfo<void> {
  const ProductSetupPreviewRoute({List<_i43.PageRouteInfo>? children})
    : super(ProductSetupPreviewRoute.name, initialChildren: children);

  static const String name = 'ProductSetupPreviewRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i32.ProductSetupPreviewPage();
    },
  );
}

/// generated route for
/// [_i33.ProductSubCategoryPage]
class ProductSubCategoryRoute extends _i43.PageRouteInfo<void> {
  const ProductSubCategoryRoute({List<_i43.PageRouteInfo>? children})
    : super(ProductSubCategoryRoute.name, initialChildren: children);

  static const String name = 'ProductSubCategoryRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i33.ProductSubCategoryPage();
    },
  );
}

/// generated route for
/// [_i34.ProductVideosPage]
class ProductVideosRoute extends _i43.PageRouteInfo<void> {
  const ProductVideosRoute({List<_i43.PageRouteInfo>? children})
    : super(ProductVideosRoute.name, initialChildren: children);

  static const String name = 'ProductVideosRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i34.ProductVideosPage();
    },
  );
}

/// generated route for
/// [_i35.ProductsPage]
class ProductsRoute extends _i43.PageRouteInfo<void> {
  const ProductsRoute({List<_i43.PageRouteInfo>? children})
    : super(ProductsRoute.name, initialChildren: children);

  static const String name = 'ProductsRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i35.ProductsPage();
    },
  );
}

/// generated route for
/// [_i36.ProfilePage]
class ProfileRoute extends _i43.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({_i44.Key? key, List<_i43.PageRouteInfo>? children})
    : super(
        ProfileRoute.name,
        args: ProfileRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'ProfileRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileRouteArgs>(
        orElse: () => const ProfileRouteArgs(),
      );
      return _i36.ProfilePage(key: args.key);
    },
  );
}

class ProfileRouteArgs {
  const ProfileRouteArgs({this.key});

  final _i44.Key? key;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i37.RequestOTPPage]
class RequestOTPRoute extends _i43.PageRouteInfo<void> {
  const RequestOTPRoute({List<_i43.PageRouteInfo>? children})
    : super(RequestOTPRoute.name, initialChildren: children);

  static const String name = 'RequestOTPRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i37.RequestOTPPage();
    },
  );
}

/// generated route for
/// [_i38.ScanTicketsPage]
class ScanTicketsRoute extends _i43.PageRouteInfo<void> {
  const ScanTicketsRoute({List<_i43.PageRouteInfo>? children})
    : super(ScanTicketsRoute.name, initialChildren: children);

  static const String name = 'ScanTicketsRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i38.ScanTicketsPage();
    },
  );
}

/// generated route for
/// [_i39.SharedLandingPage]
class SharedLandingRoute extends _i43.PageRouteInfo<void> {
  const SharedLandingRoute({List<_i43.PageRouteInfo>? children})
    : super(SharedLandingRoute.name, initialChildren: children);

  static const String name = 'SharedLandingRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i39.SharedLandingPage();
    },
  );
}

/// generated route for
/// [_i40.TermsAndConditionsPage]
class TermsAndConditionsRoute extends _i43.PageRouteInfo<void> {
  const TermsAndConditionsRoute({List<_i43.PageRouteInfo>? children})
    : super(TermsAndConditionsRoute.name, initialChildren: children);

  static const String name = 'TermsAndConditionsRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i40.TermsAndConditionsPage();
    },
  );
}

/// generated route for
/// [_i41.UpdatePasswordPage]
class UpdatePasswordRoute extends _i43.PageRouteInfo<void> {
  const UpdatePasswordRoute({List<_i43.PageRouteInfo>? children})
    : super(UpdatePasswordRoute.name, initialChildren: children);

  static const String name = 'UpdatePasswordRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i41.UpdatePasswordPage();
    },
  );
}

/// generated route for
/// [_i42.VerifyOTPPage]
class VerifyOTPRoute extends _i43.PageRouteInfo<void> {
  const VerifyOTPRoute({List<_i43.PageRouteInfo>? children})
    : super(VerifyOTPRoute.name, initialChildren: children);

  static const String name = 'VerifyOTPRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i42.VerifyOTPPage();
    },
  );
}
