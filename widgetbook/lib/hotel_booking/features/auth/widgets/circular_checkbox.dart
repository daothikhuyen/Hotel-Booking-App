import 'package:flutter/material.dart';
import 'package:hotel_booking_app/features/auth/widgets/circular_checkbox%20.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: CircularCheckbox)
Widget buildCircularCheckbocUseCase(BuildContext context) {
  return CircularCheckbox(
    size: context.knobs.double.slider(
      label: 'Size',
      initialValue: 25,
      min: 10,
      max: 100,
    ),
    isCheckbox: context.knobs.boolean(
      label: 'Is Checkbox',
      initialValue: false,
    ),
  );
}
