import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/themes/theme.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    required this.title,
    required this.image,
    required this.onPressed,
    super.key,
  });

  final String title;
  final String image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            image,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              context.colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.01,
                    color: context.colorScheme.outline.withValues(alpha: 0.5),
                  ),
                ),
              ),
              child: Text(
                title,
                style: HBTextStyles.bodySemiboldMedium(
                  context.colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
