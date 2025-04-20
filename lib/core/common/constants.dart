import 'package:map_location_picker/map_location_picker.dart';

const String UNKNOWN = 'UNKNOWN';
const String kUnknownAddress = 'Unknown Address';

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
const List<String> kAllowedVideoExtensions = <String>['mp4'];

const String kMapsAPIKey = 'AIzaSyDen5uldAkBcBPog8ajqpThWXGsiXmYSyU';

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

const List<String> allowedPhoneNumberCountries = <String>['KE', 'UG', 'TZ'];

const LatLng kDefaultLocation = LatLng(-1.228003, 36.900032);

const List<String> kAllowedCurrencyCodes = <String>['KES', 'USD', 'AED'];

const List<String> kAllowedDiscountOptions = <String>['Percentage', 'Amount'];

const String kSupportLine = '0700 394 444';

const List<String> kAllowedMediaExtensions = <String>[
  'jpg',
  'jpeg',
  'webp',
  'png',
  'mp4',
  'mov',
];

const List<String> weekdays = <String>[
  'monday',
  'tuesday',
  'wednesday',
  'thursday',
  'friday',
  'saturday',
  'sunday',
];

const String dailyOption = 'Daily';
const String weeklyOption = 'Weekly';
const String monthlyOption = 'Monthly';
const String yearlyOption = 'Yearly';

const List<String> scheduleRepeatOptions = <String>[
  dailyOption,
  weeklyOption,
  monthlyOption,
  yearlyOption,
];

const String noRepeatSchedule = 'none';

const String earlyBirdTier = 'early_bird';
const String standardTier = 'standard';
const String vipTier = 'vip';
const String vvipTier = 'vvip';

final List<String> allTicketTiers = <String>[
  earlyBirdTier,
  standardTier,
  vipTier,
  vvipTier,
];

const String kImageMediaType = 'image';
const String kVideoMediaType = 'video';
