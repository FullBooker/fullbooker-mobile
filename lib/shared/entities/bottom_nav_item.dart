import 'package:auto_route/auto_route.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:heroicons/heroicons.dart';

class BottomNavItem {
  final String itemKey;
  final String title;
  final PageRouteInfo<dynamic> route;
  final HeroIcons iconUrl;

  BottomNavItem({
    required this.itemKey,
    required this.title,
    required this.route,
    required this.iconUrl,
  });
}

final List<BottomNavItem> bottomNavItems = <BottomNavItem>[
  BottomNavItem(
    itemKey: 'bottom-nav-1',
    title: homeString,
    iconUrl: HeroIcons.home,
    route: const HostingHomeRoute(),
  ),
  BottomNavItem(
    itemKey: 'bottom-nav-2',
    title: productsString,
    iconUrl: HeroIcons.cube,
    route: const ProductsRoute(),
  ),
  BottomNavItem(
    itemKey: 'bottom-nav-3',
    title: profileString,
    iconUrl: HeroIcons.user,
    route: ProfileRoute(),
  ),
];
