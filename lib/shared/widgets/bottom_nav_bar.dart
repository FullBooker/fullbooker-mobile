import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/actions/update_bottom_nav_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/bottom_nav_view_model.dart';
import 'package:fullbooker/shared/entities/bottom_nav_item.dart';
import 'package:async_redux/async_redux.dart';
import 'package:heroicons/heroicons.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BottomNavViewModel>(
      converter: (Store<AppState> store) => BottomNavViewModel.fromStore(store),
      builder: (BuildContext context, BottomNavViewModel vm) {
        final Map<String, int> routeToIndexMap = <String, int>{
          for (int i = 0; i < bottomNavItems.length; i++)
            bottomNavItems[i].route.routeName: i,
        };

        // Determine the current index based on the current route
        final String currentRoute = context.router.current.name;
        final int currentIndex = routeToIndexMap[currentRoute] ?? 0;

        return BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          onTap: (int index) {
            if (index != currentIndex) {
              context.dispatch(UpdateBottomNavAction(currentIndex: index));
              context.router.push(bottomNavItems[index].route);
            }
          },
          items: bottomNavItems.map(
            (BottomNavItem navItem) {
              return BottomNavigationBarItem(
                key: Key(navItem.itemKey),
                icon: Column(
                  spacing: 8,
                  children: <Widget>[
                    HeroIcon(
                      navItem.iconUrl,
                      color: Theme.of(context).colorScheme.tertiary,
                      size: 24,
                    ),
                    Text(
                      navItem.title,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                activeIcon: Column(
                  spacing: 8,
                  children: <Widget>[
                    HeroIcon(
                      navItem.iconUrl,
                      color: Theme.of(context).primaryColor,
                      size: 24,
                    ),
                    Text(
                      navItem.title,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
                label: navItem.title,
              );
            },
          ).toList(),
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          elevation: 10,
        );
      },
    );
  }
}
