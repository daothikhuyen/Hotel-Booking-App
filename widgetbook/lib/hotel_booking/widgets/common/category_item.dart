import 'package:flutter/material.dart';
import 'package:hotel_booking_app/widgets/common/category_item.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: CategoryItem)
Widget buildFilterBarUseCase(BuildContext context) {
  return Center(
    child: CategoryItem(
      title: context.knobs.string(label: 'name', initialValue: 'Villa'),
      linkImage: context.knobs.stringOrNull(label: 'Link Image', initialValue: 'assets/images/icon/villa.png'),
      isSelected: context.knobs.boolean(label: 'Selected', initialValue: true),
    )
  );
}