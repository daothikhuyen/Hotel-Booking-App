import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/ui/core/core.dart';
import 'package:hotel_booking_app/ui/core/widgets/app_bar.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/header_card.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/recommended_card.dart';
import 'package:hotel_booking_app/utils/format.dart';

class BookingDetailScreen extends StatefulWidget {
  const BookingDetailScreen({required this.booking, super.key});

  final Booking booking;

  @override
  State<BookingDetailScreen> createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends State<BookingDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final hotel = widget.booking.hotel;
    final booking = widget.booking;
    return Scaffold(
      appBar: HBAppBar(
        isScrolled: false,
        title: context.l10n.bookingDetail,
        color: context.colorScheme.onSurfaceVariant,
        onPressed: () => context.pop(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: context.spacing.lg.w,
            right: context.spacing.lg.w,
            bottom: context.spacing.lg.h,
          ),
          margin: EdgeInsets.only(
            left: context.spacing.lg,
            right: context.spacing.lg,
            top: context.spacing.lg,
          ),
          decoration: BoxDecoration(
            border: Border.all(width: 1.1, color: context.colorScheme.outline),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              HeaderCard(
                title: context.l10n.yourHotel,
                onPressed: () {
                  //TODOs: ....
                },
                titleBtn: '',
                color: context.colorScheme.onTertiary,
              ),
              RecommendedCard(
                linkImage: hotel.image,
                name: hotel.name,
                location: hotel.location,
                currentPrice: hotel.currentPrice ?? 0,
                rating: hotel.rating.toString(),
              ),
              SizedBox(height: context.spacing.sm),
              HeaderCard(
                title: context.l10n.location,
                onPressed: () {
                  //TODOs: ....
                },
                titleBtn: context.l10n.openMap,
                color: context.colorScheme.onTertiary,
              ),
              Container(
                height: 120.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  image: DecorationImage(
                    image: AssetImage(Assets.images.home.map2.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: context.spacing.sm.h),
              HeaderCard(
                title: context.l10n.yourBooking,
                onPressed: () {
                  //TODOs: ....
                },
                titleBtn: '',
                color: context.colorScheme.onTertiary,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            Assets.images.icon.calendar,
                            colorFilter: ColorFilter.mode(
                              context.colorScheme.onSurfaceVariant.withValues(
                                alpha: 0.7,
                              ),
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(height: context.spacing.sm),
                          SvgPicture.asset(
                            Assets.images.icon.profile,
                            colorFilter: ColorFilter.mode(
                              context.colorScheme.onSurfaceVariant.withValues(
                                alpha: 0.7,
                              ),
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(height: context.spacing.sm.h),
                          SvgPicture.asset(
                            Assets.images.icon.building,
                            colorFilter: ColorFilter.mode(
                              context.colorScheme.onSurfaceVariant.withValues(
                                alpha: 0.7,
                              ),
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(height: context.spacing.sm.h),
                          SvgPicture.asset(
                            Assets.images.icon.call,
                            colorFilter: ColorFilter.mode(
                              context.colorScheme.onSurfaceVariant.withValues(
                                alpha: 0.7,
                              ),
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: context.spacing.sm.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.l10n.date,
                            style: HBTextStyles.bodyRegularMedium(
                              context.colorScheme.onSurface,
                            ),
                          ),
                          SizedBox(height: context.spacing.sm.h),
                          Text(
                            context.l10n.guest,
                            style: HBTextStyles.bodyRegularMedium(
                              context.colorScheme.onSurface,
                            ),
                          ),
                          SizedBox(height: context.spacing.sm.h),
                          Text(
                            context.l10n.roomType,
                            style: HBTextStyles.bodyRegularMedium(
                              context.colorScheme.onSurface,
                            ),
                          ),
                          SizedBox(height: context.spacing.sm.h),
                          Text(
                            context.l10n.phone,
                            style: HBTextStyles.bodyRegularMedium(
                              context.colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        formatBookingDate(booking.checkIn, booking.checkOut),
                        style: HBTextStyles.bodyMediumMedium(
                          context.colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: context.spacing.sm.h),
                      Text(
                        context.l10n.numberGuest(booking.guests, 1),
                        style: HBTextStyles.bodyMediumMedium(
                          context.colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: context.spacing.sm.h),
                      Text(
                        booking.hotel.roomType,
                        style: HBTextStyles.bodyMediumMedium(
                          context.colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: context.spacing.sm.h),
                      Text(
                        booking.user.numberPhone != '0'
                            ? booking.user.numberPhone ?? '0'
                            : '0834886773',
                        style: HBTextStyles.bodyMediumMedium(
                          context.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: context.spacing.lg.h),
              Image.asset(Assets.images.icon.barcode.path),
              SizedBox(height: context.spacing.xs.h),
              Text(
                '06158310-5427-471d-af1f-bd9029b',
                style: HBTextStyles.bodyMediumXSmall(
                  context.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
