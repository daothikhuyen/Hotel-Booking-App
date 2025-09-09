import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_hotel_booking_app/l10n/app_localizations.dart';
import 'package:widgetbook_hotel_booking_app/main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App(
  cloudAddonsConfigs: {
    'Vietnamese': [widgetbook.LocalizationAddonConfig('vi')],
    'English': [widgetbook.LocalizationAddonConfig('en')],
  },
)
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        InspectorAddon(),
        AlignmentAddon(),
        ZoomAddon(),
        LocalizationAddon(
          locales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
        ),
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: lightMode,
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: darkMode
            ),
          ],
        ),
      ],
    );
  }
}
