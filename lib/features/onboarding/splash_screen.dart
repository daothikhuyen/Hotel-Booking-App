import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/features/onboarding/onboarding_screen.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/routes/app_router.dart';

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
          children: [
            Image.asset(
              '${Assets.images.logoApp}',
              height: 123.2,
              width: 89.7,
              fit: BoxFit.cover,
            ),
            Text(
              'Grand Hotel', // Name app
              style: HBTextStyles.headingOne(context.colorScheme.onSurface),
            ),
            Text(
              context.l10n.titleSplash,
              style: HBTextStyles.bodyRegularSmall(
                context.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
