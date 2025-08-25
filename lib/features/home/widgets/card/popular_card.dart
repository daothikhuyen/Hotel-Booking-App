import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/core/utils/format.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';

class PopularCard extends StatefulWidget {
  const PopularCard({
    required this.name,
    required this.location,
    required this.currentPrice,
    required this.ratting,
    this.linkImage,
    super.key,
  });

  final String? linkImage;
  final String name;
  final String location;
  final double currentPrice;
  final double ratting;

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
            margin: const EdgeInsets.only(right: 10),
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: HBTextStyles.bodySemiboldSmall(
                      context.colorScheme.onPrimary,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.location,
                    style: HBTextStyles.bodyMediumXSmall(
                      context.colorScheme.onPrimary.withValues(alpha: 0.7),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.l10n.price(
                              formatCurrency(widget.currentPrice),
                            ) +context.l10n.night,
                        style: HBTextStyles.bodyMediumXSmall(
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
                          const SizedBox(width: 3),
                          Text(
                            '${widget.ratting}',
                            style: HBTextStyles.bodySemiboldXSmall(
                              context.colorScheme.onPrimary,
                            ),
                          ),
                          const SizedBox(width: 8),
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
