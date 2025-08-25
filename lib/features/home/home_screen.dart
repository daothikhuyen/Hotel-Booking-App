import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/core/widgets/list/list_horizontal.dart';
import 'package:hotel_booking_app/core/widgets/list/list_vertical.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/features/auth/controller/auth_controller.dart';
import 'package:hotel_booking_app/features/home/controller/hotel_controller.dart';
import 'package:hotel_booking_app/features/home/widgets/header_bar.dart';
import 'package:hotel_booking_app/features/home/widgets/list_popular.dart';
import 'package:hotel_booking_app/features/home/widgets/map_section.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Hotel> hotelPopular = [];
  List<Hotel> hotelRecomended = [];
  List<Hotel> hotelBestToday = [];
  late final HotelController controller;

  @override
  void initState() {
    super.initState();
    controller = Provider.of<HotelController>(context, listen: false);
  }

  Future<void> _loadPopularHotels() async {
    final popular = await controller.fetchMostPopularHotels(context);
    setState(() {
      hotelPopular = popular;
    });
  }

  Future<void> _loadRecomendedHotels() async {
    final recommended = await controller.fetchRecomendedHotels(context);
    setState(() {
      hotelRecomended = recommended;
    });
  }

  Future<void> _loadBestTodayHotels() async {
    final bestToday = await controller.fetchBestToday(context);
    setState(() {
      hotelBestToday = bestToday;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthController>(context);
    final user = userProvider.currentUser;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: context.colorScheme.surface,
            expandedHeight: 75,
            toolbarHeight: 75,
            elevation: 0,
            shadowColor: Colors.black54,
            pinned: true,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 18, top: 30),
                  child: SizedBox(
                    height: 60,
                    child: HeaderBar(
                      linkImage: user?.photoURL ?? '',
                      userName: user?.displayName ?? '',
                      location: user?.location ?? '', // location now
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 18, top: 8),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    width: double.infinity,
                    height: 72,
                    decoration: BoxDecoration(
                      color: context.colorScheme.secondary,
                      border: Border.all(
                        width: 1.02,
                        color: context.colorScheme.secondary,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        // left: 5,
                        right: 20,
                        top: 16,
                        bottom: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 32,
                                backgroundColor:
                                    context.colorScheme.onSecondary,
                                child: SvgPicture.asset(
                                  Assets.images.icon.frame,
                                ),
                              ),
                              Text(
                                context.l10n.locationTitle,
                                style: HBTextStyles.bodyRegularSmall(
                                  context.colorScheme.inverseSurface,
                                ),
                              ),
                            ],
                          ),

                          SvgPicture.asset(Assets.images.icon.frameArrow),
                        ],
                      ),
                    ),
                  ),
                  // Most Popular
                  VisibilityDetector(
                    key: const Key('popular-section'),
                    onVisibilityChanged: (info) {
                      if (info.visibleFraction > 0.1 && hotelPopular.isEmpty) {
                        _loadPopularHotels();
                      }
                    },
                    child: ListPopular(
                      hotelPopular,
                      hotelPopular.length < 3 ? hotelPopular.length : 3,
                    ),
                  ),

                  // Recommendex For You
                  VisibilityDetector(
                    key: const Key('recommended-section'),
                    onVisibilityChanged: (info) {
                      if (info.visibleFraction > 0.1 && hotelPopular.isEmpty) {
                        _loadRecomendedHotels();
                      }
                    },
                    child: ListVertical(
                      hotelRecomended,
                      context.l10n.homeRecommended,
                      context.l10n.seeAll,
                      hotelRecomended.length < 3 ? hotelRecomended.length : 3,
                    ),
                  ),
                  // Map
                  MapSection(title: context.l10n.nearYou),
                  // Best Today
                  VisibilityDetector(
                    key: const Key('bestToday-section'),
                    onVisibilityChanged: (info) {
                      if (info.visibleFraction > 0.1 &&
                          hotelBestToday.isEmpty) {
                        _loadBestTodayHotels();
                      }
                    },
                    child: ListHorizontal(
                      hotelBestToday,
                      context.l10n.bestToday,
                      context.l10n.seeAll,
                      hotelBestToday.length < 3 ? hotelBestToday.length : 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
