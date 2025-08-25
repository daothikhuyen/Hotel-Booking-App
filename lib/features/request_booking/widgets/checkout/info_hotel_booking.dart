import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';

class InfoHotelBooking extends StatelessWidget {
  const InfoHotelBooking({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.only(top: 23),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.02,
          color: context.colorScheme.outline,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.yourBooking,
            style: HBTextStyles.bodySemiboldMedium(
              context.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 10),
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
                          context.colorScheme.onSurfaceVariant
                              .withValues(alpha: 0.7),
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SvgPicture.asset(
                        Assets.images.icon.profile,
                        colorFilter: ColorFilter.mode(
                          context.colorScheme.onSurfaceVariant
                              .withValues(alpha: 0.7),
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SvgPicture.asset(
                        Assets.images.icon.building,
                        colorFilter: ColorFilter.mode(
                          context.colorScheme.onSurfaceVariant
                              .withValues(alpha: 0.7),
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SvgPicture.asset(
                        Assets.images.icon.call,
                        colorFilter: ColorFilter.mode(
                          context.colorScheme.onSurfaceVariant
                              .withValues(alpha: 0.7),
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
                    '12-14 Nov 2024',
                    style: HBTextStyles.bodyMediumMedium(
                      context.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '2 Guests(1 Room)',
                    style: HBTextStyles.bodyMediumMedium(
                      context.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Queen Room',
                    style: HBTextStyles.bodyMediumMedium(
                      context.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '0837665551',
                    style: HBTextStyles.bodyMediumMedium(
                      context.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Dash(
                  length: constraints.maxWidth,
                  dashLength: 9,
                  dashColor: context.colorScheme.primary.withValues(
                    alpha: 0.7,
                  ),
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
              const SizedBox(height: 5),
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
                      const SizedBox(height: 10),
                      Text(
                        context.l10n.adminFee,
                        style: HBTextStyles.bodyMediumMedium(
                          context.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 10),
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
                        context.l10n.price(r'$139.000'),
                        style: HBTextStyles.bodySemiboldMedium(
                          context.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        context.l10n.price(r'$2.50'),
                        style: HBTextStyles.bodySemiboldMedium(
                          context.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        context.l10n.price(r'$141.150'),
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
