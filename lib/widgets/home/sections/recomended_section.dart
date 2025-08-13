import 'package:flutter/material.dart';
import 'package:hotel_booking_app/data/hotel_data.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:hotel_booking_app/widgets/home/items/recomended_item.dart';
import 'package:hotel_booking_app/widgets/home/sections/header_section.dart';
import 'package:hotel_booking_app/widgets/common/list/category_list.dart';

class RecomendedSection extends StatelessWidget {
  const RecomendedSection({super.key});

  get selectedIndex => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          HeaderSection(
            title: AppLocalizations.of(context)!.homeRecommended,
            titleBtn: AppLocalizations.of(context)!.seeAll,
            onPressed: () {},
          ),
          SizedBox(height: 5),
          // category list
          CategoryList(),

          // list hotel
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 8),
            child: Column(
              children: List.generate(
                hotelData.length,
                (index) => Column(
                  children: [
                    RecomendedItem(
                      linkImage: hotelData[index]['linkImage']!,
                      name: hotelData[index]['name']!,
                      address: hotelData[index]['address']!,
                      money:hotelData[index]['money'] != null
                              ? double.parse(hotelData[index]['money']!)
                              : 0.0,
                      ratting: hotelData[index]['ratting']!,
                    ),
                    index < hotelData.length - 1
                        ? Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 20,
                          ),
                          width: double.infinity,
                          height: 1.5,
                          child: const DecoratedBox(
                            decoration: BoxDecoration(color: Color(0xFFE9EBED)),
                          ),
                        )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
