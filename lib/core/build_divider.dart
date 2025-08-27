import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';

class BuildDivider extends StatelessWidget {
  const BuildDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      width: double.infinity,
      height: 1,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.colorScheme.outline.withValues(alpha: 0.5),
        ),
      ),
    );
  }
}
