import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hotel_booking_app/core/routes/app_routes.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/features/auth/controller/auth_controller.dart';
import 'package:hotel_booking_app/features/auth/helpers/local_storage_helper.dart';
import 'package:hotel_booking_app/features/home/controller/hotel_controller.dart';
import 'package:hotel_booking_app/features/home/controller/navigation_controller.dart';
import 'package:hotel_booking_app/features/hotel_detail/controller/hotel_detail_controller.dart';
import 'package:hotel_booking_app/features/my_booking/controller/my_booking_controller.dart';
import 'package:hotel_booking_app/features/profile/controller/profile_controller.dart';
import 'package:hotel_booking_app/features/request_booking/controller/booking_controller.dart';
import 'package:hotel_booking_app/firebase_options.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final localUser = await LocalStorageHelper.getUserData();
  await authController.isLoggedIn();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HotelController()),
        ChangeNotifierProvider(create: (context) => NavigationController()),
        ChangeNotifierProvider(create: (context) => HotelDetailController()),
        ChangeNotifierProvider(create: (context) => ProfileController()),
        ChangeNotifierProvider(
          create: (context) => BookingController(),
        ), // request booking
        ChangeNotifierProvider(create: (context) => MyBookingController()),
        ChangeNotifierProvider(
          create: (_) {
            final userController = AuthController();
            if (localUser != null) userController.setUser(localUser);
            return userController;
          },
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ProfileController>(context);

    return MaterialApp.router(
      title: 'Hotel Booking App',
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
        Locale('vi'), // vietnamese
      ],
      locale: controller.locale,
    );
  }
}
