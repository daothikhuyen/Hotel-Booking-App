import 'package:flutter/material.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';

extension ThemeContext on BuildContext {
  ThemeData get themeData => Theme.of(this);
  ColorScheme get colorScheme => themeData.colorScheme;
  IconThemeData get iconTheme => themeData.iconTheme;
  TextTheme get textTheme => themeData.textTheme;
  AppLocalizations get l10n => AppLocalizations.of(this);
}
