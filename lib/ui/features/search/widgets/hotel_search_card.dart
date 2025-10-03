import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/ui/core/core.dart';
import 'package:hotel_booking_app/utils/format.dart';

class HotelSearchCard extends StatelessWidget {
  const HotelSearchCard({required this.hotel, super.key});

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.spacing.lg),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 180.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  image: DecorationImage(
                    image:
                        hotel.image != ''
                            ? NetworkImage(hotel.image)
                            : AssetImage(Assets.images.home.frameOne.path)
                                as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: context.spacing.sm.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.spacing.xs.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hotel.name,
                          style: HBTextStyles.bodySemiboldMedium(
                            context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        SizedBox(height: context.spacing.xs.h),
                        Text(
                          hotel.location,
                          style: HBTextStyles.bodyRegularSmall(
                            context.colorScheme.onTertiary,
                          ),
                        ),
                        SizedBox(height: context.spacing.xs),
                        Row(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.images.icon.doubleBed,
                                  colorFilter: ColorFilter.mode(
                                    context.colorScheme.onSurfaceVariant
                                        .withValues(alpha: 0.7),
                                    BlendMode.srcIn,
                                  ),
                                ),
                                SizedBox(height: context.spacing.xs.h),
                                Text(
                                  context.l10n.bed(hotel.bed ?? 0),
                                  style: HBTextStyles.bodySemiboldSmall(
                                    context.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: context.spacing.sm),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.images.icon.bathroomTubTowel,
                                  colorFilter: ColorFilter.mode(
                                    context.colorScheme.onSurfaceVariant
                                        .withValues(alpha: 0.7),
                                    BlendMode.srcIn,
                                  ),
                                ),
                                SizedBox(height: context.spacing.xs.h),
                                Text(
                                  context.l10n.bathroom(hotel.bathroom ?? 0),
                                  style: HBTextStyles.bodySemiboldSmall(
                                    context.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          context.l10n.price(formatPrice(320000 / 1000)),
                          style: HBTextStyles.bodySemiboldMedium(
                            context.colorScheme.primary,
                          ),
                        ),
                        SizedBox(height: context.spacing.xs.h),
                        Text(
                          context.l10n.perNight,
                          style: HBTextStyles.bodyRegularSmall(
                            context.colorScheme.onTertiary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 180.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: context.colorScheme.inverseSurface.withValues(alpha: 0.15),
            ),
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.all(context.spacing.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 56.w,
                    height: 24.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: context.colorScheme.surface.withValues(
                        alpha: 0.25,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.images.icon.solarStarBold,
                          width: 12.w,
                          height: 12.w,
                        ),
                        SizedBox(height: context.spacing.xs),
                        Text(
                          '${hotel.rating}',
                          style: HBTextStyles.bodySemiboldXSmall(
                            context.colorScheme.onPrimary,
                          ),
                        ),
                        SizedBox(height: context.spacing.sm),
                      ],
                    ),
                  ),
                  Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: context.colorScheme.surface.withValues(
                        alpha: 0.25,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(context.spacing.xs),
                      child: SvgPicture.asset(Assets.images.icon.heartWhite),
                    ),
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
