import 'package:flutter/material.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/skeleton.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: Skeleton)
Widget buildSkeletonUseCase(BuildContext context) {
  return Center(
    child: Skeleton(
      width: context.knobs.double.input(label: 'Width', initialValue: 10),
      height: context.knobs.double.input(label: 'Hight', initialValue: 10),
    ),
  );
}
