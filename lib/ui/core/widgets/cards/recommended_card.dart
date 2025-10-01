import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/themes/theme.dart';
import 'package:hotel_booking_app/utils/format.dart';

class RecommendedCard extends StatelessWidget {
  const RecommendedCard({
    required this.name,
    required this.location,
    required this.currentPrice,
    required this.rating,
    super.key,
    this.linkImage,
  });

  final String? linkImage;
  final String name;
  final String location;
  final double currentPrice;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Row(
        children: [
          Container(
            width: 85,
            height: 85,
            margin: EdgeInsets.only(
              right: context.spacing.sm,
              left: context.spacing.xs,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              image: DecorationImage(
                image:
                    linkImage != ''
                        ? NetworkImage(linkImage ?? '')
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
                      padding: EdgeInsets.only(right: context.spacing.lg),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            Assets.images.icon.solarStarBold,
                            width: 16,
                            height: 16,
                          ),
                          SizedBox(width: context.spacing.xs),
                          Text(
                            rating,
                            style: HBTextStyles.bodySemiboldSmall(
                              context.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.spacing.sm),
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
                    SizedBox(width: context.spacing.xs),
                    Text(
                      location,
                      style: HBTextStyles.bodyRegularSmall(
                        context.colorScheme.onTertiary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.spacing.sm),
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
