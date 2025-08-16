import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';

class BestTodayItem extends StatelessWidget {
  const BestTodayItem({
    super.key,
    this.linkImage,
    required this.name,
    required this.address,
    required this.current_price,
    required this.ratting,
    required this.traffic,
    required this.last_price,
  });

  final String? linkImage;
  final String name;
  final String address;
  final double current_price;
  final double last_price;
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
          width: 1,
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
                image:
                    linkImage != ''
                        ? NetworkImage(linkImage!)
                        : const AssetImage('assets/images/home/FrameOne.png')
                            as ImageProvider,
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
                style: GoogleFonts.jost(
                  textStyle: context.textTheme.headlineSmall!.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
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
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    address,
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: context.colorScheme.tertiary,
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
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '$ratting',
                    style: GoogleFonts.inter(
                      textStyle: context.textTheme.labelMedium!.copyWith(
                        color: context.colorScheme.onError,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '($traffic)',
                    style: context.textTheme.bodySmall!.copyWith(
                      color: context.colorScheme.inverseSurface.withValues(
                        alpha: 0.5,
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),
                  Text(
                    '\$$current_price',
                    style: GoogleFonts.inter(
                      textStyle: context.textTheme.headlineSmall!.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    '\$$last_price',
                    style: GoogleFonts.inter(
                      textStyle: context.textTheme.labelMedium!.copyWith(
                        color: context.colorScheme.error,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: context.colorScheme.error,
                        decorationThickness: 1,
                      ),
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
