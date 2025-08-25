import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/core/themes/app_colors.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primaryLight,
    secondary: AppColors.secondary50,
    onSecondary: AppColors.greyscale0,
    onSurface: AppColors.greyscale900, // color text
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
  textTheme: GoogleFonts.jostTextTheme(),
  scaffoldBackgroundColor: AppColors.greyscale0,
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primaryDark,
    onPrimary: AppColors.greyscale0,
    secondary: AppColors.secondary50,
    onSecondary: AppColors.greyscale0,
    onSurface: AppColors.greyscale900,
    outline: AppColors.borderDark,
    onSurfaceVariant: AppColors.greyscale900,
    error: AppColors.error100,
  ),
  iconTheme: const IconThemeData(
    color: AppColors.iconDart, // private color icon
  ),
  textTheme: GoogleFonts.jostTextTheme(),
  scaffoldBackgroundColor: AppColors.greyscale900,
);

// customer textstyle
class HBTextStyles {
  static TextStyle headingOne(Color color) {
    return GoogleFonts.jost().copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w900,
      color: color,
    );
  }

  static TextStyle headingTwo(Color color) {
    return GoogleFonts.jost().copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  static TextStyle headingThree(Color color) {
    return GoogleFonts.jost().copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: color,
      letterSpacing: 1.5,
    );
  }

  static TextStyle bigTitle(Color color) {
    return GoogleFonts.jost().copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  static TextStyle title(Color color) {
    return GoogleFonts.jost().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w900,
      color: color,
    );
  }

  static TextStyle paragraph(Color color) {
    return GoogleFonts.jost().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle caption(Color color) {
    return GoogleFonts.jost().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle smallButton(Color color) {
    return GoogleFonts.jost().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle bigButton(Color color) {
    return GoogleFonts.jost().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  static TextStyle smallText(Color color) {
    return GoogleFonts.jost().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle bodySemiboldXLarge(Color color) {
    return GoogleFonts.jost().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle bodyMediumXLarge(Color color) {
    return GoogleFonts.jost().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle bodySemiboldLarge(Color color) {
    return GoogleFonts.jost().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle bodyMediumLarge(Color color) {
    return GoogleFonts.jost().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle bodyRegularLarge(Color color) {
    return GoogleFonts.jost().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle bodySemiboldMedium(Color color) {
    return GoogleFonts.jost().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle bodyMediumMedium(Color color) {
    return GoogleFonts.jost().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle bodyRegularMedium(Color color) {
    return GoogleFonts.jost().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle bodySemiboldSmall(Color color) {
    return GoogleFonts.jost().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle bodyMediumSmall(Color color) {
    return GoogleFonts.jost().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle bodyRegularSmall(Color color, {double letterSpacing = 0}) {
    return GoogleFonts.jost().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle bodySemiboldXSmall(Color color) {
    return GoogleFonts.jost().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle bodyMediumXSmall(
    Color color, {
    TextDecoration? decoration,
    Color? decorationColor,
    double? decorationThickness,
  }) {
    return GoogleFonts.jost().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: color,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationThickness: decorationThickness,
    );
  }

  static TextStyle bodyRegularXSmall(Color color) {
    return GoogleFonts.jost().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }
}
