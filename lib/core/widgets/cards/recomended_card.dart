import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/core/utils/format.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';

class RecomendedItem extends StatelessWidget {
  const RecomendedItem({
    required this.name,
    required this.location,
    required this.currentPrice,
    required this.ratting,
    super.key,
    this.linkImage,
  });

  final String? linkImage;
  final String name;
  final String location;
  final double currentPrice;
  final String ratting;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Row(
        children: [
          Container(
            width: 85,
            height: 85,
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
            
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: HBTextStyles.bodySemiboldSmall(
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
                const SizedBox(height: 10),
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
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: HBTextStyles.bodyRegularXSmall(
                        context.colorScheme.onSurfaceVariant.withValues(
                          alpha: 0.7,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: context.l10n.price(
                          formatPrice(currentPrice / 1000),
                        ),
                        style: HBTextStyles.bodySemiboldSmall(
                          context.colorScheme.primary,
                        ),
                      ),
                      TextSpan(
                        text: context.l10n.night,
                        style: HBTextStyles.bodyRegularXSmall(
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
