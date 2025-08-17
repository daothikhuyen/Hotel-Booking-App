// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/core/widgets/buttons/primary_btn.dart';
import 'package:hotel_booking_app/features/auth/sign_in.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:hotel_booking_app/routes/app_router.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    super.key,
    required this.linkImage,
    required this.userName,
    required this.address,
  });

  final String? linkImage;
  final String userName;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          userName != ''
              ? Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image:
                              linkImage != ''
                                  ? NetworkImage(linkImage!)
                                  : const AssetImage(
                                        'assets/images/home/FrameOne.png',
                                      )
                                      as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            userName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: CustomTextStyles.bodySemiboldMedium(context.colorScheme.onSurfaceVariant),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              SvgPicture.asset(
                                Assets.images.icon.vector,
                                color: context.colorScheme.onSurfaceVariant
                                    .withValues(alpha: 0.7),
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'San Diego, CA',
                                style: GoogleFonts.plusJakartaSans(
                                  textStyle: CustomTextStyles.bodyRegularXSmall(context
                                            .colorScheme
                                            .onSurfaceVariant
                                            .withValues(alpha: 0.7),),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
              : SizedBox(
                width: 200,
                child: PrimaryBtn(
                  textButton: AppLocalizations.of(context)!.signIn,
                  onPressed: () {
                    Navigator.push(context, animationRouter(const SignIn()));
                  },
                  bold: false,
                ),
              ),
          Row(
            children: [
              GestureDetector(
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: context.colorScheme.outline,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      Assets.images.icon.search,
                      color: context.iconTheme.color,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: context.colorScheme.outline,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.images.icon.group,
                          color: context.iconTheme.color,
                          fit: BoxFit.contain,
                        ),

                        Positioned(
                          top: 1.4,
                          right: 3,
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 2.5,
                              backgroundColor: context.colorScheme.error,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ],
      ),
    );
  }
}
