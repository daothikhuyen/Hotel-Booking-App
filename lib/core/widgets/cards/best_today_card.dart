import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';

class BestTodayItem extends StatelessWidget {
  const BestTodayItem({
    required this.name,
    required this.address,
    required this.currentPrice,
    required this.ratting,
    required this.traffic,
    required this.lastPrice,
    required this.linkImage,
    super.key,
  });

  final String linkImage;
  final String name;
  final String address;
  final double currentPrice;
  final double lastPrice;
  final double ratting;
  final int traffic;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 101,
      width: 300,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.02,
          color: context.colorScheme.outline.withValues(alpha: 0.7),
        ),
        borderRadius: BorderRadius.circular(18),
        color: context.colorScheme.onPrimary,
      ),
      child: Row(
        children: [
          Container(
            width: 75,
            height: 75,
            margin: const EdgeInsets.only(right: 8, left: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              image: DecorationImage(
                image:NetworkImage(linkImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                name,
                style: HBTextStyles.bodySemiboldSmall(
                  context.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.images.icon.location,
                    colorFilter: ColorFilter.mode(
                      context.colorScheme.tertiary,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    address,
                    style: HBTextStyles.bodyRegularSmall(
                      context.colorScheme.tertiary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              Row(
                children: [
                  SvgPicture.asset(
                    Assets.images.icon.solarStarBold,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    ratting.toString(),
                    style: HBTextStyles.bodyMediumXSmall(
                      context.colorScheme.onError,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    context.l10n.traffic(traffic),
                    style: HBTextStyles.bodyRegularXSmall(
                      context.colorScheme.inverseSurface.withValues(alpha: 0.5),
                    ),
                  ),

                  const SizedBox(width: 15),
                  Text(
                    context.l10n.currentPrice(currentPrice),
                    style: HBTextStyles.bodySemiboldSmall(
                      context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    context.l10n.lastPrice(lastPrice),
                    style: HBTextStyles.bodyMediumXSmall(
                      context.colorScheme.error,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: context.colorScheme.error,
                      decorationThickness: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
