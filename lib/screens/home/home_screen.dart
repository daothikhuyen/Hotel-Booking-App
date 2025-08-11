import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/theme/app_colors.dart';
import 'package:hotel_booking_app/widgets/home/card_most_popular.dart';
import 'package:hotel_booking_app/widgets/home/header_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 51.0, child: HeaderBar()),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: double.infinity,
                height: 72,
                decoration: BoxDecoration(
                  color: AppColors.second_primary,
                  border: Border.all(width: 1, color: AppColors.second_primary),
                  borderRadius: BorderRadius.circular(15),
                ),
                // color: AppColors.second_primary,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 20,
                    top: 16,
                    bottom: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                            'You Can Change Your Location to\n show nearby villas',
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
            ),
            // Most Popular
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Most Popular',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'See All',
                          style: GoogleFonts.plusJakartaSans().copyWith(
                            fontSize: 12,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 225,
                    child: Scrollbar(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return CardMostPopular();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Recommendex For You
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recommended For You',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Row(children: [
                          
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'See All',
                          style: GoogleFonts.plusJakartaSans().copyWith(
                            fontSize: 12,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 225,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return CardMostPopular();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
