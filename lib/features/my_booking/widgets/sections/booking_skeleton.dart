import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/widgets/cards/skeleton.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class BookingSkeleton extends StatelessWidget {
  const BookingSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer(
          interval: const Duration(seconds: 5),
          colorOpacity: 0,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            height: 176,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.3,
                color: context.colorScheme.outline.withValues(alpha: 0.5),
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              children: [
                Skeleton(width: 96, height: 152),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Skeleton(width: 200, height: 30),
                      SizedBox(height: 8),
                      Skeleton(width: 200, height: 30),
                      SizedBox(height: 8),
                      Skeleton(width: 200, height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
