import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/features/request_booking/widgets/request/payment_detail.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: PaymentDetail)
Widget buildPaymentDetailUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PaymentDetail(
          nightlyRate: context.knobs.double.input(
            label: context.l10n.nightlyRate,
            initialValue: 5,
          ),
          serviceFee: context.knobs.double.input(
            label: context.l10n.serviceFee,
            initialValue: 5,
          ),
          cleaningFree: context.knobs.double.input(
            label: context.l10n.cleaningFee,
            initialValue: 5,
          ),
          nightsCount: context.knobs.int.input(
            label: context.l10n.nightsCount,
            initialValue: 5,
          ),
        ),
      ],
    ),
  );
}
