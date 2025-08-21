import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/core/widgets/list/list_horizontal.dart';
import 'package:hotel_booking_app/core/widgets/list/list_vertical.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/features/auth/controller/auth_controller.dart';
import 'package:hotel_booking_app/features/auth/helpers/auth_provider.dart';
import 'package:hotel_booking_app/features/home/controller/hotel_controller.dart';
import 'package:hotel_booking_app/features/home/widgets/header_bar.dart';
import 'package:hotel_booking_app/features/home/widgets/list_popular.dart';
import 'package:hotel_booking_app/features/home/widgets/map_section.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthController authController = AuthController();
  int selectedIndex = 0;

  List<Hotel> hotelPopular = [];
  List<Hotel> hotelRecomended = [];
  List<Hotel> hotelBestToday = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final controller = Provider.of<HotelController>(context, listen: false);
      final popular = await controller.fetchMostPopularHotels(context);
      final recomended = await controller.fetchRecomendedHotels(context);
      final bestToday = await controller.fetchBestToday(context);

      setState(() {
        hotelPopular = popular;
        hotelRecomended = recomended;
        hotelBestToday = bestToday;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HotelController>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context);
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
                  ListPopular(hotelPopular),
                  // Recommendex For You
                  ListVertical(
                    hotelRecomended,
                    context.l10n.homeRecommended,
                    context.l10n.seeAll,
                  ),
                  // Map
                  const MapSection(),
                  // Best Today
                  ListHorizontal(
                    hotelBestToday,
                    context.l10n.bestToday,
                    context.l10n.seeAll,
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
