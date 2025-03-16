// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i28;
import 'package:flutter/foundation.dart' as _i32;
import 'package:flutter/material.dart' as _i29;
import 'package:fullbooker/features/auth/pages/change_password_page.dart'
    as _i6;
import 'package:fullbooker/features/auth/pages/login_page.dart' as _i17;
import 'package:fullbooker/features/auth/pages/request_otp_page.dart' as _i22;
import 'package:fullbooker/features/auth/pages/sign_up_page.dart' as _i24;
import 'package:fullbooker/features/auth/pages/verify_otp_page.dart' as _i26;
import 'package:fullbooker/features/consumer/pages/consumer_landing_page.dart'
    as _i7;
import 'package:fullbooker/features/consumer/pages/event_details_page.dart'
    as _i10;
import 'package:fullbooker/features/consumer/pages/gallery_page.dart' as _i12;
import 'package:fullbooker/features/consumer/pages/image_preview_page.dart'
    as _i14;
import 'package:fullbooker/features/consumer/pages/payment_confirmation_page.dart'
    as _i19;
import 'package:fullbooker/features/consumer/pages/payment_summary_page.dart'
    as _i20;
import 'package:fullbooker/features/host/models/currency.dart' as _i36;
import 'package:fullbooker/features/host/models/product.dart' as _i30;
import 'package:fullbooker/features/host/models/sub_category_model.dart'
    as _i35;
import 'package:fullbooker/features/host/pages/activity_date_selection_page.dart'
    as _i1;
import 'package:fullbooker/features/host/pages/activity_day_pass_page.dart'
    as _i2;
import 'package:fullbooker/features/host/pages/activity_pricing_page.dart'
    as _i3;
import 'package:fullbooker/features/host/pages/activity_subscription_page.dart'
    as _i4;
import 'package:fullbooker/features/host/pages/category_selection_page.dart'
    as _i5;
import 'package:fullbooker/features/host/pages/date_selection_page.dart' as _i8;
import 'package:fullbooker/features/host/pages/event_category_page.dart' as _i9;
import 'package:fullbooker/features/host/pages/events_summary_page.dart'
    as _i11;
import 'package:fullbooker/features/host/pages/host_product_summary_page.dart'
    as _i13;
import 'package:fullbooker/features/host/pages/image_selection_page.dart'
    as _i15;
import 'package:fullbooker/features/host/pages/location_selection_page.dart'
    as _i16;
import 'package:fullbooker/features/host/pages/product_details_page.dart'
    as _i21;
import 'package:fullbooker/features/host/pages/tickets_summary_page.dart'
    as _i25;
import 'package:fullbooker/features/host/pages/video_selection_page.dart'
    as _i27;
import 'package:fullbooker/shared/entities/enums.dart' as _i33;
import 'package:fullbooker/shared/entities/session_pricing.dart' as _i31;
import 'package:fullbooker/shared/entities/ticket.dart' as _i34;
import 'package:fullbooker/shared/pages/overview_page.dart' as _i18;
import 'package:fullbooker/shared/pages/shared_landing_page.dart' as _i23;

/// generated route for
/// [_i1.ActivityDateSelectionPage]
class ActivityDateSelectionRoute
    extends _i28.PageRouteInfo<ActivityDateSelectionRouteArgs> {
  ActivityDateSelectionRoute({
    _i29.Key? key,
    required _i30.Product product,
    required Map<String, Object?> location,
    List<_i28.PageRouteInfo>? children,
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

  static _i28.PageInfo page = _i28.PageInfo(
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

  final _i29.Key? key;

  final _i30.Product product;

  final Map<String, Object?> location;

  @override
  String toString() {
    return 'ActivityDateSelectionRouteArgs{key: $key, product: $product, location: $location}';
  }
}

/// generated route for
/// [_i2.ActivityDayPassPage]
class ActivityDayPassRoute
    extends _i28.PageRouteInfo<ActivityDayPassRouteArgs> {
  ActivityDayPassRoute({
    _i29.Key? key,
    required _i30.Product product,
    required _i31.SessionPricing sessionPricing,
    List<_i28.PageRouteInfo>? children,
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

  static _i28.PageInfo page = _i28.PageInfo(
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

  final _i29.Key? key;

  final _i30.Product product;

  final _i31.SessionPricing sessionPricing;

  @override
  String toString() {
    return 'ActivityDayPassRouteArgs{key: $key, product: $product, sessionPricing: $sessionPricing}';
  }
}

/// generated route for
/// [_i3.ActivityPricingPage]
class ActivityPricingRoute
    extends _i28.PageRouteInfo<ActivityPricingRouteArgs> {
  ActivityPricingRoute({
    _i29.Key? key,
    required _i30.Product product,
    List<_i28.PageRouteInfo>? children,
  }) : super(
         ActivityPricingRoute.name,
         args: ActivityPricingRouteArgs(key: key, product: product),
         initialChildren: children,
       );

  static const String name = 'ActivityPricingRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ActivityPricingRouteArgs>();
      return _i3.ActivityPricingPage(key: args.key, product: args.product);
    },
  );
}

class ActivityPricingRouteArgs {
  const ActivityPricingRouteArgs({this.key, required this.product});

  final _i29.Key? key;

  final _i30.Product product;

  @override
  String toString() {
    return 'ActivityPricingRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i4.ActivitySubscriptionPage]
class ActivitySubscriptionRoute
    extends _i28.PageRouteInfo<ActivitySubscriptionRouteArgs> {
  ActivitySubscriptionRoute({
    _i29.Key? key,
    required _i30.Product product,
    required _i31.SessionPricing sessionPricing,
    _i31.SessionPricing? dayPassPricing,
    List<_i28.PageRouteInfo>? children,
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

  static _i28.PageInfo page = _i28.PageInfo(
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

  final _i29.Key? key;

  final _i30.Product product;

  final _i31.SessionPricing sessionPricing;

  final _i31.SessionPricing? dayPassPricing;

  @override
  String toString() {
    return 'ActivitySubscriptionRouteArgs{key: $key, product: $product, sessionPricing: $sessionPricing, dayPassPricing: $dayPassPricing}';
  }
}

/// generated route for
/// [_i5.CategorySelectionPage]
class CategorySelectionRoute extends _i28.PageRouteInfo<void> {
  const CategorySelectionRoute({List<_i28.PageRouteInfo>? children})
    : super(CategorySelectionRoute.name, initialChildren: children);

  static const String name = 'CategorySelectionRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i5.CategorySelectionPage();
    },
  );
}

/// generated route for
/// [_i6.ChangePasswordPage]
class ChangePasswordRoute extends _i28.PageRouteInfo<ChangePasswordRouteArgs> {
  ChangePasswordRoute({
    required String phoneNumber,
    _i29.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
         ChangePasswordRoute.name,
         args: ChangePasswordRouteArgs(phoneNumber: phoneNumber, key: key),
         initialChildren: children,
       );

  static const String name = 'ChangePasswordRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChangePasswordRouteArgs>();
      return _i6.ChangePasswordPage(args.phoneNumber, key: args.key);
    },
  );
}

class ChangePasswordRouteArgs {
  const ChangePasswordRouteArgs({required this.phoneNumber, this.key});

  final String phoneNumber;

  final _i29.Key? key;

  @override
  String toString() {
    return 'ChangePasswordRouteArgs{phoneNumber: $phoneNumber, key: $key}';
  }
}

/// generated route for
/// [_i7.ConsumerLandingPage]
class ConsumerLandingRoute extends _i28.PageRouteInfo<void> {
  const ConsumerLandingRoute({List<_i28.PageRouteInfo>? children})
    : super(ConsumerLandingRoute.name, initialChildren: children);

  static const String name = 'ConsumerLandingRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i7.ConsumerLandingPage();
    },
  );
}

/// generated route for
/// [_i8.DateSelectionPage]
class DateSelectionRoute extends _i28.PageRouteInfo<DateSelectionRouteArgs> {
  DateSelectionRoute({
    _i29.Key? key,
    required Map<String, Object?> location,
    required _i30.Product product,
    List<_i28.PageRouteInfo>? children,
  }) : super(
         DateSelectionRoute.name,
         args: DateSelectionRouteArgs(
           key: key,
           location: location,
           product: product,
         ),
         initialChildren: children,
       );

  static const String name = 'DateSelectionRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DateSelectionRouteArgs>();
      return _i8.DateSelectionPage(
        key: args.key,
        location: args.location,
        product: args.product,
      );
    },
  );
}

class DateSelectionRouteArgs {
  const DateSelectionRouteArgs({
    this.key,
    required this.location,
    required this.product,
  });

  final _i29.Key? key;

  final Map<String, Object?> location;

  final _i30.Product product;

  @override
  String toString() {
    return 'DateSelectionRouteArgs{key: $key, location: $location, product: $product}';
  }
}

/// generated route for
/// [_i9.EventCategoryPage]
class EventCategoryRoute extends _i28.PageRouteInfo<EventCategoryRouteArgs> {
  EventCategoryRoute({
    _i29.Key? key,
    required _i30.Product product,
    List<_i28.PageRouteInfo>? children,
  }) : super(
         EventCategoryRoute.name,
         args: EventCategoryRouteArgs(key: key, product: product),
         initialChildren: children,
       );

  static const String name = 'EventCategoryRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventCategoryRouteArgs>();
      return _i9.EventCategoryPage(key: args.key, product: args.product);
    },
  );
}

class EventCategoryRouteArgs {
  const EventCategoryRouteArgs({this.key, required this.product});

  final _i29.Key? key;

  final _i30.Product product;

  @override
  String toString() {
    return 'EventCategoryRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i10.EventDetailsPage]
class EventDetailsRoute extends _i28.PageRouteInfo<EventDetailsRouteArgs> {
  EventDetailsRoute({
    _i32.Key? key,
    required _i30.Product event,
    required String productLocationName,
    List<_i28.PageRouteInfo>? children,
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

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventDetailsRouteArgs>();
      return _i10.EventDetailsPage(
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

  final _i32.Key? key;

  final _i30.Product event;

  final String productLocationName;

  @override
  String toString() {
    return 'EventDetailsRouteArgs{key: $key, event: $event, productLocationName: $productLocationName}';
  }
}

/// generated route for
/// [_i11.EventsSummaryPage]
class EventsSummaryRoute extends _i28.PageRouteInfo<void> {
  const EventsSummaryRoute({List<_i28.PageRouteInfo>? children})
    : super(EventsSummaryRoute.name, initialChildren: children);

  static const String name = 'EventsSummaryRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i11.EventsSummaryPage();
    },
  );
}

/// generated route for
/// [_i12.GalleryPage]
class GalleryRoute extends _i28.PageRouteInfo<GalleryRouteArgs> {
  GalleryRoute({
    _i29.Key? key,
    required List<String> images,
    List<_i28.PageRouteInfo>? children,
  }) : super(
         GalleryRoute.name,
         args: GalleryRouteArgs(key: key, images: images),
         initialChildren: children,
       );

  static const String name = 'GalleryRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GalleryRouteArgs>();
      return _i12.GalleryPage(key: args.key, images: args.images);
    },
  );
}

class GalleryRouteArgs {
  const GalleryRouteArgs({this.key, required this.images});

  final _i29.Key? key;

  final List<String> images;

  @override
  String toString() {
    return 'GalleryRouteArgs{key: $key, images: $images}';
  }
}

/// generated route for
/// [_i13.HostProductSummaryPage]
class HostProductSummaryRoute
    extends _i28.PageRouteInfo<HostProductSummaryRouteArgs> {
  HostProductSummaryRoute({
    _i29.Key? key,
    required String host,
    List<_i28.PageRouteInfo>? children,
  }) : super(
         HostProductSummaryRoute.name,
         args: HostProductSummaryRouteArgs(key: key, host: host),
         initialChildren: children,
       );

  static const String name = 'HostProductSummaryRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HostProductSummaryRouteArgs>();
      return _i13.HostProductSummaryPage(key: args.key, host: args.host);
    },
  );
}

class HostProductSummaryRouteArgs {
  const HostProductSummaryRouteArgs({this.key, required this.host});

  final _i29.Key? key;

  final String host;

  @override
  String toString() {
    return 'HostProductSummaryRouteArgs{key: $key, host: $host}';
  }
}

/// generated route for
/// [_i14.ImagePreviewPage]
class ImagePreviewRoute extends _i28.PageRouteInfo<ImagePreviewRouteArgs> {
  ImagePreviewRoute({
    _i29.Key? key,
    required String imageUrl,
    List<_i28.PageRouteInfo>? children,
  }) : super(
         ImagePreviewRoute.name,
         args: ImagePreviewRouteArgs(key: key, imageUrl: imageUrl),
         initialChildren: children,
       );

  static const String name = 'ImagePreviewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ImagePreviewRouteArgs>();
      return _i14.ImagePreviewPage(key: args.key, imageUrl: args.imageUrl);
    },
  );
}

class ImagePreviewRouteArgs {
  const ImagePreviewRouteArgs({this.key, required this.imageUrl});

  final _i29.Key? key;

  final String imageUrl;

  @override
  String toString() {
    return 'ImagePreviewRouteArgs{key: $key, imageUrl: $imageUrl}';
  }
}

/// generated route for
/// [_i15.ImageSelectionPage]
class ImageSelectionRoute extends _i28.PageRouteInfo<ImageSelectionRouteArgs> {
  ImageSelectionRoute({
    _i29.Key? key,
    required _i30.Product product,
    _i33.ProductTypes type = _i33.ProductTypes.Event,
    List<_i28.PageRouteInfo>? children,
  }) : super(
         ImageSelectionRoute.name,
         args: ImageSelectionRouteArgs(key: key, product: product, type: type),
         initialChildren: children,
       );

  static const String name = 'ImageSelectionRoute';

  static _i28.PageInfo page = _i28.PageInfo(
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
    this.type = _i33.ProductTypes.Event,
  });

  final _i29.Key? key;

  final _i30.Product product;

  final _i33.ProductTypes type;

  @override
  String toString() {
    return 'ImageSelectionRouteArgs{key: $key, product: $product, type: $type}';
  }
}

/// generated route for
/// [_i16.LocationSelectionPage]
class LocationSelectionRoute
    extends _i28.PageRouteInfo<LocationSelectionRouteArgs> {
  LocationSelectionRoute({
    required _i30.Product product,
    _i29.Key? key,
    required _i33.ProductTypes productType,
    List<_i28.PageRouteInfo>? children,
  }) : super(
         LocationSelectionRoute.name,
         args: LocationSelectionRouteArgs(
           product: product,
           key: key,
           productType: productType,
         ),
         initialChildren: children,
       );

  static const String name = 'LocationSelectionRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LocationSelectionRouteArgs>();
      return _i16.LocationSelectionPage(
        args.product,
        key: args.key,
        productType: args.productType,
      );
    },
  );
}

class LocationSelectionRouteArgs {
  const LocationSelectionRouteArgs({
    required this.product,
    this.key,
    required this.productType,
  });

  final _i30.Product product;

  final _i29.Key? key;

  final _i33.ProductTypes productType;

  @override
  String toString() {
    return 'LocationSelectionRouteArgs{product: $product, key: $key, productType: $productType}';
  }
}

/// generated route for
/// [_i17.LoginPage]
class LoginRoute extends _i28.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i29.Key? key,
    bool goBackToOrigin = false,
    List<_i28.PageRouteInfo>? children,
  }) : super(
         LoginRoute.name,
         args: LoginRouteArgs(key: key, goBackToOrigin: goBackToOrigin),
         initialChildren: children,
       );

  static const String name = 'LoginRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return _i17.LoginPage(key: args.key, goBackToOrigin: args.goBackToOrigin);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, this.goBackToOrigin = false});

  final _i29.Key? key;

  final bool goBackToOrigin;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, goBackToOrigin: $goBackToOrigin}';
  }
}

/// generated route for
/// [_i18.OverviewPage]
class OverviewRoute extends _i28.PageRouteInfo<void> {
  const OverviewRoute({List<_i28.PageRouteInfo>? children})
    : super(OverviewRoute.name, initialChildren: children);

  static const String name = 'OverviewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i18.OverviewPage();
    },
  );
}

/// generated route for
/// [_i19.PaymentConfirmationPage]
class PaymentConfirmationRoute
    extends _i28.PageRouteInfo<PaymentConfirmationRouteArgs> {
  PaymentConfirmationRoute({
    _i29.Key? key,
    required _i30.Product product,
    required String locationName,
    required _i34.Ticket ticket,
    List<_i28.PageRouteInfo>? children,
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

  static _i28.PageInfo page = _i28.PageInfo(
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

  final _i29.Key? key;

  final _i30.Product product;

  final String locationName;

  final _i34.Ticket ticket;

  @override
  String toString() {
    return 'PaymentConfirmationRouteArgs{key: $key, product: $product, locationName: $locationName, ticket: $ticket}';
  }
}

/// generated route for
/// [_i20.PaymentSummaryPage]
class PaymentSummaryRoute extends _i28.PageRouteInfo<PaymentSummaryRouteArgs> {
  PaymentSummaryRoute({
    _i29.Key? key,
    required _i30.Product product,
    required String locationName,
    required List<_i34.Ticket> tickets,
    required DateTime selectedDateTime,
    List<_i28.PageRouteInfo>? children,
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

  static _i28.PageInfo page = _i28.PageInfo(
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

  final _i29.Key? key;

  final _i30.Product product;

  final String locationName;

  final List<_i34.Ticket> tickets;

  final DateTime selectedDateTime;

  @override
  String toString() {
    return 'PaymentSummaryRouteArgs{key: $key, product: $product, locationName: $locationName, tickets: $tickets, selectedDateTime: $selectedDateTime}';
  }
}

/// generated route for
/// [_i21.ProductDetailsPage]
class ProductDetailsRoute extends _i28.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    required _i35.SubCategory category,
    _i29.Key? key,
    required _i33.ProductTypes productType,
    List<_i28.PageRouteInfo>? children,
  }) : super(
         ProductDetailsRoute.name,
         args: ProductDetailsRouteArgs(
           category: category,
           key: key,
           productType: productType,
         ),
         initialChildren: children,
       );

  static const String name = 'ProductDetailsRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailsRouteArgs>();
      return _i21.ProductDetailsPage(
        args.category,
        key: args.key,
        productType: args.productType,
      );
    },
  );
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    required this.category,
    this.key,
    required this.productType,
  });

  final _i35.SubCategory category;

  final _i29.Key? key;

  final _i33.ProductTypes productType;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{category: $category, key: $key, productType: $productType}';
  }
}

/// generated route for
/// [_i22.RequestOTPPage]
class RequestOTPRoute extends _i28.PageRouteInfo<void> {
  const RequestOTPRoute({List<_i28.PageRouteInfo>? children})
    : super(RequestOTPRoute.name, initialChildren: children);

  static const String name = 'RequestOTPRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i22.RequestOTPPage();
    },
  );
}

/// generated route for
/// [_i23.SharedLandingPage]
class SharedLandingRoute extends _i28.PageRouteInfo<void> {
  const SharedLandingRoute({List<_i28.PageRouteInfo>? children})
    : super(SharedLandingRoute.name, initialChildren: children);

  static const String name = 'SharedLandingRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i23.SharedLandingPage();
    },
  );
}

/// generated route for
/// [_i24.SignUpPage]
class SignUpRoute extends _i28.PageRouteInfo<void> {
  const SignUpRoute({List<_i28.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i24.SignUpPage();
    },
  );
}

/// generated route for
/// [_i25.TicketsSummaryPage]
class TicketsSummaryRoute extends _i28.PageRouteInfo<TicketsSummaryRouteArgs> {
  TicketsSummaryRoute({
    _i29.Key? key,
    required _i30.Product product,
    required Map<String, double> prices,
    required Map<String, int> amounts,
    required _i36.Currency currency,
    required List<String> selectedCategories,
    List<_i28.PageRouteInfo>? children,
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

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TicketsSummaryRouteArgs>();
      return _i25.TicketsSummaryPage(
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

  final _i29.Key? key;

  final _i30.Product product;

  final Map<String, double> prices;

  final Map<String, int> amounts;

  final _i36.Currency currency;

  final List<String> selectedCategories;

  @override
  String toString() {
    return 'TicketsSummaryRouteArgs{key: $key, product: $product, prices: $prices, amounts: $amounts, currency: $currency, selectedCategories: $selectedCategories}';
  }
}

/// generated route for
/// [_i26.VerifyOTPPage]
class VerifyOTPRoute extends _i28.PageRouteInfo<VerifyOTPRouteArgs> {
  VerifyOTPRoute({
    required String phoneNumber,
    _i29.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
         VerifyOTPRoute.name,
         args: VerifyOTPRouteArgs(phoneNumber: phoneNumber, key: key),
         initialChildren: children,
       );

  static const String name = 'VerifyOTPRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerifyOTPRouteArgs>();
      return _i26.VerifyOTPPage(args.phoneNumber, key: args.key);
    },
  );
}

class VerifyOTPRouteArgs {
  const VerifyOTPRouteArgs({required this.phoneNumber, this.key});

  final String phoneNumber;

  final _i29.Key? key;

  @override
  String toString() {
    return 'VerifyOTPRouteArgs{phoneNumber: $phoneNumber, key: $key}';
  }
}

/// generated route for
/// [_i27.VideoSelectionPage]
class VideoSelectionRoute extends _i28.PageRouteInfo<VideoSelectionRouteArgs> {
  VideoSelectionRoute({
    _i29.Key? key,
    required _i30.Product product,
    required _i33.ProductTypes type,
    List<_i28.PageRouteInfo>? children,
  }) : super(
         VideoSelectionRoute.name,
         args: VideoSelectionRouteArgs(key: key, product: product, type: type),
         initialChildren: children,
       );

  static const String name = 'VideoSelectionRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VideoSelectionRouteArgs>();
      return _i27.VideoSelectionPage(
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

  final _i29.Key? key;

  final _i30.Product product;

  final _i33.ProductTypes type;

  @override
  String toString() {
    return 'VideoSelectionRouteArgs{key: $key, product: $product, type: $type}';
  }
}
