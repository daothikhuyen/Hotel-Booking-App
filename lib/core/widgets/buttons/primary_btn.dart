import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';

class PrimaryBtn extends StatelessWidget {
  const PrimaryBtn({
    required this.textButton,
    required this.onPressed,
    required this.bold,
    required this.size,
    super.key,
  });

  final String textButton;
  final bool bold;
  final VoidCallback onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colorScheme.primary,
        minimumSize: Size(double.infinity, size),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        textButton,
        style:
            bold
                ? HBTextStyles.bodySemiboldMedium(
                  context.colorScheme.onSecondary,
                )
                : HBTextStyles.bodyMediumMedium(
                  context.colorScheme.onSecondary,
                ),
      ),
    );
  }
}
