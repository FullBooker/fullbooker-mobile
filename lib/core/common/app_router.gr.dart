// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i27;
import 'package:flutter/foundation.dart' as _i31;
import 'package:flutter/material.dart' as _i28;
import 'package:fullbooker/features/auth/pages/change_password_page.dart'
    as _i6;
import 'package:fullbooker/features/auth/pages/login_page.dart' as _i16;
import 'package:fullbooker/features/auth/pages/request_otp_page.dart' as _i21;
import 'package:fullbooker/features/auth/pages/sign_up_page.dart' as _i23;
import 'package:fullbooker/features/auth/pages/verify_otp_page.dart' as _i25;
import 'package:fullbooker/features/consumer/pages/consumer_landing_page.dart'
    as _i7;
import 'package:fullbooker/features/consumer/pages/event_details_page.dart'
    as _i10;
import 'package:fullbooker/features/consumer/pages/image_preview_page.dart'
    as _i13;
import 'package:fullbooker/features/consumer/pages/payment_confirmation_page.dart'
    as _i18;
import 'package:fullbooker/features/consumer/pages/payment_summary_page.dart'
    as _i19;
import 'package:fullbooker/features/host/models/currency.dart' as _i35;
import 'package:fullbooker/features/host/models/product.dart' as _i29;
import 'package:fullbooker/features/host/models/sub_category_model.dart'
    as _i34;
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
    as _i12;
import 'package:fullbooker/features/host/pages/image_selection_page.dart'
    as _i14;
import 'package:fullbooker/features/host/pages/location_selection_page.dart'
    as _i15;
import 'package:fullbooker/features/host/pages/product_details_page.dart'
    as _i20;
import 'package:fullbooker/features/host/pages/tickets_summary_page.dart'
    as _i24;
import 'package:fullbooker/features/host/pages/video_selection_page.dart'
    as _i26;
import 'package:fullbooker/shared/entities/enums.dart' as _i32;
import 'package:fullbooker/shared/entities/session_pricing.dart' as _i30;
import 'package:fullbooker/shared/entities/ticket.dart' as _i33;
import 'package:fullbooker/shared/pages/overview_page.dart' as _i17;
import 'package:fullbooker/shared/pages/shared_landing_page.dart' as _i22;

/// generated route for
/// [_i1.ActivityDateSelectionPage]
class ActivityDateSelectionRoute
    extends _i27.PageRouteInfo<ActivityDateSelectionRouteArgs> {
  ActivityDateSelectionRoute({
    _i28.Key? key,
    required _i29.Product product,
    required Map<String, Object?> location,
    List<_i27.PageRouteInfo>? children,
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

  static _i27.PageInfo page = _i27.PageInfo(
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

  final _i28.Key? key;

  final _i29.Product product;

  final Map<String, Object?> location;

  @override
  String toString() {
    return 'ActivityDateSelectionRouteArgs{key: $key, product: $product, location: $location}';
  }
}

/// generated route for
/// [_i2.ActivityDayPassPage]
class ActivityDayPassRoute
    extends _i27.PageRouteInfo<ActivityDayPassRouteArgs> {
  ActivityDayPassRoute({
    _i28.Key? key,
    required _i29.Product product,
    required _i30.SessionPricing sessionPricing,
    List<_i27.PageRouteInfo>? children,
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

  static _i27.PageInfo page = _i27.PageInfo(
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

  final _i28.Key? key;

  final _i29.Product product;

  final _i30.SessionPricing sessionPricing;

  @override
  String toString() {
    return 'ActivityDayPassRouteArgs{key: $key, product: $product, sessionPricing: $sessionPricing}';
  }
}

/// generated route for
/// [_i3.ActivityPricingPage]
class ActivityPricingRoute
    extends _i27.PageRouteInfo<ActivityPricingRouteArgs> {
  ActivityPricingRoute({
    _i28.Key? key,
    required _i29.Product product,
    List<_i27.PageRouteInfo>? children,
  }) : super(
         ActivityPricingRoute.name,
         args: ActivityPricingRouteArgs(key: key, product: product),
         initialChildren: children,
       );

  static const String name = 'ActivityPricingRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ActivityPricingRouteArgs>();
      return _i3.ActivityPricingPage(key: args.key, product: args.product);
    },
  );
}

class ActivityPricingRouteArgs {
  const ActivityPricingRouteArgs({this.key, required this.product});

  final _i28.Key? key;

  final _i29.Product product;

  @override
  String toString() {
    return 'ActivityPricingRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i4.ActivitySubscriptionPage]
class ActivitySubscriptionRoute
    extends _i27.PageRouteInfo<ActivitySubscriptionRouteArgs> {
  ActivitySubscriptionRoute({
    _i28.Key? key,
    required _i29.Product product,
    required _i30.SessionPricing sessionPricing,
    _i30.SessionPricing? dayPassPricing,
    List<_i27.PageRouteInfo>? children,
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

  static _i27.PageInfo page = _i27.PageInfo(
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

  final _i28.Key? key;

  final _i29.Product product;

  final _i30.SessionPricing sessionPricing;

  final _i30.SessionPricing? dayPassPricing;

  @override
  String toString() {
    return 'ActivitySubscriptionRouteArgs{key: $key, product: $product, sessionPricing: $sessionPricing, dayPassPricing: $dayPassPricing}';
  }
}

/// generated route for
/// [_i5.CategorySelectionPage]
class CategorySelectionRoute extends _i27.PageRouteInfo<void> {
  const CategorySelectionRoute({List<_i27.PageRouteInfo>? children})
    : super(CategorySelectionRoute.name, initialChildren: children);

  static const String name = 'CategorySelectionRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i5.CategorySelectionPage();
    },
  );
}

/// generated route for
/// [_i6.ChangePasswordPage]
class ChangePasswordRoute extends _i27.PageRouteInfo<ChangePasswordRouteArgs> {
  ChangePasswordRoute({
    required String phoneNumber,
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
         ChangePasswordRoute.name,
         args: ChangePasswordRouteArgs(phoneNumber: phoneNumber, key: key),
         initialChildren: children,
       );

  static const String name = 'ChangePasswordRoute';

  static _i27.PageInfo page = _i27.PageInfo(
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

  final _i28.Key? key;

  @override
  String toString() {
    return 'ChangePasswordRouteArgs{phoneNumber: $phoneNumber, key: $key}';
  }
}

/// generated route for
/// [_i7.ConsumerLandingPage]
class ConsumerLandingRoute extends _i27.PageRouteInfo<void> {
  const ConsumerLandingRoute({List<_i27.PageRouteInfo>? children})
    : super(ConsumerLandingRoute.name, initialChildren: children);

  static const String name = 'ConsumerLandingRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i7.ConsumerLandingPage();
    },
  );
}

/// generated route for
/// [_i8.DateSelectionPage]
class DateSelectionRoute extends _i27.PageRouteInfo<DateSelectionRouteArgs> {
  DateSelectionRoute({
    _i28.Key? key,
    required Map<String, Object?> location,
    required _i29.Product product,
    List<_i27.PageRouteInfo>? children,
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

  static _i27.PageInfo page = _i27.PageInfo(
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

  final _i28.Key? key;

  final Map<String, Object?> location;

  final _i29.Product product;

  @override
  String toString() {
    return 'DateSelectionRouteArgs{key: $key, location: $location, product: $product}';
  }
}

/// generated route for
/// [_i9.EventCategoryPage]
class EventCategoryRoute extends _i27.PageRouteInfo<EventCategoryRouteArgs> {
  EventCategoryRoute({
    _i28.Key? key,
    required _i29.Product product,
    List<_i27.PageRouteInfo>? children,
  }) : super(
         EventCategoryRoute.name,
         args: EventCategoryRouteArgs(key: key, product: product),
         initialChildren: children,
       );

  static const String name = 'EventCategoryRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventCategoryRouteArgs>();
      return _i9.EventCategoryPage(key: args.key, product: args.product);
    },
  );
}

class EventCategoryRouteArgs {
  const EventCategoryRouteArgs({this.key, required this.product});

  final _i28.Key? key;

  final _i29.Product product;

  @override
  String toString() {
    return 'EventCategoryRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i10.EventDetailsPage]
class EventDetailsRoute extends _i27.PageRouteInfo<EventDetailsRouteArgs> {
  EventDetailsRoute({
    _i31.Key? key,
    required _i29.Product event,
    required String productLocationName,
    List<_i27.PageRouteInfo>? children,
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

  static _i27.PageInfo page = _i27.PageInfo(
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

  final _i31.Key? key;

  final _i29.Product event;

  final String productLocationName;

  @override
  String toString() {
    return 'EventDetailsRouteArgs{key: $key, event: $event, productLocationName: $productLocationName}';
  }
}

/// generated route for
/// [_i11.EventsSummaryPage]
class EventsSummaryRoute extends _i27.PageRouteInfo<void> {
  const EventsSummaryRoute({List<_i27.PageRouteInfo>? children})
    : super(EventsSummaryRoute.name, initialChildren: children);

  static const String name = 'EventsSummaryRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i11.EventsSummaryPage();
    },
  );
}

/// generated route for
/// [_i12.HostProductSummaryPage]
class HostProductSummaryRoute
    extends _i27.PageRouteInfo<HostProductSummaryRouteArgs> {
  HostProductSummaryRoute({
    _i28.Key? key,
    required String host,
    List<_i27.PageRouteInfo>? children,
  }) : super(
         HostProductSummaryRoute.name,
         args: HostProductSummaryRouteArgs(key: key, host: host),
         initialChildren: children,
       );

  static const String name = 'HostProductSummaryRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HostProductSummaryRouteArgs>();
      return _i12.HostProductSummaryPage(key: args.key, host: args.host);
    },
  );
}

class HostProductSummaryRouteArgs {
  const HostProductSummaryRouteArgs({this.key, required this.host});

  final _i28.Key? key;

  final String host;

  @override
  String toString() {
    return 'HostProductSummaryRouteArgs{key: $key, host: $host}';
  }
}

/// generated route for
/// [_i13.ImagePreviewPage]
class ImagePreviewRoute extends _i27.PageRouteInfo<ImagePreviewRouteArgs> {
  ImagePreviewRoute({
    _i28.Key? key,
    required String imageUrl,
    List<_i27.PageRouteInfo>? children,
  }) : super(
         ImagePreviewRoute.name,
         args: ImagePreviewRouteArgs(key: key, imageUrl: imageUrl),
         initialChildren: children,
       );

  static const String name = 'ImagePreviewRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ImagePreviewRouteArgs>();
      return _i13.ImagePreviewPage(key: args.key, imageUrl: args.imageUrl);
    },
  );
}

class ImagePreviewRouteArgs {
  const ImagePreviewRouteArgs({this.key, required this.imageUrl});

  final _i28.Key? key;

  final String imageUrl;

  @override
  String toString() {
    return 'ImagePreviewRouteArgs{key: $key, imageUrl: $imageUrl}';
  }
}

/// generated route for
/// [_i14.ImageSelectionPage]
class ImageSelectionRoute extends _i27.PageRouteInfo<ImageSelectionRouteArgs> {
  ImageSelectionRoute({
    _i28.Key? key,
    required _i29.Product product,
    _i32.ProductTypes type = _i32.ProductTypes.Event,
    List<_i27.PageRouteInfo>? children,
  }) : super(
         ImageSelectionRoute.name,
         args: ImageSelectionRouteArgs(key: key, product: product, type: type),
         initialChildren: children,
       );

  static const String name = 'ImageSelectionRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ImageSelectionRouteArgs>();
      return _i14.ImageSelectionPage(
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
    this.type = _i32.ProductTypes.Event,
  });

  final _i28.Key? key;

  final _i29.Product product;

  final _i32.ProductTypes type;

  @override
  String toString() {
    return 'ImageSelectionRouteArgs{key: $key, product: $product, type: $type}';
  }
}

/// generated route for
/// [_i15.LocationSelectionPage]
class LocationSelectionRoute
    extends _i27.PageRouteInfo<LocationSelectionRouteArgs> {
  LocationSelectionRoute({
    required _i29.Product product,
    _i28.Key? key,
    required _i32.ProductTypes productType,
    List<_i27.PageRouteInfo>? children,
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

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LocationSelectionRouteArgs>();
      return _i15.LocationSelectionPage(
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

  final _i29.Product product;

  final _i28.Key? key;

  final _i32.ProductTypes productType;

  @override
  String toString() {
    return 'LocationSelectionRouteArgs{product: $product, key: $key, productType: $productType}';
  }
}

/// generated route for
/// [_i16.LoginPage]
class LoginRoute extends _i27.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i28.Key? key,
    bool goBackToOrigin = false,
    List<_i27.PageRouteInfo>? children,
  }) : super(
         LoginRoute.name,
         args: LoginRouteArgs(key: key, goBackToOrigin: goBackToOrigin),
         initialChildren: children,
       );

  static const String name = 'LoginRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return _i16.LoginPage(key: args.key, goBackToOrigin: args.goBackToOrigin);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, this.goBackToOrigin = false});

  final _i28.Key? key;

  final bool goBackToOrigin;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, goBackToOrigin: $goBackToOrigin}';
  }
}

/// generated route for
/// [_i17.OverviewPage]
class OverviewRoute extends _i27.PageRouteInfo<OverviewRouteArgs> {
  OverviewRoute({
    _i28.Key? key,
    int currentStep = 0,
    List<_i27.PageRouteInfo>? children,
  }) : super(
         OverviewRoute.name,
         args: OverviewRouteArgs(key: key, currentStep: currentStep),
         initialChildren: children,
       );

  static const String name = 'OverviewRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OverviewRouteArgs>(
        orElse: () => const OverviewRouteArgs(),
      );
      return _i17.OverviewPage(key: args.key, currentStep: args.currentStep);
    },
  );
}

class OverviewRouteArgs {
  const OverviewRouteArgs({this.key, this.currentStep = 0});

  final _i28.Key? key;

  final int currentStep;

  @override
  String toString() {
    return 'OverviewRouteArgs{key: $key, currentStep: $currentStep}';
  }
}

/// generated route for
/// [_i18.PaymentConfirmationPage]
class PaymentConfirmationRoute
    extends _i27.PageRouteInfo<PaymentConfirmationRouteArgs> {
  PaymentConfirmationRoute({
    _i28.Key? key,
    required _i29.Product product,
    required String locationName,
    required _i33.Ticket ticket,
    List<_i27.PageRouteInfo>? children,
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

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PaymentConfirmationRouteArgs>();
      return _i18.PaymentConfirmationPage(
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

  final _i28.Key? key;

  final _i29.Product product;

  final String locationName;

  final _i33.Ticket ticket;

  @override
  String toString() {
    return 'PaymentConfirmationRouteArgs{key: $key, product: $product, locationName: $locationName, ticket: $ticket}';
  }
}

/// generated route for
/// [_i19.PaymentSummaryPage]
class PaymentSummaryRoute extends _i27.PageRouteInfo<PaymentSummaryRouteArgs> {
  PaymentSummaryRoute({
    _i28.Key? key,
    required _i29.Product product,
    required String locationName,
    required List<_i33.Ticket> tickets,
    required DateTime selectedDateTime,
    List<_i27.PageRouteInfo>? children,
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

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PaymentSummaryRouteArgs>();
      return _i19.PaymentSummaryPage(
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

  final _i28.Key? key;

  final _i29.Product product;

  final String locationName;

  final List<_i33.Ticket> tickets;

  final DateTime selectedDateTime;

  @override
  String toString() {
    return 'PaymentSummaryRouteArgs{key: $key, product: $product, locationName: $locationName, tickets: $tickets, selectedDateTime: $selectedDateTime}';
  }
}

/// generated route for
/// [_i20.ProductDetailsPage]
class ProductDetailsRoute extends _i27.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    required _i34.SubCategory category,
    _i28.Key? key,
    required _i32.ProductTypes productType,
    List<_i27.PageRouteInfo>? children,
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

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailsRouteArgs>();
      return _i20.ProductDetailsPage(
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

  final _i34.SubCategory category;

  final _i28.Key? key;

  final _i32.ProductTypes productType;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{category: $category, key: $key, productType: $productType}';
  }
}

/// generated route for
/// [_i21.RequestOTPPage]
class RequestOTPRoute extends _i27.PageRouteInfo<void> {
  const RequestOTPRoute({List<_i27.PageRouteInfo>? children})
    : super(RequestOTPRoute.name, initialChildren: children);

  static const String name = 'RequestOTPRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i21.RequestOTPPage();
    },
  );
}

/// generated route for
/// [_i22.SharedLandingPage]
class SharedLandingRoute extends _i27.PageRouteInfo<void> {
  const SharedLandingRoute({List<_i27.PageRouteInfo>? children})
    : super(SharedLandingRoute.name, initialChildren: children);

  static const String name = 'SharedLandingRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i22.SharedLandingPage();
    },
  );
}

/// generated route for
/// [_i23.SignUpPage]
class SignUpRoute extends _i27.PageRouteInfo<void> {
  const SignUpRoute({List<_i27.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i23.SignUpPage();
    },
  );
}

/// generated route for
/// [_i24.TicketsSummaryPage]
class TicketsSummaryRoute extends _i27.PageRouteInfo<TicketsSummaryRouteArgs> {
  TicketsSummaryRoute({
    _i28.Key? key,
    required _i29.Product product,
    required Map<String, double> prices,
    required Map<String, int> amounts,
    required _i35.Currency currency,
    required List<String> selectedCategories,
    List<_i27.PageRouteInfo>? children,
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

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TicketsSummaryRouteArgs>();
      return _i24.TicketsSummaryPage(
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

  final _i28.Key? key;

  final _i29.Product product;

  final Map<String, double> prices;

  final Map<String, int> amounts;

  final _i35.Currency currency;

  final List<String> selectedCategories;

  @override
  String toString() {
    return 'TicketsSummaryRouteArgs{key: $key, product: $product, prices: $prices, amounts: $amounts, currency: $currency, selectedCategories: $selectedCategories}';
  }
}

/// generated route for
/// [_i25.VerifyOTPPage]
class VerifyOTPRoute extends _i27.PageRouteInfo<VerifyOTPRouteArgs> {
  VerifyOTPRoute({
    required String phoneNumber,
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
         VerifyOTPRoute.name,
         args: VerifyOTPRouteArgs(phoneNumber: phoneNumber, key: key),
         initialChildren: children,
       );

  static const String name = 'VerifyOTPRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerifyOTPRouteArgs>();
      return _i25.VerifyOTPPage(args.phoneNumber, key: args.key);
    },
  );
}

class VerifyOTPRouteArgs {
  const VerifyOTPRouteArgs({required this.phoneNumber, this.key});

  final String phoneNumber;

  final _i28.Key? key;

  @override
  String toString() {
    return 'VerifyOTPRouteArgs{phoneNumber: $phoneNumber, key: $key}';
  }
}

/// generated route for
/// [_i26.VideoSelectionPage]
class VideoSelectionRoute extends _i27.PageRouteInfo<VideoSelectionRouteArgs> {
  VideoSelectionRoute({
    _i28.Key? key,
    required _i29.Product product,
    required _i32.ProductTypes type,
    List<_i27.PageRouteInfo>? children,
  }) : super(
         VideoSelectionRoute.name,
         args: VideoSelectionRouteArgs(key: key, product: product, type: type),
         initialChildren: children,
       );

  static const String name = 'VideoSelectionRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VideoSelectionRouteArgs>();
      return _i26.VideoSelectionPage(
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

  final _i28.Key? key;

  final _i29.Product product;

  final _i32.ProductTypes type;

  @override
  String toString() {
    return 'VideoSelectionRouteArgs{key: $key, product: $product, type: $type}';
  }
}
