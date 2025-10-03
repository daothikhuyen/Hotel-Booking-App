// private navigators
import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/routing/animation.dart';
import 'package:hotel_booking_app/ui/core/core.dart';
import 'package:hotel_booking_app/ui/core/widgets/alter/page_alter_null.dart';
import 'package:hotel_booking_app/ui/features/auth/sign_in.dart';
import 'package:hotel_booking_app/ui/features/auth/view_model/auth_controller.dart';
import 'package:hotel_booking_app/ui/features/booking_detail/booking_detail_screen.dart';
import 'package:hotel_booking_app/ui/features/chat/chat_screen.dart';
import 'package:hotel_booking_app/ui/features/home/home_screen.dart';
import 'package:hotel_booking_app/ui/features/home/view_model/hotel_controller.dart';
import 'package:hotel_booking_app/ui/features/home/view_model/navigation_controller.dart';
import 'package:hotel_booking_app/ui/features/home/view_model/search_hotel_controller.dart';
import 'package:hotel_booking_app/ui/features/hotel_detail/detail_screen.dart';
import 'package:hotel_booking_app/ui/features/hotel_detail/view_model/hotel_detail_controller.dart';
import 'package:hotel_booking_app/ui/features/layout/layout_scaffold.dart';
import 'package:hotel_booking_app/ui/features/my_booking/my_booking_screen.dart';
import 'package:hotel_booking_app/ui/features/my_booking/view_model/my_booking_controller.dart';
import 'package:hotel_booking_app/ui/features/onboarding/onboarding_screen.dart';
import 'package:hotel_booking_app/ui/features/profile/profile_screen.dart';
import 'package:hotel_booking_app/ui/features/profile/widgets/sections/language.dart';
import 'package:hotel_booking_app/ui/features/profile/widgets/sections/personal_info.dart';
import 'package:hotel_booking_app/ui/features/request_booking/booking_screen.dart';
import 'package:hotel_booking_app/ui/features/request_booking/check_out.dart';
import 'package:hotel_booking_app/ui/features/request_booking/page_sucess.dart';
import 'package:hotel_booking_app/ui/features/request_booking/view_model/booking_controller.dart';
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
          return animationRouter(
            MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => HotelDetailController(),
                ),
                ChangeNotifierProvider(create: (context) => HotelController()),
              ],
              child: DetailScreen(hotel: hotel),
            ),
            state,
          );
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
          return animationRouter(
            MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => BookingController(),
                ),
                ChangeNotifierProvider(
                  create: (context) => MyBookingController(),
                ),
              ],
              child: CheckOut(booking: booking),
            ),
            state,
          );
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
        return animationRouter(
          ChangeNotifierProvider(
            create: (context) => HotelController(),
            child: SeeAllScreen(index: index ?? 0),
          ),
          state,
        );
      },
    ),
    GoRoute(
      path: PageRoutes.search,
      pageBuilder: (context, state) {
        var recommendedHotels = <Hotel>[];

        if (state.extra != null && state.extra is List<Hotel>) {
          recommendedHotels = (state.extra ?? []) as List<Hotel>;
        }
        return animationRouter(
          ChangeNotifierProvider(
            create: (context) => SearchHotelController(),
            child: SearchScreen(listHotelRecommentd: recommendedHotels),
          ),
          state,
        );
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
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => HotelController()),
            ChangeNotifierProvider(create: (context) => NavigationController()),
          ],
          child: LayoutScaffold(navigationShell: navigationShell),
        );
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
                  (context, state) => animationRouter(
                    ChangeNotifierProvider(
                      create: (context) => MyBookingController(),
                      child: const MyBookingScreen(),
                    ),
                    state,
                  ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: PageRoutes.chat,
              pageBuilder:
                  (context, state) =>
                      animationRouter(const ChatScreen(), state),
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
