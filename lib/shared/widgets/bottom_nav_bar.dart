import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const NavItem(this.title, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(
          child: Icon(
        icon,
        color: const Color(0xf0F55E00),
      )),
      Center(child: Text(title, style: const TextStyle(fontSize: 12)))
    ]);
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
            height: 50,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavItem("Switch to hosting", Icons.home),
                  NavItem("Search", Icons.search),
                  NavItem("Profile", Icons.person)
                ])),
      ),
    );
  }
}
