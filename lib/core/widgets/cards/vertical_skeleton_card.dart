import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/widgets/cards/build_divider.dart';
import 'package:hotel_booking_app/core/widgets/cards/skeleton.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class VerticalSkeletonCard extends StatefulWidget {
  const VerticalSkeletonCard({super.key});

  @override
  State<VerticalSkeletonCard> createState() => _VerticalSkeletonCardState();
}

class _VerticalSkeletonCardState extends State<VerticalSkeletonCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(4, (index) {
        return Shimmer(
          duration: const Duration(seconds: 4),
          interval: const Duration(seconds: 5),
          colorOpacity: 1,
          child: Column(
            children: [
              const SizedBox(
                height: 85,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Skeleton(width: 85, height: 85),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Skeleton(width: 200, height: 13),
                          SizedBox(height: 8),
                          Skeleton(width: 100, height: 13),
                          SizedBox(height: 8),
                          Skeleton(width: 150, height: 13),
                        ],
                      ),
                    ),
                    Skeleton(width: 30, height: 30),
                  ],
                ),
              ),

              if (index < 4 - 1)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: BuildDivider(),
                )
              else
                const SizedBox.shrink(),
            ],
          ),
        );
      }),
    );
  }
}
