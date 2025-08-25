import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/routes/page_routes.dart';
import 'package:hotel_booking_app/core/widgets/cards/header_card.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/features/home/widgets/card/popular_card.dart';
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
      padding: const EdgeInsets.only(bottom: 13),
      child: Column(
        children: [
          HeaderCard(
            title: context.l10n.mostPopular,
            titleBtn: context.l10n.seeAll,
            onPressed: () {},
          ),
          const SizedBox(height: 5),

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
                      ratting: hotel.ratting ?? 0,
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
                      margin: const EdgeInsets.only(right: 10),
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
