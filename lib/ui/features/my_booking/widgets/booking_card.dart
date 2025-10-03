import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/themes/theme.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/build_divider.dart';
import 'package:hotel_booking_app/utils/format.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({
    required this.name,
    required this.location,
    required this.currentPrice,
    required this.rating,
    required this.dateTime,
    required this.guest,
    super.key,
    this.linkImage,
  });

  final String? linkImage;
  final String name;
  final String location;
  final double currentPrice;
  final String rating;
  final String dateTime;
  final int guest;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,
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
          Expanded(
            flex: 3,
            child: Container(
              width: 96.w,
              margin: EdgeInsets.only(
                right: context.spacing.sm.w,
                left: context.spacing.xs.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                image: DecorationImage(
                  image:
                      linkImage != ''
                          ? NetworkImage(linkImage!)
                          : AssetImage(Assets.images.home.frameOne.path)
                              as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.38,
                      child: Text(
                        name,
                        style: HBTextStyles.bodySemiboldLarge(
                          context.colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: context.spacing.sm.w),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            Assets.images.icon.solarStarBold,
                            width: 16.w,
                            height: 16.h,
                          ),
                          SizedBox(height: context.spacing.xs.h),
                          Text(
                            rating,
                            style: HBTextStyles.bodySemiboldSmall(
                              context.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.spacing.xs.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.images.icon.vector,
                      colorFilter: ColorFilter.mode(
                        context.colorScheme.onTertiary,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(height: context.spacing.xs.h),
                    Text(
                      location,
                      style: HBTextStyles.bodyRegularSmall(
                        context.colorScheme.onTertiary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.spacing.xs),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: context.l10n.price(
                          formatPrice(currentPrice / 1000),
                        ),
                        style: HBTextStyles.bodyMediumLarge(
                          context.colorScheme.primary,
                        ),
                      ),
                      TextSpan(
                        text: context.l10n.night,
                        style: HBTextStyles.bodyMediumMedium(
                          context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: context.spacing.sm.h),
                  child: const BuildDivider(),
                ),
                Padding(
                  padding: EdgeInsets.only(right: context.spacing.sm.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(Assets.images.icon.calendar),
                          SizedBox(height: context.spacing.xs),
                          Text(
                            context.l10n.date,
                            style: HBTextStyles.bodyRegularMedium(
                              context.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        dateTime,
                        style: HBTextStyles.bodySemiboldSmall(
                          context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height:  context.spacing.xs),
                Padding(
                  padding: EdgeInsets.only(right:  context.spacing.sm.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(Assets.images.icon.profile),
                          SizedBox(height: context.spacing.xs),
                          Text(
                            context.l10n.guest,
                            style: HBTextStyles.bodyRegularMedium(
                              context.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        context.l10n.numberGuest(guest, 1),
                        style: HBTextStyles.bodySemiboldSmall(
                          context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
