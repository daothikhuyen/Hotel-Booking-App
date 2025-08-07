import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/routes/app_router.dart';
import 'package:hotel_booking_app/screens/onboarding/onboarding_screen.dart';
import 'package:hotel_booking_app/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        animationRouter(OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 123.2,
              width: 89.7,
              fit: BoxFit.cover,
            ),
            Text(
              'Grand Hotel',
              style: GoogleFonts.jost(
                textStyle: Theme.of(context).textTheme.displayMedium,
              ).copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              'Find Your Prefect Stay, Anytime, Anywhere',
              style: GoogleFonts.jost().copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
