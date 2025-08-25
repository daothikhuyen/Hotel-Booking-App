import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/core/utils/translation_helper.dart';
import 'package:hotel_booking_app/core/widgets/cards/header_card.dart';
import 'package:hotel_booking_app/core/widgets/cards/skeleton.dart';
import 'package:hotel_booking_app/core/widgets/list/list_horizontal.dart';
import 'package:hotel_booking_app/data/data/facilities.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/features/detail/detail_screen.dart';
import 'package:hotel_booking_app/features/detail/widgets/facilities_card.dart';
import 'package:hotel_booking_app/features/detail/widgets/read_more.dart';
import 'package:hotel_booking_app/features/detail/widgets/review_card.dart';
import 'package:hotel_booking_app/features/home/widgets/map_section.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';

class PopupCard extends StatelessWidget {
  const PopupCard({
    required this.widget,
    required this.hotelRecomended,
    required this.onScrollChange,
    super.key,
  });

  final DetailScreen widget;
  final List<Hotel> hotelRecomended;
  final Function({required bool scrolled}) onScrollChange;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.7,
      maxChildSize: 0.99,
      builder: (context, scrollController) {
        scrollController.addListener(() {
          onScrollChange(scrolled: scrollController.offset > 50);
        });
        return Container(
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.hotel.name.isNotEmpty)
                            Text(
                              widget.hotel.name,
                              style: HBTextStyles.bodySemiboldLarge(
                                context.colorScheme.inverseSurface,
                              ),
                              textAlign: TextAlign.start,
                            )
                          else
                            const Skeleton(width: 50, height: 10),
                          const SizedBox(height: 4,),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: SvgPicture.asset(
                                  width: 18,
                                  height: 18,
                                  Assets.images.icon.frame,
                                ),
                              ),

                              if (widget.hotel.location.isNotEmpty)
                                Text(
                                  widget.hotel.location,
                                  style: HBTextStyles.bodyRegularSmall(
                                    context.colorScheme.onTertiary,
                                  ),
                                )
                              else
                                const Skeleton(width: 50, height: 5),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                  right: 8,
                                ),
                                child: SvgPicture.asset(
                                  Assets.images.icon.solarStarBold,
                                ),
                              ),
                              Text(
                                '${widget.hotel.ratting}',
                                style: HBTextStyles.bodySemiboldXSmall(
                                  context.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                          radius: 32,
                          backgroundColor: context.colorScheme.secondary,
                          child: SvgPicture.asset(Assets.images.icon.a3dRotate),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 10),
                    child: HeaderCard(
                      title: context.l10n.commonFacilities,
                      onPressed: () {},
                      titleBtn: context.l10n.seeAll,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                        facilities.map((facility) {
                          return FacilitiesCard(
                            icon: facility['icon'] ?? '',
                            title: getTranslatedText(
                              context,
                              facility['title'] ?? '',
                            ),
                          );
                        }).toList(),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: HeaderCard(
                      title: context.l10n.description,
                      onPressed: () {},
                      titleBtn: '',
                    ),
                  ),
                  ReadMore(text: context.l10n.descriptionHotel),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: MapSection(title: context.l10n.location),
                  ),
                  HeaderCard(
                    title: context.l10n.reviews,
                    onPressed: () {},
                    titleBtn: context.l10n.seeAll,
                  ),
                  const ReviewCard(number: 2),

                  ListHorizontal(
                    hotelRecomended,
                    context.l10n.homeRecommended,
                    context.l10n.seeAll,
                    3,
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
