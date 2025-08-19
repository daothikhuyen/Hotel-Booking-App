import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';

// Include name: Most Popular, Best Today,.. and textButton: See All
class HeaderCard extends StatelessWidget {
  const HeaderCard({
    required this.title,
    required this.onPressed,
    required this.titleBtn,
    super.key,
  });

  final String title;
  final String titleBtn;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: HBTextStyles.bodySemiboldSmall(
              context.colorScheme.onSurfaceVariant,
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              titleBtn,
              style: GoogleFonts.plusJakartaSans(
                textStyle: HBTextStyles.bodyMediumXSmall(
                  context.colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
