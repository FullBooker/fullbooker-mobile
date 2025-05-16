import 'package:flutter/material.dart';

class CustomBottomNavContainer extends StatelessWidget {
  const CustomBottomNavContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Theme.of(context).dividerColor, width: 0.5),
        ),
      ),
      child: child,
    );
  }
}
