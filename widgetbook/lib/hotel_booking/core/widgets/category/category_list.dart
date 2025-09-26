import 'package:flutter/material.dart';
import 'package:hotel_booking_app/data/model/category.dart';
import 'package:hotel_booking_app/ui/core/widgets/category/category_list.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_hotel_booking_app/hotel_booking/data_fake/category_data.dart';

@widgetbook.UseCase(name: 'Default', type: CategoryList)
Widget buildCategoryListUseCase(BuildContext context) {
  return Center(
    child: CategoryList(
      listCategory: categoryData.map((e) => Category.fromJson(e, '123'),).toList(),
    ),
  );
}