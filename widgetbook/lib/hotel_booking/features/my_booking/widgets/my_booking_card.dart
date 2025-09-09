import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/features/my_booking/widgets/booking_card.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: BookingCard)
Widget buildBookingCardUseCase(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(18),
    child: BookingCard(
            linkImage: context.knobs.stringOrNull(
        label: context.l10n.linkImage, 
        initialValue: 'http://res.cloudinary.com/dfa17qrac/image/upload/v1755243539/images/mgppcv00ezxvztuspqaj.jpg',
      ),
      name: context.knobs.string(
        label: context.l10n.localeName,
        initialValue: 'Most Popular Hotel',
      ),
      location: context.knobs.string(
        label: context.l10n.location,
        initialValue: 'Los Angeles, CA',
      ),
      dateTime: context.knobs.string(
        label: context.l10n.date,
        initialValue: '12-14 Nov 2024',
      ),
      currentPrice: double.parse(
        context.knobs.double
            .slider(label: context.l10n.priceDetails, initialValue: 450.0, min: 300, max: 1000.0)
            .toStringAsFixed(2),
      ),
      ratting: context.knobs.string(label: context.l10n.ratting, initialValue: '4.5'),
      guest:context.knobs.int.input(label: context.l10n.guest, initialValue: 100),
    ),
  );
}