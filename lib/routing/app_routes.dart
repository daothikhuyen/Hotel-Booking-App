// private navigators
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/routing/animation.dart';
import 'package:hotel_booking_app/routing/page_routes.dart';
import 'package:hotel_booking_app/ui/core/widgets/alter/page_alter_null.dart';
import 'package:hotel_booking_app/ui/features/auth/sign_in.dart';
import 'package:hotel_booking_app/ui/features/auth/view_model/auth_controller.dart';
import 'package:hotel_booking_app/ui/features/booking_detail/booking_detail_screen.dart';
import 'package:hotel_booking_app/ui/features/home/home_screen.dart';
import 'package:hotel_booking_app/ui/features/hotel_detail/detail_screen.dart';
import 'package:hotel_booking_app/ui/features/layout/layout_scaffold.dart';
import 'package:hotel_booking_app/ui/features/my_booking/my_booking_screen.dart';
import 'package:hotel_booking_app/ui/features/onboarding/onboarding_screen.dart';
import 'package:hotel_booking_app/ui/features/profile/profile_screen.dart';
import 'package:hotel_booking_app/ui/features/profile/widgets/sections/language.dart';
import 'package:hotel_booking_app/ui/features/profile/widgets/sections/personal_info.dart';
import 'package:hotel_booking_app/ui/features/request_booking/booking_screen.dart';
import 'package:hotel_booking_app/ui/features/request_booking/check_out.dart';
import 'package:hotel_booking_app/ui/features/request_booking/page_sucess.dart';
import 'package:hotel_booking_app/ui/features/search/search_screen.dart';
import 'package:hotel_booking_app/ui/features/seeAll/see_all_screen.dart';

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
      pageBuilder:
          (context, state) => animationRouter(const OnboardingScreen(), state),
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
    GoRoute(
      path: PageRoutes.seeAllPage,
      pageBuilder: (context, state) {
        final index = int.tryParse(state.extra?.toString() ?? '');
        return animationRouter(SeeAllScreen(index: index ?? 0), state);
      },
    ),
    GoRoute(
      path: PageRoutes.search,
      pageBuilder: (context, state) {
        return animationRouter(const SearchScreen(), state);
      },
    ),
    GoRoute(
      path: PageRoutes.personalInfo,
      pageBuilder: (context, state) {
        return animationRouter(const PersonalInfo(), state);
      },
    ),
    GoRoute(
      path: PageRoutes.language,
      pageBuilder: (context, state) {
        return animationRouter(const Language(), state);
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
        StatefulShellBranch(routes: const []),
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
