import 'package:flutter/material.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/features/home/widgets/card/popular_card.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: PopularCard)
Widget buildMostPopularItemUseCase(BuildContext context) {
  return Center(
    child: PopularCard(
      linkImage: context.knobs.stringOrNull(
        label: context.l10n.linkImage ,
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
      currentPrice: double.parse(
        context.knobs.double
            .slider(label: context.l10n.priceDetails, initialValue: 450.0, min: 0, max: 1000.0)
            .toStringAsFixed(2),
      ),
      rating: context.knobs.double.slider(label: context.l10n.rating, initialValue: 4.6),
    ),
  );
}
