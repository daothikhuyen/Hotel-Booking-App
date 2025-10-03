import 'package:hotel_booking_app/ui/core/core.dart';
import 'package:hotel_booking_app/utils/format.dart';

class PopularCard extends StatefulWidget {
  const PopularCard({
    required this.name,
    required this.location,
    required this.currentPrice,
    required this.rating,
    this.linkImage,
    super.key,
  });

  final String? linkImage;
  final String name;
  final String location;
  final double currentPrice;
  final double rating;

  @override
  State<PopularCard> createState() => _PopularCardState();
}

class _PopularCardState extends State<PopularCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          Container(
            width: 150.w,
            height: 200.h,
            margin: EdgeInsets.only(right: context.spacing.md.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image:
                    widget.linkImage != ''
                        ? NetworkImage(widget.linkImage!)
                        : AssetImage('${Assets.images.home.frameOne}')
                            as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            width: 150.w,
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: context.colorScheme.inverseSurface.withValues(alpha: 0.35),
            ),
          ),

          Positioned(
            top: 10.h,
            right: 24.w,
            child: CircleAvatar(
              radius: 10.r,
              backgroundColor: context.colorScheme.onPrimary,
              child: SvgPicture.asset(
                Assets.images.icon.heart,
                width: 10.w,
                height: 10.h,
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,

            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.spacing.sm.w,
                vertical: context.spacing.md.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: HBTextStyles.bodySemiboldSmall(
                      context.colorScheme.onPrimary,
                    ),
                  ),
                  SizedBox(height: context.spacing.xs),
                  Text(
                    widget.location,
                    style: HBTextStyles.bodyMediumXSmall(
                      context.colorScheme.onPrimary,
                    ),
                  ),
                  SizedBox(height: context.spacing.xs.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.l10n.price(formatPrice(widget.currentPrice)) +
                            context.l10n.night,
                        style: HBTextStyles.bodySemiboldSmall(
                          context.colorScheme.onPrimary,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.images.icon.solarStarBold,
                            width: 12.w,
                            height: 12.h,
                          ),
                          SizedBox(width: context.spacing.xs),
                          Text(
                            '${widget.rating}',
                            style: HBTextStyles.bodySemiboldXSmall(
                              context.colorScheme.onPrimary,
                            ),
                          ),
                          SizedBox(width: context.spacing.sm.w),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
