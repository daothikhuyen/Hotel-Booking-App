import 'package:flutter/material.dart';
import 'package:hotel_booking_app/features/request_booking/widgets/checkout/promo_card.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: PromoCard)
Widget buildPromoCardUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Center(child: PromoCard()),
  );
}