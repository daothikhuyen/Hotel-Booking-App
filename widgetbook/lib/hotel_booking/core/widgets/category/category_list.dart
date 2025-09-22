import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/widgets/category/category_list.dart';
import 'package:hotel_booking_app/data/data/category_data.dart';
import 'package:hotel_booking_app/data/model/category.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: CategoryList)
Widget buildCategoryListUseCase(BuildContext context) {
  return Center(
    child: CategoryList(
      listCategory: categoryData.map((e) => Category.fromJson(e, '123'),).toList(),
    ),
  );
}