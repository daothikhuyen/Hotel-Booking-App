import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/core/build_divider.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/core/utils/format.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({
    required this.name,
    required this.location,
    required this.currentPrice,
    required this.ratting,
    required this.dateTime,
    required this.guest,
    required this.numberRoom,
    super.key,
    this.linkImage,
  });

  final String? linkImage;
  final String name;
  final String location;
  final double currentPrice;
  final String ratting;
  final String dateTime;
  final int guest;
  final int numberRoom;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 176,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.3,
          color: context.colorScheme.outline.withValues(alpha: 0.5),
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 96,
            height: 152,
            margin: const EdgeInsets.only(right: 8, left: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              image: DecorationImage(
                image:
                    linkImage != ''
                        ? NetworkImage(linkImage!)
                        : AssetImage(Assets.images.home.frameOne.path)
                            as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: HBTextStyles.bodySemiboldLarge(
                        context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            Assets.images.icon.solarStarBold,
                            width: 16,
                            height: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            ratting,
                            style: HBTextStyles.bodySemiboldSmall(
                              context.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.images.icon.vector,
                      colorFilter: ColorFilter.mode(
                        context.colorScheme.onSurfaceVariant.withValues(
                          alpha: 0.7,
                        ),
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      location,
                      style: HBTextStyles.bodyRegularMedium(
                        context.colorScheme.onTertiary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: context.l10n.price(
                          formatPrice(currentPrice / 1000),
                        ),
                        style: HBTextStyles.bodyMediumLarge(
                          context.colorScheme.primary,
                        ),
                      ),
                      TextSpan(
                        text: context.l10n.night,
                        style: HBTextStyles.bodyMediumMedium(
                          context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: const BuildDivider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(Assets.images.icon.calendar),
                          const SizedBox(width: 4),
                          Text(
                            context.l10n.date,
                            style: HBTextStyles.bodyRegularMedium(
                              context.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '12-14 Nov 2024',
                        style: HBTextStyles.bodySemiboldSmall(
                          context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(Assets.images.icon.profile),
                          const SizedBox(width: 4),
                          Text(
                            context.l10n.guest,
                            style: HBTextStyles.bodyRegularMedium(
                              context.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '2 Guest(1 Room)',
                        style: HBTextStyles.bodySemiboldSmall(
                          context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
