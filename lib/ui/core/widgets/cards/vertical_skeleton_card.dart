import 'package:hotel_booking_app/ui/core/core.dart';
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
            height: widget.height.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Skeleton(width: 85.w, height: 85.h),
                SizedBox(width: context.spacing.sm),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skeleton(width: 200.w, height: 13.h),
                      SizedBox(height: context.spacing.sm),
                      Skeleton(width: 100.w, height: 13.h),
                      SizedBox(height: context.spacing.sm),
                      Skeleton(width: 150.w, height: 13.h),
                    ],
                  ),
                ),
                Skeleton(width: 30.w, height: 30.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
