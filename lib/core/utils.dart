import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fullbooker/config/environments.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/value_objects/app_config.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/entities/regexes.dart';
import 'package:map_location_picker/map_location_picker.dart';

String getFileExtension(String fileName) {
  try {
    return fileName.split('.').last;
  } catch (e) {
    return '';
  }
}

void showSnackBar(String message, BuildContext context, {int duration = 5000}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          // Code to execute.
        },
      ),
      content: Text(message),
      duration: Duration(milliseconds: duration),
      width: 340, // Width of the SnackBar.
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0, vertical: 10, // Inner padding for SnackBar content.
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.red,
    ),
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

final AppConfig devAppConfig = AppConfig(
  appContext: AppContext.dev,
  databaseName: kDevDatabaseName,
  sentryDsn: '',
  environment: AppEnvironment.dev.name,
  applicationName: kDevAppName,
);

final AppConfig prodAppConfig = AppConfig(
  appContext: AppContext.prod,
  databaseName: kProdDatabaseName,
  sentryDsn: '',
  environment: AppEnvironment.prod.name,
  applicationName: kAppName,
);

final AppConfig testAppConfig = AppConfig(
  appContext: AppContext.test,
  databaseName: kDevDatabaseName,
  sentryDsn: '',
  environment: AppEnvironment.dev.name,
  applicationName: kDevAppName,
);
