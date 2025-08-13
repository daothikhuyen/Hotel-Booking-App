import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:hotel_booking_app/themes/app_colors.dart';
import 'package:hotel_booking_app/themes/theme.dart';

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
                    style: CustomerTextStyles.avBoldTextStyle(
                      Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/icon/Vector.svg',
                        // ignore: deprecated_member_use
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 4),
                      Text(
                        address,
                        style: CustomerTextStyles.prNormalTextStyle(
                          Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '\$$money',
                          style: GoogleFonts.inter(
                            textStyle: CustomerTextStyles.suitableBoldTextStyle(
                              AppColors.primaryLight,
                            ),
                          ),
                        ),
                        TextSpan(
                          text: ' /${AppLocalizations.of(context)!.night}',
                          style: GoogleFonts.inter(
                            textStyle: CustomerTextStyles.prNormalTextStyle(
                              Theme.of(context).colorScheme.onSurfaceVariant,
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
                  'assets/images/icon/solar_star-bold.svg',
                  width: 16,
                  height: 16,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 4),
                Text(
                  ratting,
                  style: GoogleFonts.inter(
                    textStyle: CustomerTextStyles.suitableBoldTextStyle(
                      Theme.of(context).colorScheme.onSurface,
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
