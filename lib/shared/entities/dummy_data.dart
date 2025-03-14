import 'package:flutter/material.dart';
import 'package:fullbooker/shared/entities/overview_step.dart';

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

final List<Map<String, dynamic>> eventReviewsDummyData = <Map<String, dynamic>>[
  <String, dynamic>{
    'name': 'Jane Mbithe',
    'profilePic': 'https://i.imgur.com/aen9woM.png',
    'rating': 5,
    'timeAgo': '6 months ago',
    'review':
        'The rock concert was pure energy from start to finish! The band was on fire, delivering every song with passion and precision. The lighting and sound setup amplified the atmosphere, creating an unforgettable experience.',
  },
  <String, dynamic>{
    'name': 'Brian Ochonga',
    'profilePic': 'https://i.imgur.com/aen9woM.png',
    'rating': 4,
    'timeAgo': '7 months ago',
    'review':
        'The band gave a raw and authentic performance, proving why they’re one of the rising stars in rock. The drummer’s solo was a highlight, and the lyrics hit home with so many in the audience.',
  },
  <String, dynamic>{
    'name': 'George Onsarigo',
    'profilePic': 'https://i.imgur.com/aen9woM.png',
    'rating': 3,
    'timeAgo': '2 years ago',
    'review':
        'What a show! From the moment the lights dimmed, the energy was electric. The hard rock numbers shook the venue, and the slower ballads gave us a chance to catch our breath.',
  },
];

final List<Map<String, dynamic>> paymentMethods = <Map<String, dynamic>>[
  <String, dynamic>{
    'name': 'Mpesa',
    'id': 'Mpesa',
    'color': Colors.green,
    'isApplePay': false,
    'icon': null,
  },
  <String, dynamic>{
    'name': 'Card',
    'id': 'Card',
    'color': Colors.green,
    'isApplePay': false,
    'icon': null,
  },
  <String, dynamic>{
    'name': 'Bank',
    'id': 'Bank',
    'color': Colors.green,
    'isApplePay': false,
    'icon': null,
  },
  <String, dynamic>{
    'name': 'Pay',
    'id': 'Apple Pay',
    'color': Colors.green,
    'isApplePay': true,
    'icon': null,
  },
  <String, dynamic>{
    'name': 'Pay',
    'id': 'G Pay',
    'color': Colors.green,
    'isApplePay': false,
    'icon': Icons.g_mobiledata,
  },
];
