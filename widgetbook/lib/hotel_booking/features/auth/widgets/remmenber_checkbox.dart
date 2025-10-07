import 'package:flutter/material.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/features/auth/widgets/remmenber_checkbox.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: RemmenberCheckbox)
Widget buildCircularCheckbocUseCase(BuildContext context) {
  return RemmenberCheckbox(
    size: context.knobs.double.slider(
      label: 'Size',
      initialValue: 25,
      min: 10,
      max: 100,
    ),
    isTicked: context.knobs.boolean(
      label: context.l10n.isCheckBox,
      initialValue: false,
    ),
  );
}
