import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/widgets/nav_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

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
