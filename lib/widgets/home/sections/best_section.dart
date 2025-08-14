import 'package:flutter/material.dart';
import 'package:hotel_booking_app/data/hotel_data.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:hotel_booking_app/widgets/home/items/best_today_item.dart';
import 'package:hotel_booking_app/widgets/home/sections/header_section.dart';

class BestSection extends StatelessWidget {
  const BestSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderSection(
          title: '${AppLocalizations.of(context)!.bestToday} 🔥',
          titleBtn: AppLocalizations.of(context)!.seeAll,
          onPressed: () {},
        ),
        SizedBox(height: 5),

        // list hotel
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 15),
          child: SizedBox(
            height: 102,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return BestTodayItem(
                    linkImage: 'assets/images/home/FrameOne.png',
                    name: 'The Horizon Retreat',
                    address: 'Los Angeles, CA',
                    money: 450,
                    ratting: '4.5',
                  );
                },
              ),
          ),
        ),
      ],
    );
  }
}
