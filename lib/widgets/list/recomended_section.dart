import 'package:flutter/material.dart';
import 'package:hotel_booking_app/data/hotel_data.dart';
import 'package:hotel_booking_app/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:hotel_booking_app/widgets/cards/recomended_card.dart';
import 'package:hotel_booking_app/widgets/list/header_section.dart';
import 'package:hotel_booking_app/widgets/category/category_list.dart';

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
          const SizedBox(height: 5),
          // category list
          const CategoryList(),

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
                    // create horizontal line 
                    index < hotelData.length - 1
                        ? Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 20,
                          ),
                          width: double.infinity,
                          height: 1.5,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: context.colorScheme.outline ),
                          ),
                        )
                        : const SizedBox.shrink(),
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
