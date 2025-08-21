import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({
    required this.width,
    required this.height,
    this.boderWidth,
    super.key,
  });

  final double? width;
  final double? height;
  final double? boderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.02,
          color: context.colorScheme.outline.withValues(alpha: 0.7),
        ),
        borderRadius: BorderRadius.circular(13),
        color: context.colorScheme.inverseSurface.withValues(alpha: 0.35),
      ),
    );
  }
}
