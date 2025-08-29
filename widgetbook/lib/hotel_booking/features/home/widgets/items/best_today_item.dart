import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/widgets/cards/best_today_card.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: BestTodayCard)
Widget buildBestTodayItemUseCase(BuildContext context) {
  return Center(
    child: BestTodayCard(
      linkImage: context.knobs.string(
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
      currentPrice: double.parse(
        context.knobs.double
            .slider(label: 'Price', initialValue: 450.0, min: 0, max: 1000.0)
            .toStringAsFixed(2),
      ),
      ratting: double.parse(
        context.knobs.double
            .slider(label: 'Ratting', initialValue: 450.0, min: 0, max: 1000.0)
            .toStringAsFixed(1),
      ), 
      traffic: context.knobs.int.slider(
        label: 'Traffic',
        initialValue: 100,
        min: 0,
        max: 500,
      ), lastPrice:  double.parse(
        context.knobs.double
            .slider(label: 'Last Price', initialValue: 500.0, min: 0, max: 1000.0)
            .toStringAsFixed(2),
      )
    ),
  );
}
