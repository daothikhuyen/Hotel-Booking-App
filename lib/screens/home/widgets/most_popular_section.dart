import 'package:flutter/material.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:hotel_booking_app/model/hotel.dart';
import 'package:hotel_booking_app/widgets/list/header_section.dart';
import 'package:hotel_booking_app/widgets/cards/most_popular_card.dart';

class MostPopularSection extends StatefulWidget {

  final List<Hotel> hotelPopular;
  const MostPopularSection(this.hotelPopular, {super.key});


  @override
  State<MostPopularSection> createState() => _MostPopularSectionState();
  
}

class _MostPopularSectionState extends State<MostPopularSection> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hotels = widget.hotelPopular;

    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 13),
      child: Column(
        children: [
          HeaderSection(
            title: AppLocalizations.of(context)!.mostPopular,
            titleBtn: AppLocalizations.of(context)!.seeAll,
            onPressed: () {},
          ),
          const SizedBox(height: 5),

          hotels.isNotEmpty
            ? SizedBox(
              height: 221,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: hotels.length,
                itemBuilder: (context, index) {
                  final hotel = hotels[index];
                  return MostPopularItem(
                    linkImage: hotel.image ,
                    name: hotel.name,
                    address: hotel.location,
                    money: hotel.current_price!,
                    ratting: hotel.ratting ?? 0,
                  );
                },
              ),
          ): const Text('interface not loaded yet'),
        ],
      ),
    );
  }
}
