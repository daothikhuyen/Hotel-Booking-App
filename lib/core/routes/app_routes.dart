// private navigators
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/core/routes/page_routes.dart';
import 'package:hotel_booking_app/features/auth/controller/auth_controller.dart';
import 'package:hotel_booking_app/features/auth/sign_in.dart';
import 'package:hotel_booking_app/features/home/home_screen.dart';
import 'package:hotel_booking_app/features/layout/layout_scaffold.dart';
import 'package:hotel_booking_app/features/my_booking/my_booking_screen.dart';
import 'package:hotel_booking_app/features/onboarding/onboarding_screen.dart';

final AuthController authController = AuthController();
final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'HomeScreen');

// the one and only GoRouter instance
final goRouter = GoRouter(
  initialLocation:
      authController.isSignIn ? PageRoutes.homePage : PageRoutes.onBoarding,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: PageRoutes.onBoarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: PageRoutes.signIn,
      builder: (context, state) => const SignIn(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // the UI shell
        return LayoutScaffold(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: PageRoutes.homePage,
              builder: (context, state) => const HomeScreen(),
              routes: [
                // child route
                GoRoute(
                  path: PageRoutes.detailPage,
                  builder: (context, state) => const MyBookingScreen(),
                ),
              ],
            ),
          ],
        ),
        // second branch (B)
        StatefulShellBranch(
          // navigatorKey: _shellNavigatorBKey,
          routes: [
            GoRoute(
              path: PageRoutes.myBooking,
              builder: (context, state) => const MyBookingScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
