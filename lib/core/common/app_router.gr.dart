// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:fullbooker/features/consumer/pages/consumer_landing_page.dart'
    as _i1;
import 'package:fullbooker/shared/pages/shared_landing_page.dart' as _i2;

/// generated route for
/// [_i1.ConsumerLandingPage]
class ConsumerLandingRoute extends _i3.PageRouteInfo<void> {
  const ConsumerLandingRoute({List<_i3.PageRouteInfo>? children})
    : super(ConsumerLandingRoute.name, initialChildren: children);

  static const String name = 'ConsumerLandingRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.ConsumerLandingPage();
    },
  );
}

/// generated route for
/// [_i2.SharedLandingPage]
class SharedLandingRoute extends _i3.PageRouteInfo<void> {
  const SharedLandingRoute({List<_i3.PageRouteInfo>? children})
    : super(SharedLandingRoute.name, initialChildren: children);

  static const String name = 'SharedLandingRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.SharedLandingPage();
    },
  );
}
