import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/widgets/category/category_list.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: CategoryList)
Widget buildCategoryListUseCase(BuildContext context) {
  return Center(
    child: CategoryList(),
  );
}