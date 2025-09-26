import 'package:flutter/material.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/themes/theme.dart';

class PrimaryBtn extends StatelessWidget {
  const PrimaryBtn({
    required this.textButton,
    required this.onPressed,
    required this.bold,
    required this.size,
    required this.isSelected,
    super.key,
  });

  final String textButton;
  final bool bold;
  final VoidCallback onPressed;
  final double size;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isSelected ? context.colorScheme.primary : const Color(0xFFF6F8FA),
        minimumSize: Size(0, size),
        shape: RoundedRectangleBorder(
          side:
              !isSelected
                  ? BorderSide(
                    color: context.colorScheme.outline.withValues(alpha: 0.3),
                    width: 1.01,
                  )
                  : const BorderSide(width: 0),
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
      ),
      child: Text(
        textButton,
        style:
            bold
                ? HBTextStyles.bodySemiboldMedium(
                  isSelected
                      ? context.colorScheme.onSecondary
                      : context.colorScheme.primary,
                )
                : HBTextStyles.bodyMediumMedium(
                  isSelected
                      ? context.colorScheme.onSecondary
                      : context.colorScheme.primary,
                ),
      ),
    );
  }
}
