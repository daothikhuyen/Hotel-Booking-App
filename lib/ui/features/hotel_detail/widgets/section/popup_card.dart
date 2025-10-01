import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/themes/theme.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/header_card.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/skeleton.dart';
import 'package:hotel_booking_app/ui/core/widgets/list/list_horizontal.dart';
import 'package:hotel_booking_app/ui/features/home/view_model/hotel_controller.dart';
import 'package:hotel_booking_app/ui/features/home/widgets/map_section.dart';
import 'package:hotel_booking_app/ui/features/hotel_detail/data/facilities.dart';
import 'package:hotel_booking_app/ui/features/hotel_detail/widgets/facilities_card.dart';
import 'package:hotel_booking_app/ui/features/hotel_detail/widgets/section/read_more.dart';
import 'package:hotel_booking_app/ui/features/hotel_detail/widgets/section/review_section.dart';
import 'package:hotel_booking_app/utils/translation_helper.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PopupCard extends StatefulWidget {
  const PopupCard({
    required this.hotel,
    required this.onScrollChange,
    super.key,
  });

  final Hotel hotel;
  final Function({required bool scrolled}) onScrollChange;

  @override
  State<PopupCard> createState() => _PopupCardState();
}

class _PopupCardState extends State<PopupCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HotelController>(context);
    final hotel = widget.hotel;

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.7,
      maxChildSize: 0.99,
      builder: (context, scrollController) {
        scrollController.addListener(() {
          widget.onScrollChange(scrolled: scrollController.offset > 50);
        });
        return Container(
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: context.spacing.xl),
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.spacing.lg,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (hotel.name.isNotEmpty)
                                      Text(
                                        hotel.name,
                                        style: HBTextStyles.bodySemiboldLarge(
                                          context.colorScheme.inverseSurface,
                                        ),
                                        textAlign: TextAlign.start,
                                      )
                                    else
                                      Skeleton(
                                        width: context.spacing.huge,
                                        height: context.spacing.sm,
                                      ),
                                    SizedBox(height: context.spacing.xs),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            right: context.spacing.xs,
                                          ),
                                          child: SvgPicture.asset(
                                            width: 18,
                                            height: 18,
                                            Assets.images.icon.frame,
                                          ),
                                        ),

                                        if (hotel.location.isNotEmpty)
                                          Text(
                                            hotel.location,
                                            style:
                                                HBTextStyles.bodyRegularSmall(
                                                  context
                                                      .colorScheme
                                                      .onTertiary,
                                                ),
                                          )
                                        else
                                          const Skeleton(width: 50, height: 5),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: context.spacing.lg,
                                            right: context.spacing.sm,
                                          ),
                                          child: SvgPicture.asset(
                                            Assets.images.icon.solarStarBold,
                                          ),
                                        ),
                                        Text(
                                          '${hotel.rating}',
                                          style:
                                              HBTextStyles.bodySemiboldXSmall(
                                                context
                                                    .colorScheme
                                                    .onSurfaceVariant,
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
                                    backgroundColor:
                                        context.colorScheme.secondary,
                                    child: SvgPicture.asset(
                                      Assets.images.icon.a3dRotate,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: context.spacing.lg,
                                right: context.spacing.sm,
                              ),
                              child: HeaderCard(
                                title: context.l10n.commonFacilities,
                                onPressed: () {},
                                titleBtn: '',
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
                              padding: EdgeInsets.only(
                                left: context.spacing.xl,
                                right: context.spacing.sm,
                              ),
                              child: HeaderCard(
                                title: context.l10n.description,
                                onPressed: () {},
                                titleBtn: '',
                              ),
                            ),
                            ReadMore(text: context.l10n.descriptionHotel),
                            Padding(
                              padding: EdgeInsets.only(top: context.spacing.sm),
                              child: MapSection(title: context.l10n.location),
                            ),
                            HeaderCard(
                              title: context.l10n.reviews,
                              onPressed: () {},
                              titleBtn: '',
                            ),
                            ReviewSection(number: 2, idHotel: hotel.id),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      left: context.spacing.lg,
                      top: context.spacing.sm,
                    ),
                    child: VisibilityDetector(
                      key: const Key('recommednedDetail-section'),
                      onVisibilityChanged: (info) {
                        if (info.visibleFraction > 0.1 &&
                            controller.listRecomended.isEmpty) {
                          controller.fetchRecomendedHotels(context);
                        }
                      },
                      child: ListHorizontal(
                        controller.listRecomended,
                        context.l10n.detailRecommended,
                        context.l10n.seeAll,
                        3,
                        2,
                      ),
                    ),
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
