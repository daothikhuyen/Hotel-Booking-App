import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/routing/page_routes.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/build_divider.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/recommended_card.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/vertical_skeleton_card.dart';

class ListVertical extends StatefulWidget {
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
  State<ListVertical> createState() => _ListVerticalState();
}

class _ListVerticalState extends State<ListVertical> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.only(top: 18, right: 8),
        child:
            widget.listHotels.isNotEmpty
                ? Column(
                  children: List.generate(widget.number, (index) {
                    final hotel = widget.listHotels[index];
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.push(PageRoutes.detailPage, extra: hotel);
                          },
                          child: RecommendedCard(
                            linkImage: hotel.image,
                            name: hotel.name,
                            location: hotel.location,
                            currentPrice: hotel.currentPrice ?? 0,
                            rating: hotel.rating.toString(),
                          ),
                        ),
                        // create horizontal line
                        if (index < widget.listHotels.length - 1)
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 20,
                            ),
                            child: BuildDivider(),
                          )
                        else
                          const SizedBox.shrink(),
                      ],
                    );
                  }),
                )
                : Column(
                  children: List.generate(4, (index) {
                    return Column(
                      children: [
                        const VerticalSkeletonCard(),
                        if (index < 4 - 1)
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 20,
                            ),
                            child: BuildDivider(),
                          )
                        else
                          const SizedBox.shrink(),
                      ],
                    );
                  }),
                ),
      ),
    );
  }
}
