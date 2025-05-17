import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fullbooker/config/environments.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/entities/product_location.dart';
import 'package:fullbooker/domain/core/entities/product_schedule.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/entities/regexes.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:intl/intl.dart';
import 'package:map_location_picker/map_location_picker.dart';

class Utils {
  static String? validateSchedule({
    required String startDate,
    required String startTime,
    required String endDate,
    required String endTime,
  }) {
    if (<String>[startDate, startTime, endDate, endTime]
        .any((String s) => s == UNKNOWN || s.isEmpty)) {
      return null;
    }

    DateTime? parseDT(String date, String time) {
      try {
        return DateFormat('yyyy-MM-dd HH:mm').parse('$date $time');
      } catch (_) {
        return null;
      }
    }

    final DateTime now = DateTime.now();
    final DateTime? startDT = parseDT(startDate, startTime);
    final DateTime? endDT = parseDT(endDate, endTime);

    if (startDT == null || endDT == null) return null;

    if (startDT.isBefore(now)) {
      return startDateTimeWarning;
    }
    if (!startDT.isBefore(endDT)) {
      return endDateTimeWarning;
    }
    return null;
  }

  static DateTime? parseDateTime(String date, String time) {
    if (date == UNKNOWN && time == UNKNOWN) return null;

    try {
      if (date != UNKNOWN && time != UNKNOWN) {
        return DateFormat('yyyy-MM-dd HH:mm').parseStrict('$date $time');
      }

      if (date != UNKNOWN) {
        return DateFormat('yyyy-MM-dd').parseStrict(date);
      }

      if (time != UNKNOWN) {
        final DateTime t = DateFormat('HH:mm').parseStrict(time);
        return DateTime(1, 1, 1, t.hour, t.minute, t.second);
      }
    } catch (_) {
      // skip
    }

    return null;
  }
}

String getFileExtension(String fileName) {
  try {
    return fileName.split('.').last;
  } catch (e) {
    return '';
  }
}

void showSnackBar(String message, BuildContext context) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: okThanksString,
          textColor: Theme.of(context).primaryColor,
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
}

void showAlertDialog({
  required BuildContext context,
  required String? assetPath,
  String? title,
  String? description,
  Function()? onConfirm,
  Function()? onCancel,
  String? confirmText,
  String? cancelText,
  bool showSecondary = true,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          spacing: 12,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (assetPath != null)
              Center(
                child: SvgPicture.asset(
                  assetPath,
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
              ),
            if (title != null)
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                textAlign: TextAlign.center,
              ),
            if (description != null)
              Text(
                description,
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(
                      color: AppColors.greyTextColor,
                    ),
              ),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: PrimaryButton(
                child: right(confirmText ?? okThanksString),
                onPressed: onConfirm ?? () => context.router.maybePop(),
              ),
            ),
            if (onCancel != null)
              SizedBox(
                width: double.infinity,
                height: 48,
                child: SecondaryButton(
                  child: right(cancelText ?? okThanksString),
                  onPressed: onCancel,
                ),
              ),
          ],
        ),
      );
    },
  );
}

class ScaleSize {
  static double textScaleFactor(
    BuildContext context, {
    double maxTextScaleFactor = 2,
  }) {
    final double width = MediaQuery.of(context).size.width;
    final double val = (width / 1400) * maxTextScaleFactor;
    return min(val, maxTextScaleFactor);
  }
}

LatLng parseSRID(String srid) {
  final List<String> cleanedSRID = cleanSRIDRegex
      .firstMatch(srid)!
      .group(0)!
      .replaceAll(RegExp(r'[\(\)]'), '')
      .split(' ');
  return LatLng(double.parse(cleanedSRID[1]), double.parse(cleanedSRID[0]));
}

/// Retrieves the initials from a given string.
///
/// If the input [string] is empty, an empty string is returned.
/// The initials are obtained by taking the first letter of each word in the string after trimming whitespace.
/// The initials are concatenated into a single string.
/// If the resulting initials length is greater than 2, the first two initials are returned.
/// Otherwise, the entire initials string is returned.
///
/// E.g Abiud Orina returns AO
String getInitials(String string) {
  if (string.isEmpty) return '';

  final String initials = string
      .trim()
      .split(RegExp(' +'))
      .map((String s) => s[0])
      .join()
      .trim()
      .toUpperCase();

  return (initials.length > 2) ? initials.trim().substring(0, 2) : initials;
}

Future<void> setupEnvironment() async {
  const String envString = String.fromEnvironment('ENV');
  final AppEnvironment envFlavour = AppEnvironment.values.firstWhere(
    (AppEnvironment value) => value.toString() == 'AppEnvironment.$envString',
    orElse: () => AppEnvironment.dev,
  );
  final BuildEnvironment envBuilder = BuildEnvironment(envFlavour);
  await envBuilder.setEnv();
}

/// Utility function to get the appropriate AppConfig based on the environment
AppConfig getAppConfig(String env) {
  switch (env.toUpperCase()) {
    case 'DEV':
      return devAppConfig;
    case 'PROD':
      return prodAppConfig;
    case 'TEST':
      return testAppConfig;
    default:
      throw ArgumentError('Invalid environment: $env. Use DEV or PROD.');
  }
}

String getFullName(String? firstName, String? lastName) {
  final String fName = firstName?.trim() ?? '';
  final String lName = lastName?.trim() ?? '';

  if (fName.isEmpty && lName.isEmpty) {
    return 'No Name';
  }

  if (fName.isEmpty) return lName;
  if (lName.isEmpty) return fName;

  return '$fName $lName';
}

/// Checks if token has expired based on expiry date
/// returns true if token expires in 10 minutes or less
/// otherwise returns false
bool hasTokenExpired(DateTime expiresAt, DateTime now) {
  final int difference = expiresAt.difference(now).inMinutes;
  return difference <= kTokenRefreshDurationMinutes;
}

// Refresh token can no longer be used
bool isRefreshTokenStale(DateTime expiresAt, DateTime now) {
  final int elapsed = now.difference(expiresAt).inHours;
  return elapsed >= kRefreshTokenExpiryDurationHours;
}

/// Generates a personalized greeting based on the current time and the provided [name].
String greetings(String name, {DateTime? currentTime}) {
  final DateTime time = currentTime ?? DateTime.now();

  final int hour = time.hour;

  String greeting;

  if (hour < 12) {
    greeting = 'Good morning';
  } else if (hour < 18) {
    greeting = 'Good afternoon';
  } else {
    greeting = 'Good evening';
  }

  return '$greeting, $name!';
}

/// A widget that displays a human-readable date string.
///
/// The [humanizeDate] function takes a date string and formats it into a human-readable format
/// based on the provided options.
///
/// - [loadedDate]: The date string to be formatted.
/// - [dateTextStyle]: Optional text style for the formatted date string.
/// - [showTime]: If true, includes the time in the formatted string (default is false).
/// - [showYear]: If true, includes the year in the formatted string (default is true).
/// - [showMonthDate]: If true, includes the month and date in the formatted string (default is true).
///
/// Returns a [Text] widget with the formatted date string or an empty [SizedBox] if the date is unknown or empty.
///
/// Example usage:
/// ```dart
/// Widget example = humanizeDate(
///   loadedDate: '2023-06-17T10:30:00',
///   showTime: true,
/// );
/// ```
Widget humanizeDate({
  required String loadedDate,
  TextStyle? dateTextStyle,
  bool showTime = false,
  bool showYear = true,
  bool showMonthDate = true,
}) {
  if (loadedDate == UNKNOWN || loadedDate.isEmpty) {
    return const SizedBox();
  }

  final DateTime parsedDate =
      DateTime.tryParse(loadedDate)?.toLocal() ?? DateTime.now();

  final List<String> formatStrings = <String>[];
  if (showMonthDate) formatStrings.add('d MMM');
  if (showYear) formatStrings.add('yy');
  if (showTime) formatStrings.add('h:mm a');

  final DateFormat dateFormat = DateFormat(formatStrings.join(' '));
  final String formattedDate = dateFormat.format(parsedDate);

  return Text(
    formattedDate,
    style: dateTextStyle ??
        TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w200,
          color: AppColors.bodyTextColor.withValues(alpha: .35),
          fontStyle: FontStyle.italic,
        ),
  );
}

TimeOfDay stringToTimeOfDay(String timeString) {
  final List<String> parts = timeString.split(':');
  final int hour = int.parse(parts[0]);
  final int minute = int.parse(parts[1]);
  return TimeOfDay(hour: hour, minute: minute);
}

Widget formatTime({
  String? time,
  TextStyle? textStyle,
}) {
  if (time == null || time.isEmpty || time == UNKNOWN) {
    return const SizedBox();
  }

  try {
    final TimeOfDay timeOfDay = stringToTimeOfDay(time);
    final DateTime dateTime =
        DateTime(0, 1, 1, timeOfDay.hour, timeOfDay.minute);
    final String formatted = DateFormat('h:mm a').format(dateTime);

    return Text(
      formatted,
      style: textStyle ??
          TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w200,
            color: AppColors.bodyTextColor.withAlpha(90),
            fontStyle: FontStyle.italic,
          ),
    );
  } catch (_) {
    return const SizedBox();
  }
}

String formatTimeOnly({
  String? time,
}) {
  if (time == null || time.isEmpty || time == UNKNOWN) {
    return '';
  }

  try {
    final TimeOfDay timeOfDay = stringToTimeOfDay(time);
    final DateTime dateTime =
        DateTime(0, 1, 1, timeOfDay.hour, timeOfDay.minute);
    return DateFormat('h:mm a').format(dateTime);
  } catch (_) {
    return '';
  }
}

void navigateToNextProductStep({
  required BuildContext context,
  required Product product,
}) {
  if (product.completed ?? false) {
    context.router.push(const ProductDetailRoute());

    return;
  }

  if (product.name?.isEmpty ?? true) {
    context.router.push(ProductBasicDetailsRoute());
    return;
  }

  if (product.locations?.isEmpty ?? true) {
    context.router.push(ProductLocationRoute());
    return;
  }

  if ((product.scheduleID ?? UNKNOWN) == UNKNOWN) {
    context.router.push(ProductScheduleRoute());
    return;
  }

  if ((product.image?.file ?? UNKNOWN) == UNKNOWN) {
    context.router.push(const ProductPhotosRoute());
    return;
  }

  if ((product.video?.file ?? UNKNOWN) == UNKNOWN) {
    context.router.push(const ProductVideosRoute());
    return;
  }

  if (product.pricing?.isEmpty ?? true) {
    context.router.push(const ProductModeOfAccessRoute());
    return;
  }

  if (product.active ?? false) {
    context.router.push(ProductReviewAndSubmitRoute());
    return;
  }
}

bool isProductComplete({required Product product}) {
  final bool hasName = product.name?.trim().isNotEmpty ?? false;
  final bool hasLocation = product.locations?.isNotEmpty ?? false;
  final bool hasSchedule = (product.scheduleID ?? UNKNOWN) != UNKNOWN;
  final bool hasImage = (product.image?.file ?? UNKNOWN) != UNKNOWN;
  final bool hasVideo = (product.video?.file ?? UNKNOWN) != UNKNOWN;
  final bool hasPricing = product.pricing?.isNotEmpty ?? false;

  return hasName &&
      hasLocation &&
      hasSchedule &&
      hasImage &&
      hasVideo &&
      hasPricing;
}

ProductStatus getProductStatus(Product product) {
  final String status = (product.status ?? '').toUpperCase();

  switch (status) {
    case 'PUBLISHED':
      return ProductStatus.published;
    case 'DRAFT':
      return ProductStatus.draft;
    case 'REVIEW':
      return ProductStatus.review;
    case 'REVIEWED_NEEDS_CHANGES':
      return ProductStatus.reviewedNeedsChanges;
    case 'DEACTIVATED':
      return ProductStatus.deactivated;
    case 'REJECTED':
      return ProductStatus.rejected;
    case 'INVALIDATED':
      return ProductStatus.invalidated;
    default:
      return ProductStatus.draft;
  }
}

String getStatusDisplay({required Product product}) {
  switch (getProductStatus(product)) {
    case ProductStatus.draft:
      return 'Draft';
    case ProductStatus.review:
      return 'In Review';
    case ProductStatus.reviewedNeedsChanges:
      return 'Needs Changes';
    case ProductStatus.published:
      return 'Published';
    case ProductStatus.deactivated:
      return 'Deactivated';
    case ProductStatus.rejected:
      return 'Rejected';
    case ProductStatus.invalidated:
      return 'Invalidated';
    case ProductStatus.all:
      return 'All';
  }
}

Color getProductStatusColor({required Product product}) {
  switch (getProductStatus(product)) {
    case ProductStatus.published:
      return AppColors.greenColor;
    case ProductStatus.draft:
      return AppColors.greyTextColor;
    case ProductStatus.review:
    case ProductStatus.reviewedNeedsChanges:
      return AppColors.amberColor;
    case ProductStatus.deactivated:
    case ProductStatus.rejected:
    case ProductStatus.invalidated:
      return AppColors.redColor;
    case ProductStatus.all:
      return AppColors.primaryColor;
  }
}

Future<String?> pickDate({required BuildContext context}) async {
  final DateTime now = DateTime.now();
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: now,
    firstDate: now,
    lastDate: DateTime(2100),
  );

  return picked != null ? DateFormat('yyyy-MM-dd').format(picked) : null;
}

Future<String?> pickTime({required BuildContext context}) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (picked == null) return null;

  final DateTime dateTime = DateTime(0, 1, 1, picked.hour, picked.minute);
  return DateFormat('HH:mm').format(dateTime);
}

bool hasValidLocation(ProductLocation? location) {
  if (location == null) return false;

  final bool hasCoordinates = location.coordinates != UNKNOWN;
  final bool hasAddress =
      location.address != null && location.address != UNKNOWN;

  return hasCoordinates && hasAddress;
}

String getTicketIconPath(String tier) {
  switch (tier.toLowerCase()) {
    case kEarlyBirdTier:
      return earlyBirdTicketIconSVGPath;
    case kStandardTier:
      return standardTicketIconSVGPath;
    case kVIPTier:
      return vipTicketIconSVGPath;
    case kVVIPTier:
      return vvipTicketIconSVGPath;
    default:
      return standardTicketIconSVGPath;
  }
}

String getTicketDisplayName(String tier) {
  switch (tier.toLowerCase()) {
    case kEarlyBirdTier:
      return 'Early Bird';
    case kStandardTier:
      return 'Standard';
    case kVIPTier:
      return 'VIP';
    case kVVIPTier:
      return 'VVIP';
    default:
      return '';
  }
}

LatLng parseCoordinates(String? raw) {
  if (raw == null || raw.isEmpty) return const LatLng(0, 0);

  try {
    final String cleaned = raw.split('POINT (').last.split(')').first;
    final List<String> parts = cleaned.trim().split(' ');
    if (parts.length == 2) {
      final double lng = double.tryParse(parts[0]) ?? 0;
      final double lat = double.tryParse(parts[1]) ?? 0;
      return LatLng(lat, lng);
    }
  } catch (_) {
    return const LatLng(0, 0);
  }
  return const LatLng(0, 0);
}

Future<void> showFullDescriptionDialog({
  required BuildContext context,
  required String title,
  required String description,
}) {
  return showDialog(
    context: context,
    builder: (_) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: <Widget>[
            Text(
              aboutString(title),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            PrimaryButton(
              onPressed: () => context.router.maybePop(),
              child: right(okThanksString),
            ),
          ],
        ),
      ),
    ),
  );
}

/// Formats currency string with comma separators & currency code.
///
/// Example:
/// ```dart
/// formatCurrency(2500); // KES 2,500
/// formatCurrency(12500.75, currencyCode: 'USD'); // USD 12,500.75
/// ```
String formatCurrency(
  num amount, {
  String currencyCode = kDefaultCurrencyCode,
  int decimalDigits = 0,
}) {
  final NumberFormat formatter = NumberFormat.currency(
    symbol: '$currencyCode ',
    decimalDigits: decimalDigits,
    customPattern:
        '¤#,##0${decimalDigits > 0 ? '.${'0' * decimalDigits}' : ''}',
  );
  return formatter.format(amount);
}

Future<FilePickerResult?> pickMediaFiles({required UploadMediaType type}) {
  final List<String> extensions = switch (type) {
    UploadMediaType.PHOTO => kAllowedPhotoExtensions,
    UploadMediaType.VIDEO => kAllowedVideoExtensions,
  };

  return FilePicker.platform.pickFiles(
    allowMultiple: true,
    type: FileType.custom,
    allowedExtensions: extensions,
  );
}

bool isScheduleValid(ProductSchedule? schedule) {
  final bool isDateValid = schedule?.startDate != null &&
      schedule!.startDate!.isNotEmpty &&
      schedule.startDate != UNKNOWN &&
      schedule.endDate != null &&
      schedule.endDate!.isNotEmpty &&
      schedule.endDate != UNKNOWN;

  final bool isTimeValid = schedule?.startTime != null &&
      schedule!.startTime!.isNotEmpty &&
      schedule.startTime != UNKNOWN &&
      schedule.endTime != null &&
      schedule.endTime!.isNotEmpty &&
      schedule.endTime != UNKNOWN;

  return isDateValid && isTimeValid;
}

String? convertToLocalTimestamp(String? utcTimestamp) {
  if (utcTimestamp == null || utcTimestamp.isEmpty) return null;

  try {
    final DateTime localTime = DateTime.parse(utcTimestamp).toLocal();
    return localTime.toIso8601String();
  } catch (_) {
    return null;
  }
}

// Format the repeat notification based on the repeat type
String generateRepeatNotification(ProductSchedule? schedule) {
  if (schedule?.repeatType == 'daily') {
    return 'Repeats daily';
  } else if (schedule?.repeatType == 'weekly') {
    final List<String> days =
        schedule?.repeatWeekly?.map((RepeatWeeklySchedule weekday) {
              final String day = weekday.day ?? UNKNOWN;

              final String matched = kDaysOfTheWeek.firstWhere(
                (String d) => d.toLowerCase() == day,
                orElse: () => '',
              );

              return toBeginningOfSentenceCase(matched.substring(0, 3));
            }).toList() ??
            <String>[];

    return 'Repeats weekly on ${days.join(', ')}';
  } else if (schedule?.repeatType == 'monthly') {
    final List<int> monthDates = schedule?.repeatMonthly ?? <int>[];
    return 'Repeats every month on ${monthDates.join(', ')}';
  } else if (schedule?.repeatType == 'yearly') {
    return generateYearlyRepeat(
      schedule?.repeatYearly ?? <RepeatYearlySchedule>[],
    );
  } else {
    return 'Does not repeat';
  }
}

// Generate formatted yearly repeat notification
String generateYearlyRepeat(List<RepeatYearlySchedule> yearMonths) {
  final Map<String, List<int>> groupedByMonth = <String, List<int>>{};

  for (final RepeatYearlySchedule yearMonth in yearMonths) {
    final String monthName =
        toBeginningOfSentenceCase(yearMonth.month ?? UNKNOWN);

    final List<int> dates = yearMonth.repeatOnDateOfMonth ?? <int>[];

    if (dates.isEmpty) continue;

    groupedByMonth.putIfAbsent(monthName, () => <int>[]).addAll(dates);
  }

  final List<String> formatted =
      groupedByMonth.entries.map((MapEntry<String, List<int>> e) {
    final List<int> sorted = <int>[...e.value]..sort();
    final String datesStr = sorted.join(', ');
    return '${e.key} $datesStr';
  }).toList();

  return 'Repeats every year on ${formatted.join('; ')}';
}

/// “Mar” from “March” (capitalized first 3 letters)
String abbreviateMonth(String rawMonth) {
  if (rawMonth.isEmpty) return '';

  return toBeginningOfSentenceCase(rawMonth.substring(0, 3));
}

/// Remove one single date from a given month, dropping the month if empty
List<RepeatYearlySchedule> removeOneYearlyDate(
  List<RepeatYearlySchedule> schedules,
  String monthToRemove,
  int dateToRemove,
) {
  final String target = monthToRemove.toLowerCase();
  return schedules
      .map((RepeatYearlySchedule s) {
        if (s.month?.toLowerCase() == target) {
          final List<int> filtered = (s.repeatOnDateOfMonth ?? <int>[])
              .where((int d) => d != dateToRemove)
              .toList();
          return filtered.isEmpty
              ? null
              : s.copyWith(repeatOnDateOfMonth: filtered);
        }
        return s;
      })
      .whereType<RepeatYearlySchedule>()
      .toList();
}

String getMonthNameFromInt(int month) {
  const List<String> months = <String>[
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  return months[month - 1];
}
