import 'package:flutter/material.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/widgets/textfield.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: HBTextField)
Widget buildHBTextFieldUseCase(BuildContext context) {
  final controller = TextEditingController(text: context.l10n.emailAddress);
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Center(
      child: HBTextField(
        controller: controller,
        hintText: context.knobs.string(
          label: context.l10n.hintText,
          initialValue: context.l10n.errorEmptyEmail,
        ),
        color: context.colorScheme.outline.withValues(alpha: 0.4),
      ),
    ),
  );
}
