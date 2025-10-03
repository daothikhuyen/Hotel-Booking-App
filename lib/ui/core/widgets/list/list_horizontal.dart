import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/ui/core/core.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/best_today_card.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/header_card.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/skeleton.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ListHorizontal extends StatefulWidget {
  const ListHorizontal(
    this.listHotels,
    this.title,
    this.textButton,
    this.number,
    this.index, {
    super.key,
  });

  final List<Hotel> listHotels;
  final String title;
  final String textButton;
  final int number;
  final int index;

  @override
  State<ListHorizontal> createState() => _ListHorizontalState();
}

class _ListHorizontalState extends State<ListHorizontal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderCard(
          title: widget.title,
          titleBtn: widget.textButton,
          onPressed: () {
            context.push(PageRoutes.seeAllPage, extra: widget.index);
          },
        ),
        // list hotel
        Padding(
          padding: EdgeInsets.only(bottom: context.spacing.xl),
          child:
              widget.listHotels.isNotEmpty
                  ? SizedBox(
                    height: 102.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.number,
                      itemBuilder: (context, index) {
                        final hotel = widget.listHotels[index];
                        return GestureDetector(
                          onTap: () {
                            context.push(PageRoutes.detailPage, extra: hotel);
                          },
                          child: BestTodayCard(
                            linkImage: hotel.image,
                            name: hotel.name,
                            address: hotel.location,
                            currentPrice: hotel.currentPrice ?? 0,
                            lastPrice: hotel.lastPrice ?? 0,
                            rating: hotel.rating ?? 0,
                            traffic: hotel.traffic ?? 0,
                          ),
                        );
                      },
                    ),
                  )
                  : const NewCardSkeleton(),
        ),
      ],
    );
  }
}

class NewCardSkeleton extends StatelessWidget {
  const NewCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 102.h,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Shimmer(
            duration: const Duration(seconds: 2),
            interval: const Duration(seconds: 5),
            colorOpacity: 1,
            child: Container(
              height: 101.h,
              width: 300.w,
              padding: EdgeInsets.all(context.spacing.sm),
              margin: EdgeInsets.only(right: context.spacing.md.w),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.01.w,
                  color: context.colorScheme.outline.withValues(alpha: 0.7),
                ),
                borderRadius: BorderRadius.circular(18),
                color: context.colorScheme.onPrimary,
              ),
              child: Row(
                children: [
                  Skeleton(width: 75.w, height: 75.h),
                  SizedBox(width: context.spacing.sm),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skeleton(width: 150.w, height: 13.h),
                      SizedBox(height: context.spacing.sm),
                      Skeleton(width: 100.w, height: 13.h),
                      SizedBox(height: context.spacing.sm),
                      Skeleton(width: 100.w, height: 13.h),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
