import 'package:flutter/material.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/features/auth/widgets/social_item.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: SocialItem)
Widget buildSocailItemUseCase(BuildContext context) {
  return SocialItem(
    linkIcon: context.knobs.string(
      label: context.l10n.linkImage,
      initialValue: Assets.images.icon.iconApple,
    ),
    onPressed: () {
      //TODOS:...
    },
  );
}
