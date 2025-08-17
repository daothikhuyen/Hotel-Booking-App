import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/build_divider.dart';
import 'package:hotel_booking_app/core/widgets/cards/skeleton.dart';
import 'package:hotel_booking_app/data/data/hotel_data.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/core/widgets/cards/recomended_card.dart';
import 'package:hotel_booking_app/core/widgets/cards/header_card.dart';
import 'package:hotel_booking_app/core/widgets/category/category_list.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ListVertical extends StatelessWidget {
  const ListVertical(this.listHotels, this.title, this.textButton, {super.key});

  final List<Hotel> listHotels;
  final String title;
  final String textButton;

  get selectedIndex => null;

  @override
  Widget build(BuildContext context) {
    final hotels = listHotels;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          HeaderCard(title: title, titleBtn: textButton, onPressed: () {}),
          const SizedBox(height: 5),
          // category list
          const CategoryList(),

          // list hotel
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 8),
            child: Column(
              children:
                  listHotels.isNotEmpty
                      ? List.generate(listHotels.length, (index) {
                        final hotel = hotels[index];
                        return Column(
                          children: [
                            RecomendedItem(
                              linkImage: hotel.image,
                              name: hotel.name,
                              address: hotel.location,
                              money: hotel.current_price ?? 0,
                              ratting: hotel.ratting.toString(),
                            ),
                            // create horizontal line
                            index < hotelData.length - 1
                                ? BuildDivider()
                                : const SizedBox.shrink(),
                          ],
                        );
                      })
                      : NewsCardSkeleton(context),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> NewsCardSkeleton(BuildContext context) {
    return List.generate(4, (index) {
      return Shimmer(
        duration: const Duration(seconds: 3),
        interval: const Duration(seconds: 5),
        colorOpacity: 1,
        enabled: true,
        direction: const ShimmerDirection.fromLTRB(),
        child: Column(
          children: [
            SizedBox(
              height: 85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Skeleton(width: 85, height: 85),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Skeleton(width: 200, height: 13),
                        const SizedBox(height: 8),
                        Skeleton(width: 100, height: 13),
                        const SizedBox(height: 8),
                        Skeleton(width: 150, height: 13),
                      ],
                    ),
                  ),
                  Skeleton(width: 30, height: 30),
                ],
              ),
            ),

            index < 4 - 1 ? BuildDivider() : const SizedBox.shrink(),
          ],
        ),
      );
    });
  }
}
