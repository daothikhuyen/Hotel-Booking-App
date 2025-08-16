import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:hotel_booking_app/routes/app_router.dart';
import 'package:hotel_booking_app/features/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.push(context, animationRouter(const OnboardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logoApp.png',
              height: 123.2,
              width: 89.7,
              fit: BoxFit.cover,
            ),
            Text(
              'Grand Hotel',
              style: GoogleFonts.jost(
                textStyle: context.textTheme.displayLarge!.copyWith(
                  color: context.colorScheme.onSurface,
                ),
              ),
            ),
            Text(
              AppLocalizations.of(context)!.titleSplash,
              style: context.textTheme.bodyMedium!.copyWith(
                color: context.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
