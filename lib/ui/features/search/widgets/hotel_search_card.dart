import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/themes/theme.dart';
import 'package:hotel_booking_app/utils/format.dart';

class HotelSearchCard extends StatelessWidget {
  const HotelSearchCard({required this.hotel, super.key});

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  image: DecorationImage(
                    image:
                        hotel.image != ''
                            ? NetworkImage(hotel.image)
                            : AssetImage(Assets.images.home.frameOne.path)
                                as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hotel.name,
                          style: HBTextStyles.bodySemiboldMedium(
                            context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          hotel.location,
                          style: HBTextStyles.bodyRegularSmall(
                            context.colorScheme.onTertiary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.images.icon.doubleBed,
                                  colorFilter: ColorFilter.mode(
                                    context.colorScheme.onSurfaceVariant
                                        .withValues(alpha: 0.7),
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  context.l10n.bed(hotel.bed ?? 0),
                                  style: HBTextStyles.bodySemiboldSmall(
                                    context.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.images.icon.bathroomTubTowel,
                                  colorFilter: ColorFilter.mode(
                                    context.colorScheme.onSurfaceVariant
                                        .withValues(alpha: 0.7),
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  context.l10n.bathroom(hotel.bathroom ?? 0),
                                  style: HBTextStyles.bodySemiboldSmall(
                                    context.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          context.l10n.price(formatPrice(320000 / 1000)),
                          style: HBTextStyles.bodySemiboldMedium(
                            context.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          context.l10n.perNight,
                          style: HBTextStyles.bodyRegularSmall(
                            context.colorScheme.onTertiary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: context.colorScheme.inverseSurface.withValues(alpha: 0.15),
            ),
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 56,
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: context.colorScheme.surface.withValues(
                        alpha: 0.25,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.images.icon.solarStarBold,
                          width: 12,
                          height: 12,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '${hotel.rating}',
                          style: HBTextStyles.bodySemiboldXSmall(
                            context.colorScheme.onPrimary,
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: context.colorScheme.surface.withValues(
                        alpha: 0.25,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: SvgPicture.asset(Assets.images.icon.heartWhite),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
