import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/build_divider.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/core/utils/format.dart';
import 'package:hotel_booking_app/core/widgets/cards/header_card.dart';
import 'package:hotel_booking_app/features/request_booking/helpers/booking_helper.dart';

class PaymentDetail extends StatefulWidget {
  const PaymentDetail({
    required this.nightlyRate,
    required this.serviceFee,
    required this.cleaningFree,
    required this.nightsCount,
    super.key,
  });

  final double nightlyRate;
  final double serviceFee;
  final double cleaningFree;
  final int nightsCount;

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
                  context.l10n.price(formatPrice(widget.nightlyRate)),
                  style: HBTextStyles.bodyRegularLarge(
                    context.colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  context.l10n.price(formatPrice(widget.cleaningFree)),
                  style: HBTextStyles.bodyRegularLarge(
                    context.colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  context.l10n.price(formatPrice(widget.serviceFee)),
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
                formatPrice(
                  calculatorTotalPrice(
                    widget.nightlyRate,
                    widget.cleaningFree,
                    widget.serviceFee,
                  ),
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
