import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/features/home/controller/hotel_controller.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/features/auth/services/auth_service.dart';
import 'package:hotel_booking_app/features/home/widgets/header_bar.dart';
import 'package:hotel_booking_app/core/widgets/list/list_horizontal.dart';
import 'package:hotel_booking_app/features/home/widgets/map_section.dart';
import 'package:hotel_booking_app/features/home/widgets/list_popular.dart';
import 'package:hotel_booking_app/core/widgets/list/list_vertical.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  User? currentUser;

  List<Hotel> hotelPopular = [];
  List<Hotel> hotelRecomended = [];
  List<Hotel> hotelBestToday = [];

  @override
  void initState() {
    super.initState();

    _loadCurrentUser();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final controller = Provider.of<HotelController>(context, listen: false);
      final popular = await controller.fetchMostPopularHotels();
      final recomended = await controller.fetchRecomendedHotels();
      final bestToday = await controller.fetchBestToday();

      setState(() {
        hotelPopular = popular;
        hotelRecomended = recomended;
        hotelBestToday = bestToday;
      });
    });
  }

  Future<void> _loadCurrentUser() async {
    final AuthService authService = AuthService();

    final User? user = await authService.getCurrentUser();
    setState(() {
      currentUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HotelController>(context, listen: false);

    return Scaffold(
      appBar: null,
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
                      linkImage: currentUser?.photoURL ?? '',
                      userName: currentUser?.email ?? '',
                      address: 'San Diego, CA',
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
                        width: 1,
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
                                backgroundColor: Colors.white,
                                child: SvgPicture.asset(
                                  Assets.images.icon.frame,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Text(
                                AppLocalizations.of(context)!.locationTitle,
                                style: GoogleFonts.jost(
                                  color: context.colorScheme.inverseSurface,
                                ),
                              ),
                            ],
                          ),

                          SvgPicture.asset(
                            Assets.images.icon.frameArrow,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Most Popular
                  ListPopular(hotelPopular),
                  // Recommendex For You
                  ListVertical(
                    hotelRecomended,
                    AppLocalizations.of(context)!.homeRecommended,
                    AppLocalizations.of(context)!.seeAll,
                  ),
                  // Map
                  MapSection(title: AppLocalizations.of(context)!.nearYou,),
                  // Best Today
                  ListHorizontal(
                    hotelBestToday,
                    AppLocalizations.of(context)!.bestToday,
                    AppLocalizations.of(context)!.seeAll,
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
