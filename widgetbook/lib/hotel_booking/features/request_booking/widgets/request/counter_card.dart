import 'package:flutter/material.dart';
import 'package:hotel_booking_app/features/request_booking/widgets/request/counter_card.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: CounterCard)
Widget buildCounterCardUseCase(BuildContext context) {
  return CounterCard();
}