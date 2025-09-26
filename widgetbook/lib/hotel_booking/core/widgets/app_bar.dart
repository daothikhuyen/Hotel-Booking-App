import 'package:flutter/material.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/widgets/app_bar.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: HBAppBar)
Widget buildHBAppBarUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Center(
      child: HBAppBar(
        title: context.knobs.string(label: context.l10n.title, initialValue: 'Request'),
        isScrolled: context.knobs.boolean(
          label: context.l10n.isScrolled,
          initialValue: true,
        ),
        color: context.colorScheme.onSecondary,
        onPressed: () {},
      ),
    ),
  );
}
