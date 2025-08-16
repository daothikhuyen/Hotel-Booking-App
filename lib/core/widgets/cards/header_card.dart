import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';

// Include name: Most Popular, Best Today,.. and textButton: See All
class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key, required this.title, required this.onPressed, required this.titleBtn});

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
            style: GoogleFonts.jost(
              textStyle: context.textTheme.headlineSmall!.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              titleBtn,
              style: GoogleFonts.plusJakartaSans(
                textStyle: context.textTheme.labelMedium!.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
