import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hotel_booking_app/core/routes/app_routes.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/features/auth/helpers/auth_provider.dart';
import 'package:hotel_booking_app/features/auth/helpers/local_storage_helper.dart';
import 'package:hotel_booking_app/features/home/controller/hotel_controller.dart';
import 'package:hotel_booking_app/features/home/controller/navigation_controller.dart';
import 'package:hotel_booking_app/firebase_options.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final localUser = await LocalStorageHelper.getUserData();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HotelController()),
        ChangeNotifierProvider(create: (context) => NavigationController()),
        ChangeNotifierProvider(
          create: (_) {
            final userProvider = UserProvider();
            if (localUser != null) userProvider.setUser(localUser);
            return userProvider;
          },
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('vi'), // Spanish
      ],
      locale: const Locale('en'),
      // home: StreamBuilder(
      //   stream: AuthService().authStateChanges,
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       return const MainHomeScreen();
      //     } else {
      //       return const OnboardingScreen();
      //     }
      //   },
      // ),
    );
  }
}
