import 'package:flutter/material.dart';
import 'package:hotel_booking_app/features/auth/widgets/social_item.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_hotel_booking_app/gen/assets.gen.dart';

@widgetbook.UseCase(name: 'Default', type: SocialItem)
Widget buildSocailItemUseCase(BuildContext context) {
  return SocialItem(
    linkIcon: context.knobs.string(
      label: 'Link Image',
      initialValue: Assets.images.icon.iconApple,
    ),
    onPressed: () {
      //TODOS:...
    },
  );
}
