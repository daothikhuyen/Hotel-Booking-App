import 'package:flutter/material.dart';
import 'package:hotel_booking_app/features/my_booking/widgets/booking_card.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: BookingCard)
Widget buildRecomendedItemUseCase(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(18),
    child: BookingCard(
            linkImage: context.knobs.stringOrNull(
        label: 'Link Image', 
        initialValue: 'assets/images/home/FrameOne.png',
      ),
      name: context.knobs.string(
        label: 'Title',
        initialValue: 'Most Popular Hotel',
      ),
      location: context.knobs.string(
        label: 'Address',
        initialValue: 'Los Angeles, CA',
      ),
      dateTime: context.knobs.string(
        label: 'Date Time',
        initialValue: '12-14 Nov 2024',
      ),
      currentPrice: double.parse(
        context.knobs.double
            .slider(label: 'Price', initialValue: 450.0, min: 300, max: 1000.0)
            .toStringAsFixed(2),
      ),
      ratting: context.knobs.string(label: 'Ratting', initialValue: '4.5'),
      guest:context.knobs.int.input(label: 'Guest', initialValue: 100),
      numberRoom: context.knobs.int.input(label: 'Number Room', initialValue: 2)
    ),
  );
}