import 'package:flutter/material.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/features/profile/widgets/option_card.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: OptionCard)
Widget buildOptionCardUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: OptionCard(
      title: context.knobs.string(
        label: context.l10n.title,
        initialValue: context.l10n.yourCard,
      ),
      image: context.knobs.string(
        label: 'Link Image',
        initialValue: Assets.images.icon.calendar,
      ), onPressed: () {  },
    ),
  );
}
