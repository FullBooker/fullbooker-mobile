import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/entities/host_product_response.dart';
import 'package:fullbooker/shared/entities/event_creation_model.dart';

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

final List<String> mockProductSetupImageURLs = <String>[
  'https://spotme.com/wp-content/uploads/2020/07/Hero-1.jpg',
  'https://www.eventbookings.com/wp-content/uploads/2018/03/event-ideas-for-party-eventbookings.jpg',
  'https://cdn.pixabay.com/photo/2016/11/23/15/48/audience-1853662_640.jpg',
  'https://img.freepik.com/free-photo/black-silhouettes-music-concert-poster-concept_1194-617147.jpg',
  'https://media.istockphoto.com/id/1806011581/photo/overjoyed-happy-young-people-dancing-jumping-and-singing-during-concert-of-favorite-group.jpg?s=612x612&w=0&k=20&c=cMFdhX403-yKneupEN-VWSfFdy6UWf1H0zqo6QBChP4=',
  'https://images.pexels.com/photos/1763075/pexels-photo-1763075.jpeg?cs=srgb&dl=pexels-sebastian-ervi-866902-1763075.jpg&fm=jpg',
  'https://media.self.com/photos/5e70f72443731c000882cfe7/4:3/w_2560%2Cc_limit/GettyImages-125112134.jpg',
  'https://www.shutterstock.com/image-vector/jazz-music-icon-vector-stylish-600nw-2477870937.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1cUVUujb6ipmwMRtKyiMI9riPE_Pbclfa3aI3ogscotNmFkWai0u0ZwhgEy1fZFNM1Jo&usqp=CAU',
];

final Map<String, dynamic> hostProductResponse = <String, dynamic>{
  'count': 1,
  'next': null,
  'previous': null,
  'results': <Map<String, Object?>>[
    <String, Object?>{
      'id': '1029752f-7fc3-4ef5-949e-f874e18b1e10',
      'created_at': '2025-03-24T07:02:23.940123Z',
      'updated_at': '2025-03-24T07:08:47.672426Z',
      'active': true,
      'host': <String, Object>{
        'id': '2c2b71b0-8811-4ea1-92bd-c586af7b0e27',
        'created_at': '2025-03-24T06:59:05.208810Z',
        'updated_at': '2025-03-24T06:59:05.208826Z',
        'active': true,
        'user': <String, Object?>{
          'id': '26f74815-0d6d-4084-9ece-3c82f788b39c',
          'phone_number': '',
          'email': 'abiudrn@gmail.com',
          'first_name': 'abiudrn',
          'last_name': '',
          'is_active': true,
          'is_host': true,
          'image': null,
        },
      },
      'name': 'Monthly Rock Climbing',
      'description':
          "Monthly rock climbing with very few friends that I know and like. This will be an exclusive event with boots on the ground coz we don't want to step on each other's toes",
      'number': 'EVEMUS1029752f',
      'category': 'fbf41da9-ea75-40f5-9767-b06fd7b88cf1',
      'subcategory': '2a11b0da-1bdf-4282-8d13-9aa7bc3d97ba',
      'availability': <String, Object?>{
        'id': 'c8ca822c-85a1-4fb0-a2b6-c156349e3886',
        'product': '1029752f-7fc3-4ef5-949e-f874e18b1e10',
        'product_name': 'Monthly Rock Climbing',
        'start': '2025-04-21',
        'end': '2025-04-22',
        'start_time': '19:00:00',
        'end_time': '20:00:00',
        'duration': null,
        'open_days': <dynamic>[],
        'closed_dates': <dynamic>[],
      },
      'pricing': <Map<String, Object?>>[
        <String, Object?>{
          'id': '54ab2b88-fa45-4a06-80ac-e9cd73f2cc77',
          'created_at': '2025-03-24T07:07:43.495517Z',
          'updated_at': '2025-03-24T07:07:43.495532Z',
          'active': true,
          'host': '2c2b71b0-8811-4ea1-92bd-c586af7b0e27',
          'name': null,
          'product': '1029752f-7fc3-4ef5-949e-f874e18b1e10',
          'currency': '1c5722fb-95a9-4ac2-89b3-e2a1a28ae053',
          'cost': '1500.00',
          'type': 'ticket',
          'ticket_tier': 'early_bird',
          'maximum_number_of_tickets': 10,
          'remaining_tickets': 10,
          'sold_tickets': 0,
        },
        <String, Object?>{
          'id': 'd1c4e568-33b1-4727-927c-144ff7037baa',
          'created_at': '2025-03-24T07:08:01.846802Z',
          'updated_at': '2025-03-24T07:08:01.846818Z',
          'active': true,
          'host': '2c2b71b0-8811-4ea1-92bd-c586af7b0e27',
          'name': null,
          'product': '1029752f-7fc3-4ef5-949e-f874e18b1e10',
          'currency': '1c5722fb-95a9-4ac2-89b3-e2a1a28ae053',
          'cost': '2000.00',
          'type': 'ticket',
          'ticket_tier': 'standard',
          'maximum_number_of_tickets': 10,
          'remaining_tickets': 10,
          'sold_tickets': 0,
        },
        <String, Object?>{
          'id': '293101bb-d6ca-4198-97ea-882059f09368',
          'created_at': '2025-03-24T07:08:13.472478Z',
          'updated_at': '2025-03-24T07:08:13.472497Z',
          'active': true,
          'host': '2c2b71b0-8811-4ea1-92bd-c586af7b0e27',
          'name': null,
          'product': '1029752f-7fc3-4ef5-949e-f874e18b1e10',
          'currency': '1c5722fb-95a9-4ac2-89b3-e2a1a28ae053',
          'cost': '2200.00',
          'type': 'ticket',
          'ticket_tier': 'standard_at_the_gate',
          'maximum_number_of_tickets': 10,
          'remaining_tickets': 10,
          'sold_tickets': 0,
        },
        <String, Object?>{
          'id': 'ba51ccd8-e0f4-4734-a244-0794291472f4',
          'created_at': '2025-03-24T07:08:22.382959Z',
          'updated_at': '2025-03-24T07:08:22.382981Z',
          'active': true,
          'host': '2c2b71b0-8811-4ea1-92bd-c586af7b0e27',
          'name': null,
          'product': '1029752f-7fc3-4ef5-949e-f874e18b1e10',
          'currency': '1c5722fb-95a9-4ac2-89b3-e2a1a28ae053',
          'cost': '2500.00',
          'type': 'ticket',
          'ticket_tier': 'last_minute',
          'maximum_number_of_tickets': 5,
          'remaining_tickets': 5,
          'sold_tickets': 0,
        },
        <String, Object?>{
          'id': 'bbfe8efd-62d1-41c3-8f6b-0d12dd649bc8',
          'created_at': '2025-03-24T07:08:30.135456Z',
          'updated_at': '2025-03-24T07:08:30.135635Z',
          'active': true,
          'host': '2c2b71b0-8811-4ea1-92bd-c586af7b0e27',
          'name': null,
          'product': '1029752f-7fc3-4ef5-949e-f874e18b1e10',
          'currency': '1c5722fb-95a9-4ac2-89b3-e2a1a28ae053',
          'cost': '3000.00',
          'type': 'ticket',
          'ticket_tier': 'vip',
          'maximum_number_of_tickets': 10,
          'remaining_tickets': 10,
          'sold_tickets': 0,
        },
        <String, Object?>{
          'id': '59fed672-22cc-4abf-b006-14b27503b286',
          'created_at': '2025-03-24T07:08:39.167648Z',
          'updated_at': '2025-03-24T07:08:39.167665Z',
          'active': true,
          'host': '2c2b71b0-8811-4ea1-92bd-c586af7b0e27',
          'name': null,
          'product': '1029752f-7fc3-4ef5-949e-f874e18b1e10',
          'currency': '1c5722fb-95a9-4ac2-89b3-e2a1a28ae053',
          'cost': '5000.00',
          'type': 'ticket',
          'ticket_tier': 'vvip',
          'maximum_number_of_tickets': 5,
          'remaining_tickets': 5,
          'sold_tickets': 0,
        }
      ],
      'image': <String, Object>{
        'id': '75309523-f4a4-454f-8acf-2c50a9ec0900',
        'created_at': '2025-03-24T07:04:42.771953Z',
        'updated_at': '2025-03-24T07:04:42.771973Z',
        'active': true,
        'host': '2c2b71b0-8811-4ea1-92bd-c586af7b0e27',
        'media_type': 'image',
        'file':
            'https://dev-fullbooker-static.s3.amazonaws.com/media/images/monthly-rock-climbing/19e3d21e239e42ebbfaf51e86009dc3a.jpg',
        'uploaded_at': '2025-03-24T07:04:45.135468Z',
      },
      'video': null,
      'locations': <Map<String, Object>>[
        <String, Object>{
          'id': '1da23652-07fb-44b4-ba91-dc3c6fd0203c',
          'created_at': '2025-03-24T07:02:34.866148Z',
          'updated_at': '2025-03-24T07:02:34.866177Z',
          'active': true,
          'host': '2c2b71b0-8811-4ea1-92bd-c586af7b0e27',
          'product': '1029752f-7fc3-4ef5-949e-f874e18b1e10',
          'coordinates': 'SRID=4326;POINT (37.30840789999999 -0.1521384)',
          'address': 'Mount Kenya, Kenya',
        }
      ],
    }
  ],
};

final HostProduct? mockHostProduct =
    HostProductResponse.fromJson(hostProductResponse).results?.first;
