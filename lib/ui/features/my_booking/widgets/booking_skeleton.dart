import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/skeleton.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class BookingSkeleton extends StatelessWidget {
  const BookingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer(
          interval: const Duration(seconds: 5),
          colorOpacity: 0,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: context.spacing.sm.h),
            height: 176.h,
            padding: EdgeInsets.all(context.spacing.sm),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.3.w,
                color: context.colorScheme.outline.withValues(alpha: 0.5),
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                Skeleton(width: 96.w, height: 152.h),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: context.spacing.sm.h),
                      Skeleton(width: 200.w, height: 30.h),
                      SizedBox(height: context.spacing.sm.h),
                      Skeleton(width: 200.w, height: 30.h),
                      SizedBox(height: context.spacing.sm.h),
                      Skeleton(width: 200.w, height: 30.h),
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
