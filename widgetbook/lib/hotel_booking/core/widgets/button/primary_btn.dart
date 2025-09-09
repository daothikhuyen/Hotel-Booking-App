import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/widgets/buttons/primary_btn.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: PrimaryBtn)
Widget buildPrimaryBtnUseCase(BuildContext context) {
  return Center(child: PrimaryBtn(
    size:  double.parse(
        context.knobs.double
            .slider(label: 'Size', initialValue: 450.0, min: 0, max: 1000.0)
            .toStringAsFixed(1),
      ),
    textButton: context.knobs.string(
      label: context.l10n.titleButton,
      initialValue: 'Book Now',
    ),
    onPressed: () {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.buttonPressed)),
      );
    },
    bold: context.knobs.boolean(label: context.l10n.bold, initialValue: true)
  ));
}
