import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key, this.fillColor});

  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        child: SpinKitThreeBounce(
          color: fillColor ?? Theme.of(context).primaryColor,
          size: 30.0,
        ),
      ),
    );
  }
}
