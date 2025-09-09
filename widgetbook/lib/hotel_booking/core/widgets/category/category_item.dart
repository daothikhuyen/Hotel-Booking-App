import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/widgets/category/category_item.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: CategoryItem)
Widget buildCategoryItemUseCase(BuildContext context) {
  return Center(
    child: CategoryItem(
      title:  context.knobs.string(
        label: 'Address',
        initialValue: 'Los Angeles, CA',
      ),
      linkImage: context.knobs.stringOrNull(
        label: 'Icon', 
        initialValue:  Assets.images.icon.villa.path,
      ),
      isSelected:  context.knobs.boolean(
      label: 'Selected',
      initialValue: false,
    ),
    ),
  );
}
