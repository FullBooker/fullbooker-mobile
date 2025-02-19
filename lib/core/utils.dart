import 'dart:math';
import 'package:flutter/material.dart';
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
          horizontal: 8.0, vertical: 10 // Inner padding for SnackBar content.
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
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return min(val, maxTextScaleFactor);
  }
}

LatLng parseSRID(String srid) {
  var cleanedSRID = RegExp(r"[\(][-?0-9.]+\s[-?0-9.]+[\)]")
      .firstMatch(srid)!
      .group(0)!
      .replaceAll(RegExp(r"[\(\)]"), "")
      .split(" ");
  return LatLng(double.parse(cleanedSRID[1]), double.parse(cleanedSRID[0]));
}
