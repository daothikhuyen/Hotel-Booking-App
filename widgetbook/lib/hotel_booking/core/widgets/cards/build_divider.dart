import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/build_divider.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: BuildDivider)
Widget buildBuildDividerUseCase(BuildContext context) {
  return Center(
    child: BuildDivider(),
  );
}
