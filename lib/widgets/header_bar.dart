// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';

class HeaderBar extends StatelessWidget implements PreferredSizeWidget {
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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      scrolledUnderElevation: 4,
      elevation: 0,
      shadowColor: Colors.transparent,
      title: Row(
        children: [
          ClipOval(
            child: Container(
              color: context.colorScheme.surface,
              child: Image.asset(
                Assets.images.avatar.ellipse.path,
                width: 40,
                height: 40,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Matr Kohler',
                style: GoogleFonts.plusJakartaSans(
                  textStyle: context.textTheme.headlineMedium!.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.images.icon.vector,
                    color: context.colorScheme.onSurfaceVariant.withValues(
                      alpha: 0.7,
                    ),
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'San Diego, CA',
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: context.textTheme.bodySmall!.copyWith(
                        color: context.colorScheme.onSurfaceVariant.withValues(
                          alpha: 0.7,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      actions: [
        GestureDetector(
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: context.colorScheme.outline),
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
              border: Border.all(width: 1, color: context.colorScheme.outline),
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
    );
  }
}
