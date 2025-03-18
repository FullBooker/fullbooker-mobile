// Flutter imports:
import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        strokeWidth: 1,
        valueColor:
            AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
      ),
    );
  }
}
