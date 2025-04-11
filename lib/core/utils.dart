import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fullbooker/config/environments.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/entities/regexes.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:intl/intl.dart';
import 'package:map_location_picker/map_location_picker.dart';

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
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          spacing: 16,
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
            SizedBox(
              width: double.infinity,
              height: 48,
              child: SecondaryButton(
                child: right(confirmText ?? okThanksString),
                onPressed: onConfirm ?? () => context.router.maybePop(),
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
  return expiresAt.difference(now).inMinutes < 10;
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
  if (showYear) formatStrings.add('y');
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

Widget formatTime({
  String? rawTime,
  TimeOfDay? timeOfDay,
  TextStyle? textStyle,
}) {
  if ((rawTime == null || rawTime.isEmpty) && timeOfDay == null) {
    return const SizedBox();
  }

  late DateTime parsedTime;

  if (timeOfDay != null) {
    parsedTime = DateTime(0, 1, 1, timeOfDay.hour, timeOfDay.minute);
  } else {
    try {
      parsedTime = DateFormat('HH:mm:ss').parse(rawTime!);
    } catch (_) {
      return const SizedBox();
    }
  }

  final String formatted = DateFormat('h:mm a').format(parsedTime);

  return Text(
    formatted,
    style: textStyle ??
        TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w200,
          color: AppColors.bodyTextColor.withValues(alpha: .35),
          fontStyle: FontStyle.italic,
        ),
  );
}

void navigateToNextProductStep({
  required BuildContext context,
  required Product product,
}) {
  if (product.completed ?? false) {
    context.router.push(const ProductDetailRoute());
  }

  if ((product.name?.isEmpty ?? true) ||
      (product.description?.isEmpty ?? true)) {
    context.router.push(const ProductBasicDetailsRoute());
    return;
  }

  if (product.locations == null || product.locations!.isEmpty) {
    context.router.push(const ProductLocationRoute());
    return;
  }

  final bool hasAvailability = product.availability != null &&
      (product.availability?.start?.isNotEmpty ?? false) &&
      (product.availability?.end?.isNotEmpty ?? false);

  if (!hasAvailability) {
    context.router.push(const ProductDateTimeRoute());
    return;
  }

  if (product.image == null ||
      product.image?.file == null ||
      product.image?.file == UNKNOWN) {
    context.router.push(const ProductPhotosRoute());
    return;
  }

  if (product.pricing == null || product.pricing!.isEmpty) {
    context.router.push(const ProductPricingRoute());
    return;
  }

  if (product.completed != true) {
    context.router.push(const ProductReviewAndSubmitRoute());
    return;
  }
}
