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

final Map<String, dynamic> productMockResponse = <String, dynamic>{
  'count': 1,
  'next': null,
  'previous': null,
  'results': <Map<String, Object?>>[
    <String, Object?>{
      'id': '01f8ad42-9c5e-4804-9034-51883298bc6d',
      'created_at': '2025-03-31T10:27:27.211676Z',
      'updated_at': '2025-03-31T10:34:51.581678Z',
      'active': true,
      'host': <String, Object>{
        'id': 'ea2f46db-0a79-4089-b932-cd4b862073b3',
        'created_at': '2025-03-31T10:24:56.071526Z',
        'updated_at': '2025-03-31T10:24:56.071543Z',
        'active': true,
        'user': <String, Object>{
          'id': 'f806e533-972f-444d-a584-a4562dc6f54a',
          'phone_number': '+254717356476',
          'email': 'abiudrn@gmail.com',
          'first_name': 'Abiud',
          'last_name': 'Orina',
          'is_active': true,
          'is_host': true,
          'image':
              'https://lh3.googleusercontent.com/a/ACg8ocKFfN0DHRbGGRD5silux0i8x3ccI_FJB1n2MJcQg5HMNps5XYqC=s96-c',
        },
      },
      'name': 'Conquering Kilimanjaro',
      'description':
          'We are going to touch the Murima in another country with my friends.',
      'number': 'EVENIG01F8AD42',
      'category': '623b184b-c9f7-4bdc-909e-5ccd563c19b4',
      'subcategory': '1d653c14-8746-4f18-a041-4ba5a33e29d6',
      'availability': <String, Object>{
        'id': '984d8d4e-9779-439c-b4e6-bd3db64c85a7',
        'product': '01f8ad42-9c5e-4804-9034-51883298bc6d',
        'product_name': 'Conquering Kilimanjaro',
        'start': '2025-04-21',
        'end': '2025-04-22',
        'start_time': '06:00:00',
        'end_time': '20:00:00',
        'duration': 150,
        'open_days': <Map<String, Object>>[
          <String, Object>{
            'id': 'df51700c-cf41-4965-9673-25dd6b6c2745',
            'created_at': '2025-03-31T10:29:04.042727Z',
            'updated_at': '2025-03-31T10:29:04.042741Z',
            'active': true,
            'host': 'ea2f46db-0a79-4089-b932-cd4b862073b3',
            'day': '0f62c8e7-97c2-429b-9378-455e855ddf04',
            'day_name': 'Wednesday',
            'opening_at': '14:30:00',
            'closing_at': '16:00:00',
          }
        ],
        'closed_dates': <dynamic>[],
      },
      'pricing': <Map<String, Object?>>[
        <String, Object?>{
          'id': '49bf580b-554e-4658-a670-0e2008fea02c',
          'created_at': '2025-03-31T10:31:33.161659Z',
          'updated_at': '2025-03-31T10:35:35.217654Z',
          'active': true,
          'host': 'ea2f46db-0a79-4089-b932-cd4b862073b3',
          'name': null,
          'product': '01f8ad42-9c5e-4804-9034-51883298bc6d',
          'currency': '5a9025cf-b4d9-4da6-84b2-d8f3e8bf8149',
          'cost': '2000.00',
          'type': 'ticket',
          'ticket_tier': 'early_bird',
          'maximum_number_of_tickets': 20,
          'remaining_tickets': 20,
          'sold_tickets': 0,
        },
        <String, Object?>{
          'id': '6d7dabe6-ae07-482b-a415-0d741f243e68',
          'created_at': '2025-03-31T10:31:54.172549Z',
          'updated_at': '2025-03-31T10:35:38.857648Z',
          'active': true,
          'host': 'ea2f46db-0a79-4089-b932-cd4b862073b3',
          'name': null,
          'product': '01f8ad42-9c5e-4804-9034-51883298bc6d',
          'currency': '5a9025cf-b4d9-4da6-84b2-d8f3e8bf8149',
          'cost': '2500.00',
          'type': 'ticket',
          'ticket_tier': 'standard',
          'maximum_number_of_tickets': 20,
          'remaining_tickets': 20,
          'sold_tickets': 0,
        },
        <String, Object?>{
          'id': 'fb89dfcc-f7cc-4a96-bb0c-b08104328e19',
          'created_at': '2025-03-31T10:32:04.701603Z',
          'updated_at': '2025-03-31T10:35:45.488132Z',
          'active': true,
          'host': 'ea2f46db-0a79-4089-b932-cd4b862073b3',
          'name': null,
          'product': '01f8ad42-9c5e-4804-9034-51883298bc6d',
          'currency': '5a9025cf-b4d9-4da6-84b2-d8f3e8bf8149',
          'cost': '3000.00',
          'type': 'ticket',
          'ticket_tier': 'standard_at_the_gate',
          'maximum_number_of_tickets': 5,
          'remaining_tickets': 5,
          'sold_tickets': 0,
        },
        <String, Object?>{
          'id': '626f6e7b-376c-49f0-a426-85148cf2df96',
          'created_at': '2025-03-31T10:32:15.281271Z',
          'updated_at': '2025-03-31T10:35:49.644998Z',
          'active': true,
          'host': 'ea2f46db-0a79-4089-b932-cd4b862073b3',
          'name': null,
          'product': '01f8ad42-9c5e-4804-9034-51883298bc6d',
          'currency': '5a9025cf-b4d9-4da6-84b2-d8f3e8bf8149',
          'cost': '4000.00',
          'type': 'ticket',
          'ticket_tier': 'last_minute',
          'maximum_number_of_tickets': 5,
          'remaining_tickets': 5,
          'sold_tickets': 0,
        }
      ],
      'image': <String, Object>{
        'id': '0f8c4acf-58e1-4ed6-a949-f0831df7c6e4',
        'created_at': '2025-03-31T10:31:05.724542Z',
        'updated_at': '2025-03-31T10:31:05.724557Z',
        'active': true,
        'host': 'ea2f46db-0a79-4089-b932-cd4b862073b3',
        'media_type': 'image',
        'file':
            'https://dev-fullbooker-static.s3.amazonaws.com/media/images/conquering-kilimanjaro/e379498b98cf4ae4905e986dde6986b7.jpg',
        'uploaded_at': '2025-03-31T10:31:05.929609Z',
      },
      'video': null,
      'locations': <Map<String, Object>>[
        <String, Object>{
          'id': '629330f5-80fc-4478-9e14-e4ec8769b872',
          'created_at': '2025-03-31T10:27:36.093211Z',
          'updated_at': '2025-03-31T10:27:36.093228Z',
          'active': true,
          'host': 'ea2f46db-0a79-4089-b932-cd4b862073b3',
          'product': '01f8ad42-9c5e-4804-9034-51883298bc6d',
          'coordinates':
              'SRID=4326;POINT (37.35562729999999 -3.067424699999999)',
          'address': 'Mt Kilimanjaro, Tanzania',
        }
      ],
    }
  ],
};

final HostProduct? mockProduct =
    HostProductResponse.fromJson(productMockResponse).results?.first;
