import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/shared/entities/event_creation_model.dart';
import 'package:fullbooker/shared/entities/overview_step.dart';

List<OverviewStep> defaultSteps = <OverviewStep>[
  OverviewStep(
    const <AssetImage>[AssetImage(appOverView1ImagePath)],
    'FIND YOUR FAVORITE EVENTS HERE',
    'Discover, Book, Enjoy\nYour Favorite Events Await!',
  ),
  OverviewStep(
    const <AssetImage>[AssetImage(appOverView2ImagePath)],
    'FIND NEARBY EVENTS',
    'Your Go-To App for\nNearby Events!',
  ),
  OverviewStep(
    const <AssetImage>[AssetImage(appOverView2ImagePath)],
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

const List<EventCreationStepModel> eventCreationSteps =
    <EventCreationStepModel>[
  EventCreationStepModel(
    1,
    'Tell us about your product',
    'What activities do you have?  When do they happen?  Where are they located?',
  ),
  EventCreationStepModel(
    2,
    'Upload Photos and videos of your product',
    'A picture is worth a thousand words, share photos and videos that showcase your products',
  ),
  EventCreationStepModel(
    3,
    'Publish Your Product',
    'Make it official, publish your product and start selling',
  ),
];

final List<String> productImages = <String>[
  'https://i.imgur.com/aqOo5Ao.png',
  'https://i.imgur.com/uXBwWkK.png',
  'https://i.imgur.com/9KrQ1c7.png',
  'https://i.imgur.com/Fhw9EqV.png',
  'https://i.imgur.com/D6FdHMN.png',
  'https://i.imgur.com/tIXPEJv.png',
];

final Map<String, dynamic> availabilityMockResponse = <String, dynamic>{
  'id': 'debfc057-f6cc-4682-91f1-5c8c7c5380d6',
  'product': 'c81d6ee5-a9fd-4046-8fde-5077bd3ecde5',
  'product_name': 'Quad Biking 10',
  'start': null,
  'end': null,
  'start_time': null,
  'end_time': null,
  'duration': null,
  'open_days': <Map<String, Object>>[
    <String, Object>{
      'id': 'e0b9eac7-e420-4e23-85dd-d82213b6f411',
      'created_at': '2025-02-12T09:57:35.395512Z',
      'updated_at': '2025-02-12T09:57:35.395529Z',
      'active': true,
      'host': 'd060199b-f032-40f9-adb2-9de24de3b2cf',
      'day': '7060954a-a354-49f1-8b8e-21aefbe6f995',
      'day_name': 'Monday',
      'opening_at': '23:34:00',
      'closing_at': '23:57:00',
    }
  ],
  'closed_dates': <Map<String, dynamic>>[
    <String, dynamic>{
      'id': 'fb65d6f4-a972-4de2-80d6-61d9d526cf5c',
      'created_at': '2025-02-12T09:57:35.399393Z',
      'updated_at': '2025-02-12T09:57:35.399406Z',
      'active': true,
      'host': 'd060199b-f032-40f9-adb2-9de24de3b2cf',
      'date': '2025-02-13',
    }
  ],
};

final List<String> mockImageUrls = <String>[
  'https://i.imgur.com/KBicWbe.png',
  'https://i.imgur.com/QoUtaJz.png',
  'https://i.imgur.com/dCBshIt.png',
  'https://i.imgur.com/aGE2yAR.png',
  'https://i.imgur.com/ooAxO9f.png',
  'https://i.imgur.com/O6Zd54G.png',
  'https://i.imgur.com/mAmy0jb.png',
  'https://i.imgur.com/tRmwlQw.png',
  'https://i.imgur.com/XK4RGag.png',
  'https://i.imgur.com/ZpJwjtd.png',
  'https://i.imgur.com/dnrQX0i.png',
  'https://i.imgur.com/wVU5Evt.png',
];
