import 'package:flutter/material.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/features/request_booking/widgets/request/pay_with.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: PayWith)
Widget buildPayWithUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PayWith(
          nameBank: context.knobs.string(label: 'Name Bank', initialValue: 'MB Bank'),
          accountNumber: context.knobs.string(
            label: context.l10n.phone,
            initialValue: '0834997661',
          ),
        ),
      ],
    ),
  );
}
