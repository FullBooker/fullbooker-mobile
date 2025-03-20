// Flutter imports:
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class AppBarAction {
  final double? iconSize;
  final Color? iconColor;
  final Function()? onTap;
  final HeroIcons iconUrl;
  final Key? actionKey;

  AppBarAction({
    required this.iconUrl,
    required this.onTap,
    this.iconSize,
    this.iconColor,
    this.actionKey,
  });
}
