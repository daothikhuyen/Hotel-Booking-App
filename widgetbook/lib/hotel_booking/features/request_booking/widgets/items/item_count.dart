import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/features/request_booking/widgets/items/item_counter.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_hotel_booking_app/gen/assets.gen.dart';

@widgetbook.UseCase(name: 'Default', type: ItemCounter)
Widget buildItemCountUseCase(BuildContext context) {
  return ItemCounter(
    icon: Assets.images.icon.calendar,
    color: context.colorScheme.primary,
    background: context.colorScheme.primary,
    size: 40,
    onPressed: () {},
  );
}
