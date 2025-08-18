import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
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
import 'package:hotel_booking_app/l10n/app_localizations.dart';

class PopupCard extends StatelessWidget {
  const PopupCard({
    super.key,
    required this.widget,
    required this.hotelRecomended, required this.onScrollChange,
  });

  final DetailScreen widget;
  final List<Hotel> hotelRecomended;
  final Function(bool) onScrollChange;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.7,
      maxChildSize: 1,
      builder: (context, scrollController) {
        scrollController.addListener((){
          onScrollChange(scrollController.offset>50);
        });
        return Container(
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.hotel.name.isNotEmpty ? Text(
                            widget.hotel.name,
                            style:  CustomTextStyles.bodySemiboldLarge(
                              context.colorScheme.inverseSurface,
                              letterSpacing: 0.5,
                            ),
                            textAlign: TextAlign.start,
                          ): Skeleton(width: 50, height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 4,
                                ),
                                child: SvgPicture.asset(
                                  width: 18,
                                  height: 18,
                                  Assets.images.icon.frame,
                                  fit: BoxFit.contain,
                                ),
                              ),

                              widget.hotel.location.isNotEmpty ? Text(
                                widget.hotel.location,
                                style: CustomTextStyles.bodyRegularSmall(
                                  context.colorScheme.onTertiary,
                                ),
                              ) : Skeleton(width: 50, height: 5),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                  right: 8,
                                ),
                                child: SvgPicture.asset(
                                  Assets.images.icon.solarStarBold,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Text(
                                '${widget.hotel.ratting}',
                                style: CustomTextStyles.bodySemiboldXSmall(
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
                          child: SvgPicture.asset(
                            Assets.images.icon.a3dRotate,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 10),
                    child: HeaderCard(
                      title: AppLocalizations.of(context)!.commonFacilities,
                      onPressed: () {},
                      titleBtn: AppLocalizations.of(context)!.seeAll,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                        facilities.map((facility) {
                          return FacilitiesCard(
                            icon: facility['icon']!,
                            title: facility['title']!,
                          );
                        }).toList(),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: HeaderCard(
                      title: AppLocalizations.of(context)!.description,
                      onPressed: () {},
                      titleBtn: '',
                    ),
                  ),
                  ReadMore(
                    text: AppLocalizations.of(context)!.descriptionHotel,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: MapSection(
                      title: AppLocalizations.of(context)!.location,
                    ),
                  ),
                  HeaderCard(
                    title: AppLocalizations.of(context)!.reviews,
                    onPressed: () {},
                    titleBtn: AppLocalizations.of(context)!.seeAll,
                  ),
                  ReviewCard(number: 2),

                  ListHorizontal(
                    hotelRecomended,
                    AppLocalizations.of(context)!.homeRecommended,
                    AppLocalizations.of(context)!.seeAll,
                    3,
                  ),
                  SizedBox(height: 80),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
