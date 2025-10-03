import 'package:hotel_booking_app/ui/core/core.dart';
import 'package:hotel_booking_app/utils/format.dart';

class BestTodayCard extends StatelessWidget {
  const BestTodayCard({
    required this.name,
    required this.address,
    required this.currentPrice,
    required this.rating,
    required this.traffic,
    required this.lastPrice,
    required this.linkImage,
    super.key,
  });

  final String linkImage;
  final String name;
  final String address;
  final double currentPrice;
  final double lastPrice;
  final double rating;
  final int traffic;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 101.h,
      width: 300.w,
      padding: EdgeInsets.all(context.spacing.sm),
      margin: EdgeInsets.only(right: context.spacing.md.w),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.02.w,
          color: context.colorScheme.outline.withValues(alpha: 0.7),
        ),
        borderRadius: BorderRadius.circular(18),
        color: context.colorScheme.onPrimary,
      ),
      child: Row(
        children: [
          Container(
            width: 75.h,
            height: 75.h,
            margin: EdgeInsets.only(
              right: context.spacing.sm,
              left: context.spacing.xs,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              image: DecorationImage(
                image: NetworkImage(linkImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                name,
                style: HBTextStyles.bodySemiboldSmall(
                  context.colorScheme.onSurfaceVariant,
                ),
              ),
              SizedBox(height: context.spacing.sm),
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.images.icon.location,
                    colorFilter: ColorFilter.mode(
                      context.colorScheme.onSurfaceVariant.withValues(
                        alpha: 0.7,
                      ),
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: context.spacing.xs),
                  Text(
                    address,
                    style: HBTextStyles.bodyRegularSmall(
                      context.colorScheme.onTertiary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.spacing.xs),

              Row(
                children: [
                  SvgPicture.asset(
                    Assets.images.icon.solarStarBold,
                    width: 16.w,
                    height: 16.h,
                  ),
                  SizedBox(width: context.spacing.xs),
                  Text(
                    rating.toString(),
                    style: HBTextStyles.bodySemiboldXSmall(
                      context.colorScheme.onError,
                    ),
                  ),
                  SizedBox(width: context.spacing.xs),
                  Text(
                    context.l10n.traffic(traffic),
                    style: HBTextStyles.bodyRegularXSmall(
                      context.colorScheme.inverseSurface.withValues(alpha: 0.5),
                    ),
                  ),

                  SizedBox(width: context.spacing.lg),
                  Text(
                    context.l10n.price(formatPrice(currentPrice / 1000)),
                    style: HBTextStyles.bodySemiboldSmall(
                      context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(width: context.spacing.lg),
                  Text(
                    context.l10n.price(formatPrice(lastPrice / 1000)),
                    style: HBTextStyles.bodyMediumXSmall(
                      context.colorScheme.error,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: context.colorScheme.error,
                      decorationThickness: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
