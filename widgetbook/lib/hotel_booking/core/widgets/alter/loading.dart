import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: CircularProgressIndicator)
Widget buildLoadingUseCase(BuildContext context) {
  return Center(
    child: CircularProgressIndicator(),
  );
}