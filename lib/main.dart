import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hotel_booking_app/firebase_options.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:hotel_booking_app/routing/app_routes.dart';
import 'package:hotel_booking_app/ui/core/core.dart';
import 'package:hotel_booking_app/ui/features/auth/view_model/auth_controller.dart';
import 'package:hotel_booking_app/ui/features/profile/view_model/profile_controller.dart';
import 'package:hotel_booking_app/utils/helpers/local_storage_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final localUser = await LocalStorageHelper.getUserData();
  await authController.isLoggedIn();
  runApp(
    DevicePreview(
      builder:
          (context) => MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => ProfileController()),
              ChangeNotifierProvider(
                create: (_) {
                  final userController = AuthController();
                  if (localUser != null) userController.setUser(localUser);
                  return userController;
                },
              ),
            ],
            child: const MyApp(),
          ), // Wrap your app
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

    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
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
      },
    );
  }
}
