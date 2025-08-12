import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/themes/app_colors.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: AppColors.backgroundLight,
    primary: AppColors.primaryLight,
    secondary: AppColors.secondaryLight,
    outline: AppColors.borderLight, // border
    onSurface: AppColors.textPrimaryLight,
    onSurfaceVariant: AppColors.textSecondaryLight, //subscript
    error: AppColors.error,
  ),
  iconTheme: IconThemeData(
    color: AppColors.iconLight, // màu icon riêng
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: GoogleFonts.jostTextTheme(),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: AppColors.backgroundDart,
    primary: AppColors.primaryDark,
    secondary: AppColors.secondaryDark,
    outline: AppColors.borderDark,
    onSurface: AppColors.textPrimaryDark,
    onSurfaceVariant: AppColors.textSecondaryDark,
    error: AppColors.error,
  ),
  iconTheme: IconThemeData(
    color: AppColors.iconDart, // màu icon riêng
  ),
  scaffoldBackgroundColor: const Color(0xFF000000),
  textTheme: GoogleFonts.jostTextTheme(ThemeData.dark().textTheme),
);

// customer textstyle
class CustomerTextStyles {
  static TextStyle hugeBoldTextStyle() {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w900,
      letterSpacing: 0.5,
    );
  }

  static TextStyle avBoldTextStyle(Color color) {
    return TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: color
    );
  }

  static TextStyle suitableTextStyle(Color color) {
    return TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: color);
  }

  static TextStyle suitableBoldTextStyle(Color color) {
    return TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: color);
  }

  static TextStyle prBoldTextStyle(Color color) {
    return TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w600);
  }

  static TextStyle prNormalTextStyle(Color color) {
    return TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.normal);
  }

  static TextStyle smallBoldTextStyle(Color color) {
    return TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.w600);
  }

  static TextStyle smallTextStyle(Color color) {
    return TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.normal);
  }
}
