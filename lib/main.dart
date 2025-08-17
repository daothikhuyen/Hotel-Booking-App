import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hotel_booking_app/features/detail/detail_screen.dart';
import 'package:hotel_booking_app/features/home/controller/hotel_controller.dart';
import 'package:hotel_booking_app/features/home/controller/navigation_controller.dart';
import 'package:hotel_booking_app/firebase_options.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:hotel_booking_app/features/home/main_home_screen.dart';
import 'package:hotel_booking_app/features/onboarding/onboarding_screen.dart';
import 'package:hotel_booking_app/features/auth/services/auth_service.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder:
          (context) => MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => HotelController()),
              ChangeNotifierProvider(
                create: (context) => NavigationController(),
              ),
            ],
            child: const MyApp(),
          ), // Wrap your app
    ),
    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (context) => HotelController()),
    //     ChangeNotifierProvider(create: (context) => NavigationController()),
    //   ],
    //   child: const MyApp(),
    // ),
    // Wrap your app
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('vi'), // Spanish
      ],
      locale: const Locale('en'),
      home: StreamBuilder(
        stream: AuthService().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MainHomeScreen();
          } else {
            return const OnboardingScreen();
          }
        },
      ),
    );
  }
}
