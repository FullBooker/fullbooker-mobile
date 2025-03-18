// Flutter imports:
import 'package:flutter/material.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.pageBgColor,
      cardColor: Colors.white,
      dividerColor: AppColors.bodyTextColor,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.pageBgColor,
        contentTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.5,
          color: AppColors.primaryColor,
        ),
      ),
      chipTheme: ChipThemeData(
        side: BorderSide.none,
        selectedColor: AppColors.primaryColor,
        // backgroundColor: AppColors.actionBgColor,
        deleteIconColor: AppColors.primaryColor,
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.5,
          color: AppColors.primaryColor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.inputBackgroundColor,
        outlineBorder: BorderSide(color: Colors.grey),
        alignLabelWithHint: true,
        contentPadding: const EdgeInsets.all(12),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.bodyTextColor),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor.withValues(alpha: 0.4),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusColor: AppColors.primaryColor.withValues(alpha: 0.4),
      ),
      textTheme: GoogleFonts.openSansTextTheme().copyWith(
        displayLarge:
            TextStyle(fontSize: 57, fontWeight: FontWeight.bold, height: 1.12),
        displayMedium:
            TextStyle(fontSize: 45, fontWeight: FontWeight.bold, height: 1.16),
        displaySmall:
            TextStyle(fontSize: 36, fontWeight: FontWeight.bold, height: 1.22),
        headlineLarge:
            TextStyle(fontSize: 32, fontWeight: FontWeight.w700, height: 1.25),
        headlineMedium:
            TextStyle(fontSize: 28, fontWeight: FontWeight.w600, height: 1.29),
        headlineSmall:
            TextStyle(fontSize: 24, fontWeight: FontWeight.w500, height: 1.33),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          height: 1.27,
          color: AppColors.textBlackColor,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.5,
          color: AppColors.textBlackColor,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 1.43,
          color: AppColors.textBlackColor,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.5,
          color: AppColors.bodyTextColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 1.43,
          color: AppColors.bodyTextColor,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 1.33,
          color: AppColors.bodyTextColor,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 1.43,
          color: AppColors.bodyTextColor,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 1.33,
          color: AppColors.bodyTextColor,
        ),
        labelSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          height: 1.45,
          color: AppColors.bodyTextColor,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.pageBgColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.pageBgColor,
      ),
      useMaterial3: false,
      primaryColor: AppColors.primaryColor,
      primaryColorDark: AppColors.primaryColor,
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryColor,
        secondary: AppColors.backgroundColor,
        onSurfaceVariant: AppColors.backgroundColor,
        tertiary: AppColors.bodyTextColor,
      ),
      textSelectionTheme:
          TextSelectionThemeData(selectionColor: AppColors.primaryColor),
    ).copyWith(
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
        },
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          textStyle: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
