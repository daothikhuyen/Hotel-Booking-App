import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:hotel_booking_app/widgets/home/card_most_popular.dart';
import 'package:hotel_booking_app/widgets/home/header_bar.dart';
import 'package:hotel_booking_app/widgets/home/title_with_btn.dart';

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
        // scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            SizedBox(height: 51.0, child: HeaderBar(linkImage: 'assets/images/avatar/Ellipse.png', userName: 'Matr Kohler', address: 'San Diego, CA')),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
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
            ),
            // Most Popular
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 13),
              child: Column(
                children: [
                  TitleWithBtn(
                    title: AppLocalizations.of(context)!.mostPopular,
                    titleBtn: AppLocalizations.of(context)!.seeAll,
                    onPressed: () {},
                  ),
                  SizedBox(height: 5,),
                  SizedBox(
                    height: 221,
                    child: Scrollbar(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return CardMostPopular(linkImage: 'assets/images/home/FrameOne.png',name: 'The Horizon Retreat', address: 'Los Angeles, CA', money: 450, ratting: '4.5',);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Recommendex For You
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  TitleWithBtn(
                    title: AppLocalizations.of(context)!.homeRecommended,
                    titleBtn: AppLocalizations.of(context)!.seeAll,
                    onPressed: () {},
                  ),
                  SizedBox(height: 5,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
