import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/build_divider.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/core/utils/format.dart';
import 'package:hotel_booking_app/core/widgets/cards/header_card.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';

class PaymentDetail extends StatefulWidget {
  const PaymentDetail({
    required this.hotel,
    required this.nightsCount,
    required this.guestCount,
    super.key,
  });

  final Hotel hotel;
  final int nightsCount;
  final int guestCount;

  @override
  State<PaymentDetail> createState() => _PaymentDetailState();
}

class _PaymentDetailState extends State<PaymentDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderCard(
          title: context.l10n.paymentDetails,
          onPressed: () {},
          titleBtn: '',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.total(widget.nightsCount),
                  style: HBTextStyles.bodyRegularMedium(
                    context.colorScheme.tertiary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  context.l10n.cleaningFee,
                  style: HBTextStyles.bodyRegularMedium(
                    context.colorScheme.tertiary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  context.l10n.serviceFee,
                  style: HBTextStyles.bodyRegularMedium(
                    context.colorScheme.tertiary,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  context.l10n.price(
                    formatCurrency(
                      (widget.hotel.currentPrice ?? 0.000) * widget.nightsCount,
                    ),
                  ),
                  style: HBTextStyles.bodyRegularLarge(
                    context.colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  context.l10n.price(r'$5'),
                  style: HBTextStyles.bodyRegularLarge(
                    context.colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  context.l10n.price('\$${5 * widget.guestCount}'),
                  style: HBTextStyles.bodyRegularLarge(
                    context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
        const BuildDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.l10n.totalPayment,
              style: HBTextStyles.bodySemiboldXLarge(
                context.colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              context.l10n.price(
                formatCurrency(
                  (widget.hotel.currentPrice ?? 0) * widget.nightsCount +
                      (widget.guestCount * 5) +
                      5,
                ),
              ),
              style: HBTextStyles.bodySemiboldXLarge(
                context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
