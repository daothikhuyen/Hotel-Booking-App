import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/core/routes/page_routes.dart';
import 'package:hotel_booking_app/core/widgets/cards/build_divider.dart';
import 'package:hotel_booking_app/core/widgets/cards/header_card.dart';
import 'package:hotel_booking_app/core/widgets/cards/recomended_card.dart';
import 'package:hotel_booking_app/core/widgets/cards/skeleton.dart';
import 'package:hotel_booking_app/core/widgets/category/category_list.dart';
import 'package:hotel_booking_app/data/data/hotel_data.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ListVertical extends StatelessWidget {
  const ListVertical(
    this.listHotels,
    this.title,
    this.textButton,
    this.number, {
    super.key,
  });

  final List<Hotel> listHotels;
  final String title;
  final String textButton;
  final int number;

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
                            GestureDetector(
                              onTap: () {
                                context.push(
                                  PageRoutes.detailPage,
                                  extra: hotel,
                                );
                              },
                              child: RecomendedItem(
                                linkImage: hotel.image,
                                name: hotel.name,
                                location: hotel.location,
                                currentPrice: hotel.currentPrice ?? 0,
                                ratting: hotel.ratting.toString(),
                              ),
                            ),
                            // create horizontal line
                            if (index < hotelData.length - 1)
                              const BuildDivider()
                            else
                              const SizedBox.shrink(),
                          ],
                        );
                      })
                      : newsCardSkeleton(context),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> newsCardSkeleton(BuildContext context) {
    return List.generate(4, (index) {
      return Shimmer(
        duration: const Duration(seconds: 4),
        interval: const Duration(seconds: 5),
        colorOpacity: 1,
        child: Column(
          children: [
            const SizedBox(
              height: 85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Skeleton(width: 85, height: 85),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Skeleton(width: 200, height: 13),
                        SizedBox(height: 8),
                        Skeleton(width: 100, height: 13),
                        SizedBox(height: 8),
                        Skeleton(width: 150, height: 13),
                      ],
                    ),
                  ),
                  Skeleton(width: 30, height: 30),
                ],
              ),
            ),

            if (index < 4 - 1)
              const BuildDivider()
            else
              const SizedBox.shrink(),
          ],
        ),
      );
    });
  }
}
