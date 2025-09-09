import 'package:flutter/material.dart';
import 'package:hotel_booking_app/features/request_booking/widgets/request/payment_detail.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: PaymentDetail)
Widget buildPaymentDetailUseCase(BuildContext context) {
  return PaymentDetail(
    nightlyRate: context.knobs.double.input(
      label: 'Nightly Rate',
      initialValue: 5,
    ),
    serviceFee: context.knobs.double.input(
      label: 'Service Fee',
      initialValue: 5,
    ),
    cleaningFree: context.knobs.double.input(
      label: 'Cleaning Fee',
      initialValue: 5,
    ),
    nightsCount: context.knobs.int.input(
      label: 'Nights Count',
      initialValue: 5,
    ),
  );
}
