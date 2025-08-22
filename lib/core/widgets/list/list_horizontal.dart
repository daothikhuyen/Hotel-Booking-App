import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/routes/page_routes.dart';
import 'package:hotel_booking_app/core/widgets/cards/best_today_card.dart';
import 'package:hotel_booking_app/core/widgets/cards/header_card.dart';
import 'package:hotel_booking_app/core/widgets/cards/skeleton.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ListHorizontal extends StatelessWidget {
  const ListHorizontal(
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
    return Column(
      children: [
        HeaderCard(title: title, titleBtn: textButton, onPressed: () {}),
        // list hotel
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child:
              hotels.isNotEmpty
                  ? SizedBox(
                    height: 102,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: number,
                      itemBuilder: (context, index) {
                        final hotel = hotels[index];
                        return GestureDetector(
                          onTap: () {
                            context.push(PageRoutes.detailPage, extra: hotel);
                          },
                          child: BestTodayItem(
                            linkImage: hotel.image,
                            name: hotel.name,
                            address: hotel.location,
                            currentPrice: hotel.currentPrice ?? 0,
                            lastPrice: hotel.lastPrice ?? 0,
                            ratting: hotel.ratting ?? 0,
                            traffic: hotel.traffic ?? 0,
                          ),
                        );
                      },
                    ),
                  )
                  : const NewCardSkeleton(),
        ),
      ],
    );
  }
}

class NewCardSkeleton extends StatelessWidget {
  const NewCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 102,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Shimmer(
            duration: const Duration(seconds: 2),
            interval: const Duration(seconds: 5),
            colorOpacity: 1,
            child: Container(
              height: 101,
              width: 300,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.01,
                  color: context.colorScheme.outline.withValues(alpha: 0.7),
                ),
                borderRadius: BorderRadius.circular(18),
                color: context.colorScheme.onPrimary,
              ),
              child: const Row(
                children: [
                  Skeleton(width: 75, height: 75),
                  SizedBox(width: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skeleton(width: 150, height: 13),
                      SizedBox(height: 8),
                      Skeleton(width: 100, height: 13),
                      SizedBox(height: 8),
                      Skeleton(width: 100, height: 13),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
