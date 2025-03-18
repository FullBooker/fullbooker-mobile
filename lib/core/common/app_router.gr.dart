// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i29;
import 'package:flutter/foundation.dart' as _i33;
import 'package:flutter/material.dart' as _i30;
import 'package:fullbooker/features/auth/pages/change_password_page.dart'
    as _i6;
import 'package:fullbooker/features/auth/pages/login_page.dart' as _i18;
import 'package:fullbooker/features/auth/pages/request_otp_page.dart' as _i23;
import 'package:fullbooker/features/auth/pages/sign_up_page.dart' as _i25;
import 'package:fullbooker/features/auth/pages/verify_otp_page.dart' as _i27;
import 'package:fullbooker/features/consumer/pages/consumer_home_page.dart'
    as _i7;
import 'package:fullbooker/features/consumer/pages/event_details_page.dart'
    as _i10;
import 'package:fullbooker/features/consumer/pages/gallery_page.dart' as _i12;
import 'package:fullbooker/features/consumer/pages/image_preview_page.dart'
    as _i15;
import 'package:fullbooker/features/consumer/pages/payment_confirmation_page.dart'
    as _i20;
import 'package:fullbooker/features/consumer/pages/payment_summary_page.dart'
    as _i21;
import 'package:fullbooker/features/host/models/currency.dart' as _i37;
import 'package:fullbooker/features/host/models/product.dart' as _i31;
import 'package:fullbooker/features/host/models/sub_category_model.dart'
    as _i36;
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
import 'package:fullbooker/features/host/pages/host_product_summary_page.dart'
    as _i13;
import 'package:fullbooker/features/host/pages/hosting_home_page.dart' as _i14;
import 'package:fullbooker/features/host/pages/image_selection_page.dart'
    as _i16;
import 'package:fullbooker/features/host/pages/location_selection_page.dart'
    as _i17;
import 'package:fullbooker/features/host/pages/old_events_summary_page.dart'
    as _i11;
import 'package:fullbooker/features/host/pages/product_details_page.dart'
    as _i22;
import 'package:fullbooker/features/host/pages/tickets_summary_page.dart'
    as _i26;
import 'package:fullbooker/features/host/pages/video_selection_page.dart'
    as _i28;
import 'package:fullbooker/shared/entities/enums.dart' as _i34;
import 'package:fullbooker/shared/entities/session_pricing.dart' as _i32;
import 'package:fullbooker/shared/entities/ticket.dart' as _i35;
import 'package:fullbooker/shared/pages/overview_page.dart' as _i19;
import 'package:fullbooker/shared/pages/shared_landing_page.dart' as _i24;

/// generated route for
/// [_i1.ActivityDateSelectionPage]
class ActivityDateSelectionRoute
    extends _i29.PageRouteInfo<ActivityDateSelectionRouteArgs> {
  ActivityDateSelectionRoute({
    _i30.Key? key,
    required _i31.Product product,
    required Map<String, Object?> location,
    List<_i29.PageRouteInfo>? children,
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

  static _i29.PageInfo page = _i29.PageInfo(
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

  final _i30.Key? key;

  final _i31.Product product;

  final Map<String, Object?> location;

  @override
  String toString() {
    return 'ActivityDateSelectionRouteArgs{key: $key, product: $product, location: $location}';
  }
}

/// generated route for
/// [_i2.ActivityDayPassPage]
class ActivityDayPassRoute
    extends _i29.PageRouteInfo<ActivityDayPassRouteArgs> {
  ActivityDayPassRoute({
    _i30.Key? key,
    required _i31.Product product,
    required _i32.SessionPricing sessionPricing,
    List<_i29.PageRouteInfo>? children,
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

  static _i29.PageInfo page = _i29.PageInfo(
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

  final _i30.Key? key;

  final _i31.Product product;

  final _i32.SessionPricing sessionPricing;

  @override
  String toString() {
    return 'ActivityDayPassRouteArgs{key: $key, product: $product, sessionPricing: $sessionPricing}';
  }
}

/// generated route for
/// [_i3.ActivityPricingPage]
class ActivityPricingRoute
    extends _i29.PageRouteInfo<ActivityPricingRouteArgs> {
  ActivityPricingRoute({
    _i30.Key? key,
    required _i31.Product product,
    List<_i29.PageRouteInfo>? children,
  }) : super(
         ActivityPricingRoute.name,
         args: ActivityPricingRouteArgs(key: key, product: product),
         initialChildren: children,
       );

  static const String name = 'ActivityPricingRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ActivityPricingRouteArgs>();
      return _i3.ActivityPricingPage(key: args.key, product: args.product);
    },
  );
}

class ActivityPricingRouteArgs {
  const ActivityPricingRouteArgs({this.key, required this.product});

  final _i30.Key? key;

  final _i31.Product product;

  @override
  String toString() {
    return 'ActivityPricingRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i4.ActivitySubscriptionPage]
class ActivitySubscriptionRoute
    extends _i29.PageRouteInfo<ActivitySubscriptionRouteArgs> {
  ActivitySubscriptionRoute({
    _i30.Key? key,
    required _i31.Product product,
    required _i32.SessionPricing sessionPricing,
    _i32.SessionPricing? dayPassPricing,
    List<_i29.PageRouteInfo>? children,
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

  static _i29.PageInfo page = _i29.PageInfo(
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

  final _i30.Key? key;

  final _i31.Product product;

  final _i32.SessionPricing sessionPricing;

  final _i32.SessionPricing? dayPassPricing;

  @override
  String toString() {
    return 'ActivitySubscriptionRouteArgs{key: $key, product: $product, sessionPricing: $sessionPricing, dayPassPricing: $dayPassPricing}';
  }
}

/// generated route for
/// [_i5.CategorySelectionPage]
class CategorySelectionRoute extends _i29.PageRouteInfo<void> {
  const CategorySelectionRoute({List<_i29.PageRouteInfo>? children})
    : super(CategorySelectionRoute.name, initialChildren: children);

  static const String name = 'CategorySelectionRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i5.CategorySelectionPage();
    },
  );
}

/// generated route for
/// [_i6.ChangePasswordPage]
class ChangePasswordRoute extends _i29.PageRouteInfo<ChangePasswordRouteArgs> {
  ChangePasswordRoute({
    required String phoneNumber,
    _i30.Key? key,
    List<_i29.PageRouteInfo>? children,
  }) : super(
         ChangePasswordRoute.name,
         args: ChangePasswordRouteArgs(phoneNumber: phoneNumber, key: key),
         initialChildren: children,
       );

  static const String name = 'ChangePasswordRoute';

  static _i29.PageInfo page = _i29.PageInfo(
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

  final _i30.Key? key;

  @override
  String toString() {
    return 'ChangePasswordRouteArgs{phoneNumber: $phoneNumber, key: $key}';
  }
}

/// generated route for
/// [_i7.ConsumerHomePage]
class ConsumerHomeRoute extends _i29.PageRouteInfo<void> {
  const ConsumerHomeRoute({List<_i29.PageRouteInfo>? children})
    : super(ConsumerHomeRoute.name, initialChildren: children);

  static const String name = 'ConsumerHomeRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i7.ConsumerHomePage();
    },
  );
}

/// generated route for
/// [_i8.DateSelectionPage]
class DateSelectionRoute extends _i29.PageRouteInfo<DateSelectionRouteArgs> {
  DateSelectionRoute({
    _i30.Key? key,
    required Map<String, Object?> location,
    required _i31.Product product,
    List<_i29.PageRouteInfo>? children,
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

  static _i29.PageInfo page = _i29.PageInfo(
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

  final _i30.Key? key;

  final Map<String, Object?> location;

  final _i31.Product product;

  @override
  String toString() {
    return 'DateSelectionRouteArgs{key: $key, location: $location, product: $product}';
  }
}

/// generated route for
/// [_i9.EventCategoryPage]
class EventCategoryRoute extends _i29.PageRouteInfo<EventCategoryRouteArgs> {
  EventCategoryRoute({
    _i30.Key? key,
    required _i31.Product product,
    List<_i29.PageRouteInfo>? children,
  }) : super(
         EventCategoryRoute.name,
         args: EventCategoryRouteArgs(key: key, product: product),
         initialChildren: children,
       );

  static const String name = 'EventCategoryRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventCategoryRouteArgs>();
      return _i9.EventCategoryPage(key: args.key, product: args.product);
    },
  );
}

class EventCategoryRouteArgs {
  const EventCategoryRouteArgs({this.key, required this.product});

  final _i30.Key? key;

  final _i31.Product product;

  @override
  String toString() {
    return 'EventCategoryRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i10.EventDetailsPage]
class EventDetailsRoute extends _i29.PageRouteInfo<EventDetailsRouteArgs> {
  EventDetailsRoute({
    _i33.Key? key,
    required _i31.Product event,
    required String productLocationName,
    List<_i29.PageRouteInfo>? children,
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

  static _i29.PageInfo page = _i29.PageInfo(
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

  final _i33.Key? key;

  final _i31.Product event;

  final String productLocationName;

  @override
  String toString() {
    return 'EventDetailsRouteArgs{key: $key, event: $event, productLocationName: $productLocationName}';
  }
}

/// generated route for
/// [_i11.EventsSummaryPage]
class EventsSummaryRoute extends _i29.PageRouteInfo<void> {
  const EventsSummaryRoute({List<_i29.PageRouteInfo>? children})
    : super(EventsSummaryRoute.name, initialChildren: children);

  static const String name = 'EventsSummaryRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i11.EventsSummaryPage();
    },
  );
}

/// generated route for
/// [_i12.GalleryPage]
class GalleryRoute extends _i29.PageRouteInfo<GalleryRouteArgs> {
  GalleryRoute({
    _i30.Key? key,
    required List<String> images,
    List<_i29.PageRouteInfo>? children,
  }) : super(
         GalleryRoute.name,
         args: GalleryRouteArgs(key: key, images: images),
         initialChildren: children,
       );

  static const String name = 'GalleryRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GalleryRouteArgs>();
      return _i12.GalleryPage(key: args.key, images: args.images);
    },
  );
}

class GalleryRouteArgs {
  const GalleryRouteArgs({this.key, required this.images});

  final _i30.Key? key;

  final List<String> images;

  @override
  String toString() {
    return 'GalleryRouteArgs{key: $key, images: $images}';
  }
}

/// generated route for
/// [_i13.HostProductSummaryPage]
class HostProductSummaryRoute
    extends _i29.PageRouteInfo<HostProductSummaryRouteArgs> {
  HostProductSummaryRoute({
    _i30.Key? key,
    required String host,
    List<_i29.PageRouteInfo>? children,
  }) : super(
         HostProductSummaryRoute.name,
         args: HostProductSummaryRouteArgs(key: key, host: host),
         initialChildren: children,
       );

  static const String name = 'HostProductSummaryRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HostProductSummaryRouteArgs>();
      return _i13.HostProductSummaryPage(key: args.key, host: args.host);
    },
  );
}

class HostProductSummaryRouteArgs {
  const HostProductSummaryRouteArgs({this.key, required this.host});

  final _i30.Key? key;

  final String host;

  @override
  String toString() {
    return 'HostProductSummaryRouteArgs{key: $key, host: $host}';
  }
}

/// generated route for
/// [_i14.HostingHomePage]
class HostingHomeRoute extends _i29.PageRouteInfo<void> {
  const HostingHomeRoute({List<_i29.PageRouteInfo>? children})
    : super(HostingHomeRoute.name, initialChildren: children);

  static const String name = 'HostingHomeRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i14.HostingHomePage();
    },
  );
}

/// generated route for
/// [_i15.ImagePreviewPage]
class ImagePreviewRoute extends _i29.PageRouteInfo<ImagePreviewRouteArgs> {
  ImagePreviewRoute({
    _i30.Key? key,
    required String imageUrl,
    List<_i29.PageRouteInfo>? children,
  }) : super(
         ImagePreviewRoute.name,
         args: ImagePreviewRouteArgs(key: key, imageUrl: imageUrl),
         initialChildren: children,
       );

  static const String name = 'ImagePreviewRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ImagePreviewRouteArgs>();
      return _i15.ImagePreviewPage(key: args.key, imageUrl: args.imageUrl);
    },
  );
}

class ImagePreviewRouteArgs {
  const ImagePreviewRouteArgs({this.key, required this.imageUrl});

  final _i30.Key? key;

  final String imageUrl;

  @override
  String toString() {
    return 'ImagePreviewRouteArgs{key: $key, imageUrl: $imageUrl}';
  }
}

/// generated route for
/// [_i16.ImageSelectionPage]
class ImageSelectionRoute extends _i29.PageRouteInfo<ImageSelectionRouteArgs> {
  ImageSelectionRoute({
    _i30.Key? key,
    required _i31.Product product,
    _i34.ProductTypes type = _i34.ProductTypes.Event,
    List<_i29.PageRouteInfo>? children,
  }) : super(
         ImageSelectionRoute.name,
         args: ImageSelectionRouteArgs(key: key, product: product, type: type),
         initialChildren: children,
       );

  static const String name = 'ImageSelectionRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ImageSelectionRouteArgs>();
      return _i16.ImageSelectionPage(
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
    this.type = _i34.ProductTypes.Event,
  });

  final _i30.Key? key;

  final _i31.Product product;

  final _i34.ProductTypes type;

  @override
  String toString() {
    return 'ImageSelectionRouteArgs{key: $key, product: $product, type: $type}';
  }
}

/// generated route for
/// [_i17.LocationSelectionPage]
class LocationSelectionRoute
    extends _i29.PageRouteInfo<LocationSelectionRouteArgs> {
  LocationSelectionRoute({
    required _i31.Product product,
    _i30.Key? key,
    required _i34.ProductTypes productType,
    List<_i29.PageRouteInfo>? children,
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

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LocationSelectionRouteArgs>();
      return _i17.LocationSelectionPage(
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

  final _i31.Product product;

  final _i30.Key? key;

  final _i34.ProductTypes productType;

  @override
  String toString() {
    return 'LocationSelectionRouteArgs{product: $product, key: $key, productType: $productType}';
  }
}

/// generated route for
/// [_i18.LoginPage]
class LoginRoute extends _i29.PageRouteInfo<void> {
  const LoginRoute({List<_i29.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i18.LoginPage();
    },
  );
}

/// generated route for
/// [_i19.OverviewPage]
class OverviewRoute extends _i29.PageRouteInfo<void> {
  const OverviewRoute({List<_i29.PageRouteInfo>? children})
    : super(OverviewRoute.name, initialChildren: children);

  static const String name = 'OverviewRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i19.OverviewPage();
    },
  );
}

/// generated route for
/// [_i20.PaymentConfirmationPage]
class PaymentConfirmationRoute
    extends _i29.PageRouteInfo<PaymentConfirmationRouteArgs> {
  PaymentConfirmationRoute({
    _i30.Key? key,
    required _i31.Product product,
    required String locationName,
    required _i35.Ticket ticket,
    List<_i29.PageRouteInfo>? children,
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

  static _i29.PageInfo page = _i29.PageInfo(
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

  final _i30.Key? key;

  final _i31.Product product;

  final String locationName;

  final _i35.Ticket ticket;

  @override
  String toString() {
    return 'PaymentConfirmationRouteArgs{key: $key, product: $product, locationName: $locationName, ticket: $ticket}';
  }
}

/// generated route for
/// [_i21.PaymentSummaryPage]
class PaymentSummaryRoute extends _i29.PageRouteInfo<PaymentSummaryRouteArgs> {
  PaymentSummaryRoute({
    _i30.Key? key,
    required _i31.Product product,
    required String locationName,
    required List<_i35.Ticket> tickets,
    required DateTime selectedDateTime,
    List<_i29.PageRouteInfo>? children,
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

  static _i29.PageInfo page = _i29.PageInfo(
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

  final _i30.Key? key;

  final _i31.Product product;

  final String locationName;

  final List<_i35.Ticket> tickets;

  final DateTime selectedDateTime;

  @override
  String toString() {
    return 'PaymentSummaryRouteArgs{key: $key, product: $product, locationName: $locationName, tickets: $tickets, selectedDateTime: $selectedDateTime}';
  }
}

/// generated route for
/// [_i22.ProductDetailsPage]
class ProductDetailsRoute extends _i29.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    required _i36.SubCategory category,
    _i30.Key? key,
    required _i34.ProductTypes productType,
    List<_i29.PageRouteInfo>? children,
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

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailsRouteArgs>();
      return _i22.ProductDetailsPage(
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

  final _i36.SubCategory category;

  final _i30.Key? key;

  final _i34.ProductTypes productType;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{category: $category, key: $key, productType: $productType}';
  }
}

/// generated route for
/// [_i23.RequestOTPPage]
class RequestOTPRoute extends _i29.PageRouteInfo<void> {
  const RequestOTPRoute({List<_i29.PageRouteInfo>? children})
    : super(RequestOTPRoute.name, initialChildren: children);

  static const String name = 'RequestOTPRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i23.RequestOTPPage();
    },
  );
}

/// generated route for
/// [_i24.SharedLandingPage]
class SharedLandingRoute extends _i29.PageRouteInfo<void> {
  const SharedLandingRoute({List<_i29.PageRouteInfo>? children})
    : super(SharedLandingRoute.name, initialChildren: children);

  static const String name = 'SharedLandingRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i24.SharedLandingPage();
    },
  );
}

/// generated route for
/// [_i25.SignUpPage]
class SignUpRoute extends _i29.PageRouteInfo<void> {
  const SignUpRoute({List<_i29.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i25.SignUpPage();
    },
  );
}

/// generated route for
/// [_i26.TicketsSummaryPage]
class TicketsSummaryRoute extends _i29.PageRouteInfo<TicketsSummaryRouteArgs> {
  TicketsSummaryRoute({
    _i30.Key? key,
    required _i31.Product product,
    required Map<String, double> prices,
    required Map<String, int> amounts,
    required _i37.Currency currency,
    required List<String> selectedCategories,
    List<_i29.PageRouteInfo>? children,
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

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TicketsSummaryRouteArgs>();
      return _i26.TicketsSummaryPage(
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

  final _i30.Key? key;

  final _i31.Product product;

  final Map<String, double> prices;

  final Map<String, int> amounts;

  final _i37.Currency currency;

  final List<String> selectedCategories;

  @override
  String toString() {
    return 'TicketsSummaryRouteArgs{key: $key, product: $product, prices: $prices, amounts: $amounts, currency: $currency, selectedCategories: $selectedCategories}';
  }
}

/// generated route for
/// [_i27.VerifyOTPPage]
class VerifyOTPRoute extends _i29.PageRouteInfo<VerifyOTPRouteArgs> {
  VerifyOTPRoute({
    required String phoneNumber,
    _i30.Key? key,
    List<_i29.PageRouteInfo>? children,
  }) : super(
         VerifyOTPRoute.name,
         args: VerifyOTPRouteArgs(phoneNumber: phoneNumber, key: key),
         initialChildren: children,
       );

  static const String name = 'VerifyOTPRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerifyOTPRouteArgs>();
      return _i27.VerifyOTPPage(args.phoneNumber, key: args.key);
    },
  );
}

class VerifyOTPRouteArgs {
  const VerifyOTPRouteArgs({required this.phoneNumber, this.key});

  final String phoneNumber;

  final _i30.Key? key;

  @override
  String toString() {
    return 'VerifyOTPRouteArgs{phoneNumber: $phoneNumber, key: $key}';
  }
}

/// generated route for
/// [_i28.VideoSelectionPage]
class VideoSelectionRoute extends _i29.PageRouteInfo<VideoSelectionRouteArgs> {
  VideoSelectionRoute({
    _i30.Key? key,
    required _i31.Product product,
    required _i34.ProductTypes type,
    List<_i29.PageRouteInfo>? children,
  }) : super(
         VideoSelectionRoute.name,
         args: VideoSelectionRouteArgs(key: key, product: product, type: type),
         initialChildren: children,
       );

  static const String name = 'VideoSelectionRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VideoSelectionRouteArgs>();
      return _i28.VideoSelectionPage(
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

  final _i30.Key? key;

  final _i31.Product product;

  final _i34.ProductTypes type;

  @override
  String toString() {
    return 'VideoSelectionRouteArgs{key: $key, product: $product, type: $type}';
  }
}
