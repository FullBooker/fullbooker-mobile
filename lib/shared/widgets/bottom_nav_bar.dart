import 'package:flutter/material.dart';
import 'package:fullbooker/shared/widgets/scale_locked_text.dart';

class NavItem extends StatelessWidget {
  const NavItem(this.title, this.icon, {super.key});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Ensures no unnecessary space
      children: <Widget>[
        Icon(icon, color: const Color(0xf0F55E00)),
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: SizedBox(
            width: 120,
            child: ScaleLockedText(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
        ),
      ],
    );
  }
}

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
          height: 60, // Slightly increased height for better spacing
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              NavItem('Switch to Hosting', Icons.home),
              NavItem('Search', Icons.search),
              NavItem('Profile', Icons.person),
            ],
          ),
        ),
      ),
    );
  }
}
