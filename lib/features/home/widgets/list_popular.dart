import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/features/detail/detail_screen.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/core/widgets/cards/header_card.dart';
import 'package:hotel_booking_app/features/home/widgets/card/popular_card.dart';
import 'package:hotel_booking_app/routes/app_router.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ListPopular extends StatefulWidget {
  final List<Hotel> hotelPopular;
  const ListPopular(this.hotelPopular, {super.key});

  @override
  State<ListPopular> createState() => _ListPopularState();
}

class _ListPopularState extends State<ListPopular> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hotels = widget.hotelPopular;

    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Column(
        children: [
          HeaderCard(
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
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, animationRouter(DetailScreen(hotel: hotel,)));
                      },
                      child: PopularCard(
                        linkImage: hotel.image,
                        name: hotel.name,
                        address: hotel.location,
                        money: hotel.current_price!,
                        ratting: hotel.ratting ?? 0,
                      ),
                    );
                  },
                ),
              )
              : SizedBox(
                height: 221,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Shimmer(
                      duration: const Duration(seconds: 3),
                      interval: const Duration(seconds: 5),
                      // color: Colors.white, 
                      colorOpacity: 0,
                      enabled: true,
                      direction: const ShimmerDirection.fromLTRB(), 
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
