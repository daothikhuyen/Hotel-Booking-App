import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/widgets/cards/best_today_card.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: BestTodayCard)
Widget buildBestTodayCardUseCase(BuildContext context) {
  return Center(
    child: BestTodayCard(
      linkImage: context.knobs.string(
        label: context.l10n.linkImage,
        initialValue: 'http://res.cloudinary.com/dfa17qrac/image/upload/v1755243539/images/mgppcv00ezxvztuspqaj.jpg',
      ),
      name: context.knobs.string(
        label: context.l10n.localeName,
        initialValue: 'Most Popular Hotel',
      ),
      address: context.knobs.string(
        label: context.l10n.location,
        initialValue: 'Los Angeles, CA',
      ),
      currentPrice: double.parse(
        context.knobs.double
            .slider(label: context.l10n.priceDetails, initialValue: 450.0, min: 0, max: 1000.0)
            .toStringAsFixed(2),
      ),
      ratting: double.parse(
        context.knobs.double
            .slider(label: context.l10n.ratting, initialValue: 450.0, min: 0, max: 1000.0)
            .toStringAsFixed(1),
      ), 
      traffic: context.knobs.int.slider(
        label: context.l10n.trafic,
        initialValue: 100,
        min: 0,
        max: 500,
      ), lastPrice:  double.parse(
        context.knobs.double
            .slider(label: context.l10n.lastPrice, initialValue: 500.0, min: 0, max: 1000.0)
            .toStringAsFixed(2),
      )
    ),
  );
}
