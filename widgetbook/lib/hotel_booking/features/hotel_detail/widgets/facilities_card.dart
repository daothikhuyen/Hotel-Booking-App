import 'package:flutter/material.dart';
import 'package:hotel_booking_app/features/hotel_detail/widgets/facilities_card.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_hotel_booking_app/gen/assets.gen.dart';

@widgetbook.UseCase(name: 'Default', type: FacilitiesCard)
Widget buildMainHomeUseCase(BuildContext context) {
  return Center(
    child: FacilitiesCard(
      icon: context.knobs.string(
        label: 'Link Image',
        initialValue: Assets.images.icon.stroke4,
      ),
      title: context.knobs.string(
        label: 'Title',
        initialValue: 'AC',
      ),
    ),
  );
}
