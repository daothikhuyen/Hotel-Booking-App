import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/controller/hotel_controller.dart';
import 'package:hotel_booking_app/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:hotel_booking_app/model/hotel.dart';
import 'package:hotel_booking_app/widgets/header_bar.dart';
import 'package:hotel_booking_app/widgets/list/best_section.dart';
import 'package:hotel_booking_app/screens/home/widgets/map_section.dart';
import 'package:hotel_booking_app/screens/home/widgets/most_popular_section.dart';
import 'package:hotel_booking_app/widgets/list/recomended_section.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Hotel> hotelPopular = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final controller = Provider.of<HotelController>(context, listen: false);
      hotelPopular = await controller.fetchMostPopularHotels();
    });
  }

  @override
  Widget build(BuildContext context) {

    final controller = Provider.of<HotelController>(context, listen: false);

    return Scaffold(
      appBar: const HeaderBar(
        linkImage: 'assets/images/avatar/Ellipse.png',
        userName: 'Matr Kohler',
        address: 'San Diego, CA',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, top: 8),
          child: SingleChildScrollView(
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
                              style: TextStyle(
                                color: context.colorScheme.inverseSurface,
                              ),
                            ),
                          ],
                        ),

                        SvgPicture.asset(
                          'assets/images/icon/FrameArrow.svg',
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ),
                // Most Popular
                MostPopularSection(hotelPopular),
                // Recommendex For You
                const RecomendedSection(),
                // Map
                const MapSection(),
                // Best Today
                const BestSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
