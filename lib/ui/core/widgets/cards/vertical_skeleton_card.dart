import 'package:flutter/material.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/skeleton.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class VerticalSkeletonCard extends StatefulWidget {
  const VerticalSkeletonCard({this.height = 85, super.key});

  final double height;

  @override
  State<VerticalSkeletonCard> createState() => _VerticalSkeletonCardState();
}

class _VerticalSkeletonCardState extends State<VerticalSkeletonCard> {
  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: const Duration(seconds: 4),
      interval: const Duration(seconds: 5),
      colorOpacity: 1,
      child: Column(
        children: [
          SizedBox(
            height: widget.height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Skeleton(width: 85, height: 85),
                SizedBox(width: context.spacing.sm),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Skeleton(width: 200, height: 13),
                      SizedBox(height: context.spacing.sm),
                      const Skeleton(width: 100, height: 13),
                      SizedBox(height: context.spacing.sm),
                      const Skeleton(width: 150, height: 13),
                    ],
                  ),
                ),
                const Skeleton(width: 30, height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
