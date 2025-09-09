import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/widgets/cards/recomended_card.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: RecomendedCard)
Widget buildRecomendedItemUseCase(BuildContext context) {
  return Center(
    child: RecomendedCard(
        linkImage: context.knobs.stringOrNull(
        label: 'Link Image', 
        initialValue:  Assets.images.home.frameOne.path,
      ),
      name: context.knobs.string(
        label: 'Title',
        initialValue: 'Most Popular Hotel',
      ),
      location: context.knobs.string(
        label: 'Address',
        initialValue: 'Los Angeles, CA',
      ),
      currentPrice: double.parse(
        context.knobs.double
            .slider(label: 'Price', initialValue: 450.0, min: 0, max: 1000.0)
            .toStringAsFixed(2),
      ),
      ratting: context.knobs.string(label: 'Ratting', initialValue: '4.5'),
    ),
  );
}