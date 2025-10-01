import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/routing/page_routes.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/header_card.dart';
import 'package:hotel_booking_app/ui/features/home/widgets/card/popular_card.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ListPopular extends StatefulWidget {
  const ListPopular(this.listHotels, this.number, {super.key});
  final List<Hotel> listHotels;
  final int number;

  @override
  State<ListPopular> createState() => _ListPopularState();
}

class _ListPopularState extends State<ListPopular> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom:  context.spacing.md),
      child: Column(
        children: [
          HeaderCard(
            title: context.l10n.mostPopular,
            titleBtn: context.l10n.seeAll,
            onPressed: () {
              context.push(PageRoutes.seeAllPage, extra: 1);
            },
          ),
          SizedBox(height: context.spacing.xs),

          if (widget.listHotels.isNotEmpty)
            SizedBox(
              height: 221,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.number,
                itemBuilder: (context, index) {
                  final hotel = widget.listHotels[index];
                  return GestureDetector(
                    onTap: () {
                      context.push(PageRoutes.detailPage, extra: hotel);
                    },
                    child: PopularCard(
                      linkImage: hotel.image,
                      name: hotel.name,
                      location: hotel.location,
                      currentPrice: (hotel.currentPrice ?? 0.000) / 1000,
                      rating: hotel.rating ?? 0,
                    ),
                  );
                },
              ),
            )
          else
            SizedBox(
              height: 221,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Shimmer(
                    interval: const Duration(seconds: 5),
                    colorOpacity: 0,
                    child: Container(
                      margin: EdgeInsets.only(right:  context.spacing.sm),
                      width: 156,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: context.colorScheme.inverseSurface.withValues(
                          alpha: 0.35,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
