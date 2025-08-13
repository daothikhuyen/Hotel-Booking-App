import 'package:flutter/material.dart';
import 'package:hotel_booking_app/widgets/home/items/most_popular_item.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: MostPopularItem)
Widget buildMostPopularItemUseCase(BuildContext context) {
  return Center(
    child: MostPopularItem(
      linkImage: context.knobs.stringOrNull(
        label: 'Link Image', 
        initialValue: 'assets/images/home/FrameOne.png',
      ),
      name: context.knobs.string(
        label: 'Title',
        initialValue: 'Most Popular Hotel',
      ),
      address: context.knobs.string(
        label: 'Address',
        initialValue: 'Los Angeles, CA',
      ),
      money: double.parse(
        context.knobs.double
            .slider(label: 'Price', initialValue: 450.0, min: 0, max: 1000.0)
            .toStringAsFixed(2),
      ),
      ratting: context.knobs.string(label: 'Ratting', initialValue: '4.5'),
    ),
  );
}
