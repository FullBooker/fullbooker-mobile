import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/actions/update_bottom_nav_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/bottom_nav_view_model.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/bottom_nav_item.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
import 'package:fullbooker/shared/widgets/nav_item.dart';
import 'package:async_redux/async_redux.dart';
import 'package:heroicons/heroicons.dart';

// TODO(abiud): delete this
class OldBottomNavBar extends StatelessWidget {
  const OldBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      elevation: 16,
      shadowColor: Colors.black,
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 10),
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              NavItemWidget(switchToHostingString, Icons.home),
              NavItemWidget(searchString, Icons.search),
              NavItemWidget(profileString, Icons.person),
            ],
          ),
        ),
      ),
    );
  }
}

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
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: HeroIcon(
                        navItem.iconUrl,
                        color: Theme.of(context).colorScheme.tertiary,
                        size: 24,
                      ),
                    ),
                    verySmallVerticalSizedBox,
                    Text(
                      navItem.title,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                activeIcon: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: HeroIcon(
                        navItem.iconUrl,
                        color: Theme.of(context).primaryColor,
                        size: 24,
                      ),
                    ),
                    verySmallVerticalSizedBox,
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
        );
      },
    );
  }
}
