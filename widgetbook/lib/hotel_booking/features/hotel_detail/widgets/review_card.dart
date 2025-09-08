import 'package:flutter/material.dart';
import 'package:hotel_booking_app/features/hotel_detail/widgets/review_card.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: ReviewCard)
Widget buildMainHomeUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: ReviewCard(number: 3),
  );
}