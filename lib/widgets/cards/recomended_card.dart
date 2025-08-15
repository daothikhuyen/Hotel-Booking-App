import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:hotel_booking_app/themes/app_colors.dart';

class RecomendedItem extends StatelessWidget {
  const RecomendedItem({
    super.key,
    this.linkImage,
    required this.name,
    required this.address,
    required this.money,
    required this.ratting,
  });

  final String? linkImage;
  final String name;
  final String address;
  final double money;
  final String ratting;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 85,
                height: 85,
                margin: const EdgeInsets.only(right: 8, left: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  image: DecorationImage(
                    image: AssetImage(linkImage!),
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
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        address,
                        style: context.textTheme.bodySmall!.copyWith(
                          color: context.colorScheme.onSurfaceVariant
                              .withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '\$$money',
                          style: GoogleFonts.inter(
                            textStyle: context.textTheme.headlineSmall!
                                .copyWith(color: AppColors.primaryLight),
                          ),
                        ),
                        TextSpan(
                          text: ' /${AppLocalizations.of(context)!.night}',
                          style: GoogleFonts.jost(
                            textStyle: context.textTheme.bodySmall!.copyWith(
                              color: context.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              children: [
                SvgPicture.asset(
                  Assets.images.icon.solarStarBold,
                  width: 16,
                  height: 16,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 4),
                Text(
                  ratting,
                  style: GoogleFonts.inter(
                    textStyle: context.textTheme.headlineSmall!.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
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
