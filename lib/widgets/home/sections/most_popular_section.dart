import 'package:flutter/material.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:hotel_booking_app/widgets/home/items/most_popular_item.dart';
import 'package:hotel_booking_app/widgets/home/sections/header_section.dart';

class MostPopularSection extends StatelessWidget {
  const MostPopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 13),
      child: Column(
        children: [
          HeaderSection(
            title: AppLocalizations.of(context)!.mostPopular,
            titleBtn: AppLocalizations.of(context)!.seeAll,
            onPressed: () {},
          ),
          SizedBox(height: 5),
          SizedBox(
            height: 221,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return MostPopularItem(
                  linkImage: 'assets/images/home/FrameOne.png',
                  name: 'The Horizon Retreat',
                  address: 'Los Angeles, CA',
                  money: 450,
                  ratting: '4.5',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
