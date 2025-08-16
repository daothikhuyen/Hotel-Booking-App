import 'package:flutter/material.dart';
import 'package:hotel_booking_app/features/home/widgets/header_bar.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: HeaderBar)
Widget buildHeaderBarUseCase(BuildContext context) {
  return Center(
    child: HeaderBar(
      linkImage: context.knobs.string(
        label: 'Link Image',
        initialValue: 'assets/images/avatar/Ellipse.png',
      ),
      userName: context.knobs.string(
        label: 'User Name',
        initialValue: 'John Doe',
      ),
      address: context.knobs.string(
        label: 'Address',
        initialValue: '123 Main St, Springfield',
      ),
    ),
  );
}
