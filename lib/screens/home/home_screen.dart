import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:hotel_booking_app/widgets/home/header_bar.dart';
import 'package:hotel_booking_app/widgets/home/sections/best_section.dart';
import 'package:hotel_booking_app/widgets/home/sections/map_section.dart';
import 'package:hotel_booking_app/widgets/home/sections/most_popular_section.dart';
import 'package:hotel_booking_app/widgets/home/sections/recomended_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderBar(
        linkImage: 'assets/images/avatar/Ellipse.png',
        userName: 'Matr Kohler',
        address: 'San Diego, CA',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, top: 8),
          child: SingleChildScrollView(
            // scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 16),
                  width: double.infinity,
                  height: 72,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    border: Border.all(
                      width: 1,
                      color: Theme.of(context).colorScheme.secondary,
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
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 32,
                              backgroundColor: Colors.white,
                              child: SvgPicture.asset(
                                'assets/images/icon/Frame.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context)!.locationTitle,
                              style: TextStyle(color: Colors.black),
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
                MostPopularSection(),
                // Recommendex For You
                RecomendedSection(),
                // Map
                MapSection(),
                // Best Today
                BestSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
