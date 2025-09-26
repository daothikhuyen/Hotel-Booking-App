import 'package:flutter/material.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/recommended_card.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: RecommendedCard)
Widget buildRecommendedCardUseCase(BuildContext context) {
  return Center(
    child: RecommendedCard(
        linkImage: context.knobs.stringOrNull(
        label: context.l10n.linkImage, 
        initialValue:  '',
      ),
      name: context.knobs.string(
        label: context.l10n.title,
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
      rating: context.knobs.string(label: context.l10n.rating, initialValue: '4.5'),
    ),
  );
}