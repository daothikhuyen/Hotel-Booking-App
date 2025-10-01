import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/themes/theme.dart';
import 'package:hotel_booking_app/utils/format.dart';

class PopularCard extends StatefulWidget {
  const PopularCard({
    required this.name,
    required this.location,
    required this.currentPrice,
    required this.rating,
    this.linkImage,
    super.key,
  });

  final String? linkImage;
  final String name;
  final String location;
  final double currentPrice;
  final double rating;

  @override
  State<PopularCard> createState() => _PopularCardState();
}

class _PopularCardState extends State<PopularCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          Container(
            width: 156,
            height: 220,
            margin: EdgeInsets.only(right:  context.spacing.sm),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image:
                    widget.linkImage != ''
                        ? NetworkImage(widget.linkImage!)
                        : AssetImage('${Assets.images.home.frameOne}')
                            as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            width: 156,
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: context.colorScheme.inverseSurface.withValues(alpha: 0.35),
            ),
          ),

          Positioned(
            top: 10,
            right: 18,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: context.colorScheme.onPrimary,
              child: SvgPicture.asset(Assets.images.icon.heart),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,

            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.spacing.sm,
                vertical: context.spacing.lg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: HBTextStyles.bodySemiboldSmall(
                      context.colorScheme.onPrimary,
                    ),
                  ),
                  SizedBox(height: context.spacing.xs),
                  Text(
                    widget.location,
                    style: HBTextStyles.bodyMediumXSmall(
                      context.colorScheme.onPrimary,
                    ),
                  ),
                  SizedBox(height: context.spacing.xs),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.l10n.price(formatPrice(widget.currentPrice)) +
                            context.l10n.night,
                        style: HBTextStyles.bodySemiboldSmall(
                          context.colorScheme.onPrimary,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.images.icon.solarStarBold,
                            width: 12,
                            height: 12,
                          ),
                          SizedBox(height: context.spacing.xs),
                          Text(
                            '${widget.rating}',
                            style: HBTextStyles.bodySemiboldXSmall(
                              context.colorScheme.onPrimary,
                            ),
                          ),
                          SizedBox(height: context.spacing.sm),
                        ],
                      ),
                    ],
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
