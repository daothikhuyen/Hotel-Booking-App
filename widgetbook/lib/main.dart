import 'package:flutter/material.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:hotel_booking_app/themes/theme.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_HotelBookingApp/main.directories.g.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// This file does not exist yet,
// it will be generated in the next step
// import 'main.directories.g.dart';

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
        // ViewportAddon([
        //   IosViewports.iPad
        // ]),
        // ignore: deprecated_member_use
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhoneSE,
            Devices.ios.iPhone13,
            Devices.android.smallTablet,
            Devices.android.samsungGalaxyS20
          ],
        ),
        InspectorAddon(),
        AlignmentAddon(),
        ZoomAddon(),
        LocalizationAddon(
          locales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
        ),
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Light', data: lightMode),
            WidgetbookTheme(name: 'Dark', data: darkMode),
          ],
        ),
      ],
    );
  }
}
