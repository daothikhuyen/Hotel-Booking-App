// private navigators
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/core/routes/page_routes.dart';
import 'package:hotel_booking_app/core/widgets/alter/page_alter_null.dart';
import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/features/auth/controller/auth_controller.dart';
import 'package:hotel_booking_app/features/auth/sign_in.dart';
import 'package:hotel_booking_app/features/hotel_detail/detail_screen.dart';
import 'package:hotel_booking_app/features/home/home_screen.dart';
import 'package:hotel_booking_app/features/layout/layout_scaffold.dart';
import 'package:hotel_booking_app/features/my_booking/my_booking_screen.dart';
import 'package:hotel_booking_app/features/onboarding/onboarding_screen.dart';
import 'package:hotel_booking_app/features/request_booking/booking_screen.dart';
import 'package:hotel_booking_app/features/request_booking/check_out.dart';
import 'package:hotel_booking_app/features/request_booking/page_sucess.dart';

final AuthController authController = AuthController();
final _rootNavigatorKey = GlobalKey<NavigatorState>();

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
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const SignIn(),
    ),
    GoRoute(
      path: PageRoutes.detailPage,
      parentNavigatorKey: _rootNavigatorKey,
      builder:(context, state) {
        final hotel = state.extra;

        if (hotel is Hotel) {
          return DetailScreen(hotel: hotel);
        }
        return const PageAlterNull();
      } ,       
    ),
    GoRoute(
      path: PageRoutes.checkout,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        final booking = state.extra;

        if (booking is Booking) {
          return CheckOut(booking: booking);
        }

        return const PageAlterNull();
      },
    ),
    GoRoute(
      path: PageRoutes.bookingSucess,
      parentNavigatorKey: _rootNavigatorKey,
      builder:(context, state) => const PageSucess(),
    ),
    GoRoute(
      path: PageRoutes.requestBooking,
      builder: (context, state) {
        final hotel = state.extra;

        if (hotel is Hotel) {
          return BookingScreen(hotel: hotel);
        }

        return const PageAlterNull();
      },
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
            ),
          ],
        ),
        // second branch (B)
        StatefulShellBranch(
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
