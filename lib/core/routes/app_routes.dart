// private navigators
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/core/routes/animation.dart';
import 'package:hotel_booking_app/core/routes/page_routes.dart';
import 'package:hotel_booking_app/core/widgets/alter/page_alter_null.dart';
import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/features/auth/controller/auth_controller.dart';
import 'package:hotel_booking_app/features/auth/sign_in.dart';
import 'package:hotel_booking_app/features/booking_detail/booking_detail_screen.dart';
import 'package:hotel_booking_app/features/home/home_screen.dart';
import 'package:hotel_booking_app/features/hotel_detail/detail_screen.dart';
import 'package:hotel_booking_app/features/layout/layout_scaffold.dart';
import 'package:hotel_booking_app/features/my_booking/my_booking_screen.dart';
import 'package:hotel_booking_app/features/onboarding/onboarding_screen.dart';
import 'package:hotel_booking_app/features/profile/profile_screen.dart';
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
      pageBuilder: (context, state) => animationRouter(const SignIn(), state),
    ),
    GoRoute(
      path: PageRoutes.detailPage,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        final hotel = state.extra;

        if (hotel is Hotel) {
          return animationRouter(DetailScreen(hotel: hotel), state);
        }
        return animationRouter(const PageAlterNull(), state);
      },
    ),
    GoRoute(
      path: PageRoutes.bookingDetail,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        final booking = state.extra;

        if (booking is Booking) {
          return animationRouter(BookingDetailScreen(booking: booking), state);
        }

        return animationRouter(const PageAlterNull(), state);
      },
    ),
    GoRoute(
      path: PageRoutes.checkout,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        final booking = state.extra;

        if (booking is Booking) {
          return animationRouter(CheckOut(booking: booking), state);
        }

        return animationRouter(const PageAlterNull(), state);
      },
    ),
    GoRoute(
      path: PageRoutes.bookingSucess,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder:
          (context, state) => animationRouter(const PageSucess(), state),
    ),
    GoRoute(
      path: PageRoutes.requestBooking,
      pageBuilder: (context, state) {
        final hotel = state.extra;

        if (hotel is Hotel) {
          return animationRouter(BookingScreen(hotel: hotel), state);
        }

        return animationRouter(const PageAlterNull(), state);
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
              pageBuilder:
                  (context, state) =>
                      animationRouter(const HomeScreen(), state),
            ),
          ],
        ),
        // second branch (B)
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: PageRoutes.myBooking,
              pageBuilder:
                  (context, state) =>
                      animationRouter(const MyBookingScreen(), state),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: PageRoutes.homePage,
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: PageRoutes.profile,
              pageBuilder:
                  (context, state) =>
                      animationRouter(const ProfileScreen(), state),
            ),
          ],
        ),
      ],
    ),
  ],
);
