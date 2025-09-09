import 'package:flutter/material.dart';
import 'package:hotel_booking_app/features/request_booking/widgets/request/pay_with.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: PayWith)
Widget buildPayWithUseCase(BuildContext context) {
  return PayWith(
    nameBank: context.knobs.string(label: 'Name Bank', initialValue: 'MB Bank'),
    accountNumber: context.knobs.string(
      label: 'Account Number',
      initialValue: '0834997661',
    ),
  );
}
