import 'package:flutter/material.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/features/request_booking/widgets/items/item_counter.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: ItemCounter)
Widget buildItemCountUseCase(BuildContext context) {
  return ItemCounter(
    icon: Assets.images.icon.calendar,
    color: context.colorScheme.outline,
    background: context.colorScheme.primary,
    size: 40,
    onPressed: () {},
  );
}
