import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/core/utils/format.dart';
import 'package:hotel_booking_app/core/widgets/app_bar.dart';
import 'package:hotel_booking_app/core/widgets/cards/header_card.dart';
import 'package:hotel_booking_app/core/widgets/cards/recomended_card.dart';
import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';

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
      body: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        margin: const EdgeInsets.only(left: 18, right: 18, top: 18),
        decoration: BoxDecoration(
          border: Border.all(width: 1.1, color: context.colorScheme.outline),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            HeaderCard(
              title: context.l10n.yourHotel,
              onPressed: () {
                //TODOs: ....
              },
              titleBtn: '',
              color: context.colorScheme.onTertiary,
            ),
            RecomendedCard(
              linkImage: hotel.image,
              name: hotel.name,
              location: hotel.location,
              currentPrice: hotel.currentPrice ?? 0,
              ratting: hotel.ratting.toString(),
            ),
            const SizedBox(height: 8),
            HeaderCard(
              title: context.l10n.location,
              onPressed: () {
                //TODOs: ....
              },
              titleBtn: context.l10n.openMap,
              color: context.colorScheme.onTertiary,
            ),
            Container(
              // margin: const EdgeInsets.only(top: 10, bottom: 10),
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(Assets.images.home.map2.path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
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
                        const SizedBox(height: 10),
                        SvgPicture.asset(
                          Assets.images.icon.profile,
                          colorFilter: ColorFilter.mode(
                            context.colorScheme.onSurfaceVariant.withValues(
                              alpha: 0.7,
                            ),
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SvgPicture.asset(
                          Assets.images.icon.building,
                          colorFilter: ColorFilter.mode(
                            context.colorScheme.onSurfaceVariant.withValues(
                              alpha: 0.7,
                            ),
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(height: 10),
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
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.date,
                          style: HBTextStyles.bodyRegularMedium(
                            context.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          context.l10n.guest,
                          style: HBTextStyles.bodyRegularMedium(
                            context.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          context.l10n.roomType,
                          style: HBTextStyles.bodyRegularMedium(
                            context.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 10),
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
                    const SizedBox(height: 10),
                    Text(
                      context.l10n.numberGuest(booking.guests, 1),
                      style: HBTextStyles.bodyMediumMedium(
                        context.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      booking.hotel.roomType,
                      style: HBTextStyles.bodyMediumMedium(
                        context.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 10),
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
            const SizedBox(height: 50),
            Image.asset(Assets.images.icon.barcode.path),
            const SizedBox(height: 5),
            Text(
              '06158310-5427-471d-af1f-bd9029b',
              style: HBTextStyles.bodyMediumXSmall(
                context.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
