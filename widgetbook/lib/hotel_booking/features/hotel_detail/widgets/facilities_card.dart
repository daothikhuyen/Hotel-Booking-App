import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/features/hotel_detail/widgets/facilities_card.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_hotel_booking_app/gen/assets.gen.dart';

@widgetbook.UseCase(name: 'Default', type: FacilitiesCard)
Widget buildMainHomeUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      FacilitiesCard(
        icon: context.knobs.string(
          label: context.l10n.linkImage,
          initialValue: Assets.images.icon.wind,
        ),
        title: context.knobs.string(label: 'Title', initialValue: 'AC'),
      ),
    ],
  );
}
