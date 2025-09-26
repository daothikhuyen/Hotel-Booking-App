import 'package:flutter/material.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/features/home/widgets/header_bar.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: HeaderBar)
Widget buildHeaderBarUseCase(BuildContext context) {
  return Center(
    child: HeaderBar(
      linkImage: context.knobs.string(
        label: context.l10n.linkImage,
        initialValue:  Assets.images.avatar.ellipse.path,
      ),
      userName: context.knobs.string(
        label: context.l10n.name,
        initialValue: 'John Doe',
      ),
      location: context.knobs.string(
        label: context.l10n.location,
        initialValue: '123 Main St, Springfield',
      ),
    ),
  );
}
