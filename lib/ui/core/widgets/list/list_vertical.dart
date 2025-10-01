import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/routing/page_routes.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
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
      padding: EdgeInsets.only(bottom: context.spacing.lg),
      child: Padding(
        padding: EdgeInsets.only(
          top: context.spacing.lg,
          right: context.spacing.sm,
        ),
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
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.spacing.xs,
                              vertical: context.spacing.xl,
                            ),
                            child: const BuildDivider(),
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
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.spacing.xs,
                              vertical: context.spacing.xl,
                            ),
                            child: const BuildDivider(),
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
