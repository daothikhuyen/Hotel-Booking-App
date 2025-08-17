import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/core/themes/app_colors.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primaryLight,
    onPrimary: AppColors.greyscale0,
    secondary: AppColors.secondary50,
    onSecondary: AppColors.greyscale0,
    surface: AppColors.greyscale0,
    onSurface: AppColors.greyscale0,
    error: AppColors.error100,
    onError: AppColors.alter100,
    outline: AppColors.greyscale200, // border
    onSurfaceVariant: AppColors.greyscale900, //subscript
    tertiary: AppColors.greyscale500,
    onTertiary: AppColors.greyscale200,
    inversePrimary: AppColors.primary300,
    inverseSurface: AppColors.greyscale900,
    
  ),
  iconTheme: const IconThemeData(
    color: AppColors.greyscale900, // private color icon
  ),
  textTheme:customerTextThem(),
  scaffoldBackgroundColor: AppColors.greyscale0,
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primaryDark,
    onPrimary: AppColors.greyscale0,
    secondary: AppColors.secondary50,
    onSecondary: AppColors.greyscale0,
    surface: AppColors.greyscale900,
    onSurface: AppColors.greyscale0,
    outline: AppColors.borderDark,
    onSurfaceVariant: AppColors.greyscale0,
    error: AppColors.error100,
  ),
  iconTheme: const IconThemeData(
    color: AppColors.iconDart, // private color icon
  ),
  scaffoldBackgroundColor: AppColors.greyscale900,
  textTheme: customerTextThem(),
);

TextTheme customerTextThem(){
  return GoogleFonts.jostTextTheme().copyWith(
    // Heading
    displayLarge: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700), // heading_1
    displayMedium: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700), // heading_2
    displaySmall: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700), // heading_3, headingThree
    headlineLarge: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700), // bigTitle
    headlineMedium: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700), // title
    headlineSmall: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700), // paragraph

    // Caption & small text
    bodyLarge: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400), // caption
    bodyMedium: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400), // smallText
    bodySmall: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),

    // Buttons
    labelLarge: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600), // bigButton
    labelMedium: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600), // smallButton

    // Body variants
    titleLarge: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600), // bodyLargeSemibold
    titleMedium: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500), // bodyLargeMedium
    titleSmall: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400), // bodyLargeRegular

    // Extra body mappings
    labelSmall: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500), // bodyMediumMedium
  );
}
