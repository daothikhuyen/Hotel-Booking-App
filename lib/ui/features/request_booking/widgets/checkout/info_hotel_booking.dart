import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/themes/theme.dart';
import 'package:hotel_booking_app/utils/format.dart';

class InfoHotelBooking extends StatefulWidget {
  const InfoHotelBooking({required this.booking, super.key});

  final Booking booking;

  @override
  State<InfoHotelBooking> createState() => _InfoHotelBookingState();
}

class _InfoHotelBookingState extends State<InfoHotelBooking> {
  String dateBooking = '';

  @override
  Widget build(BuildContext context) {
    final booking = widget.booking;

    return Container(
      padding: EdgeInsets.all(context.spacing.lg),
      margin: EdgeInsets.only(top: context.spacing.xl),
      decoration: BoxDecoration(
        border: Border.all(width: 1.02, color: context.colorScheme.outline),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.yourBooking,
            style: HBTextStyles.bodySemiboldMedium(context.colorScheme.primary),
          ),
          SizedBox(height: context.spacing.sm),
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
                      SizedBox(height: context.spacing.sm),
                      SvgPicture.asset(
                        Assets.images.icon.building,
                        colorFilter: ColorFilter.mode(
                          context.colorScheme.onSurfaceVariant.withValues(
                            alpha: 0.7,
                          ),
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(height: context.spacing.sm),
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
                  SizedBox(height: context.spacing.sm),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.date,
                        style: HBTextStyles.bodyRegularMedium(
                          context.colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: context.spacing.sm),
                      Text(
                        context.l10n.guest,
                        style: HBTextStyles.bodyRegularMedium(
                          context.colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: context.spacing.sm),
                      Text(
                        context.l10n.roomType,
                        style: HBTextStyles.bodyRegularMedium(
                          context.colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: context.spacing.sm),
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
                  SizedBox(height: context.spacing.sm),
                  Text(
                    context.l10n.numberGuest(booking.guests, 1),
                    style: HBTextStyles.bodyMediumMedium(
                      context.colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: context.spacing.sm),
                  Text(
                    booking.hotel.roomType,
                    style: HBTextStyles.bodyMediumMedium(
                      context.colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: context.spacing.sm),
                  Text(
                    booking.user.numberPhone ?? '0834007781',
                    style: HBTextStyles.bodyMediumMedium(
                      context.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: context.spacing.xl),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Dash(
                  length: constraints.maxWidth,
                  dashLength: 9,
                  dashColor: context.colorScheme.primary.withValues(alpha: 0.7),
                );
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.priceDetails,
                style: HBTextStyles.bodySemiboldMedium(
                  context.colorScheme.primary,
                ),
              ),
              SizedBox(height: context.spacing.xs),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.titlePrice,
                        style: HBTextStyles.bodyMediumMedium(
                          context.colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: context.spacing.sm),
                      Text(
                        context.l10n.cleaningFee,
                        style: HBTextStyles.bodyMediumMedium(
                          context.colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: context.spacing.sm),
                      Text(
                        context.l10n.serviceFee,
                        style: HBTextStyles.bodyMediumMedium(
                          context.colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: context.spacing.sm),
                      Text(
                        context.l10n.totalPrice,
                        style: HBTextStyles.bodySemiboldMedium(
                          context.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        context.l10n.price(formatPrice(booking.nightlyRate)),
                        style: HBTextStyles.bodySemiboldMedium(
                          context.colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: context.spacing.sm),
                      Text(
                        context.l10n.price(formatPrice(booking.cleaningFee)),
                        style: HBTextStyles.bodySemiboldMedium(
                          context.colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: context.spacing.sm),
                      Text(
                        context.l10n.price(formatPrice(booking.serviceFee)),
                        style: HBTextStyles.bodySemiboldMedium(
                          context.colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: context.spacing.sm),
                      Text(
                        context.l10n.price(formatPrice(booking.totalPrice)),
                        style: HBTextStyles.bodySemiboldMedium(
                          context.colorScheme.onSurface,
                        ),
                      ),
                    ],
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
