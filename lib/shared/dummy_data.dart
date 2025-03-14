import 'package:flutter/material.dart';
import 'package:fullbooker/shared/overview_step.dart';

List<OverviewStep> defaultSteps = <OverviewStep>[
  OverviewStep(
    const <AssetImage>[AssetImage('assets/images/overview1/overview.png')],
    'FIND YOUR FAVORITE EVENTS HERE',
    'Discover, Book, Enjoy\nYour Favorite Events Await!',
  ),
  OverviewStep(
    const <AssetImage>[AssetImage('assets/images/overview2/overview.png')],
    'FIND NEARBY EVENTS',
    'Your Go-To App for\nNearby Events!',
  ),
  OverviewStep(
    const <AssetImage>[AssetImage('assets/images/overview3/overview.png')],
    'UPDATE YOUR UPCOMING EVENTS HERE',
    'Keep Your Events Fresh\nUpdate Here!',
  ),
];
