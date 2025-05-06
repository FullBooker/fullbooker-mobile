import 'package:map_location_picker/map_location_picker.dart';

const String UNKNOWN = 'UNKNOWN';
const String kUnknownAddress = 'Unknown Address';
const String kUnknownCity = 'Unknown City';

// App names
const String kAppName = 'Fullbooker';
const String kDevAppName = 'Fullbooker Dev';

/// `sqlite_master` is used to retrieve the list of all tables in an SQLite database programmatically, as an alternative to the `.tables` command in the sqlite3 command-line interface.
/// Source: [SQLite Schema Information](https://www.sqlite.org/schematab.html)
const String masterSchemaTableName = 'sqlite_master';

// DB Names
const String kDevDatabaseName = 'fullbooker.dev.store.db';
const String kProdDatabaseName = 'fullbooker.store.db';

const double kPlatformServiceFee = 7;
const double kBasePlatformFee = 150;

const List<String> kAllowedImageExtensions = <String>['jpg', 'png'];

const String kMapsAPIKey = 'AIzaSyCDJOyqgUJdZD_pFXe4wlK1yX9-9qVky_w';

const int kRequestTimeoutSeconds = 45;

const Map<String, dynamic> kTimeoutResponsePayload = <String, dynamic>{
  'statusCode': 408,
  'error': 'Network connection unreliable. Please try again later.',
};

const String kLoginLogoutPrompt = 'Oops!!! Something wrong just happened. '
    'If this persists, log out and login again';

const String kDefaultTokenExpiry = '3600';

const String APPVERSION = 'APPVERSION';
const String kDevBuild = 'dev-build';

const int kOTPRetryTimeout = 120;

const List<String> kAllowedPhoneNumberCountries = <String>[
  'KE',
  'US',
  'AE',
];

const LatLng kDefaultLocation = LatLng(-1.2849541, 36.8212995);

const String kDefaultCurrencyCode = 'KES';

const List<String> kAllowedCurrencyCodes = <String>[
  kDefaultCurrencyCode,
  'USD',
  'AED',
];

const List<String> kAllowedDiscountOptions = <String>['Percentage', 'Amount'];

const String kSupportLine = '0700 394 444';

const List<String> kAllowedPhotoExtensions = <String>[
  'jpg',
  'jpeg',
  'webp',
  'png',
];

const List<String> kAllowedVideoExtensions = <String>[
  'mp4',
  'mov',
];

const List<String> kDaysOfTheWeek = <String>[
  'monday',
  'tuesday',
  'wednesday',
  'thursday',
  'friday',
  'saturday',
  'sunday',
];

const String kDailyRepeatOption = 'daily';
const String kWeeklyRepeatOption = 'weekly';
const String kMonthlyRepeatOption = 'monthly';
const String kYearlyRepeatOption = 'yearly';

const List<String> scheduleRepeatOptions = <String>[
  kNoRepeatSchedule,
  kDailyRepeatOption,
  kWeeklyRepeatOption,
  kMonthlyRepeatOption,
  kYearlyRepeatOption,
];

const String kNoRepeatSchedule = 'none';

const String kEarlyBirdTier = 'early_bird';
const String kStandardTier = 'standard';
const String kVIPTier = 'vip';
const String kVVIPTier = 'vvip';

final List<String> allTicketTiers = <String>[
  kEarlyBirdTier,
  kStandardTier,
  kVIPTier,
  kVVIPTier,
];

const String kImageMediaType = 'image';
const String kVideoMediaType = 'video';

const String kPlatformTermsURL =
    'https://fullbooker.com/terms-of-service?hide_bottom_nav=true';

int kRefreshTokenTimerInterval = 4;

const String kStartOfDayTime = '00:01:00';
const String kEndOfDayTime = '23:50:00';

const String kDefaultWeeklyScheduleStartTime = '09:00';
const String kDefaultWeeklyScheduleEndTime = '17:00';
