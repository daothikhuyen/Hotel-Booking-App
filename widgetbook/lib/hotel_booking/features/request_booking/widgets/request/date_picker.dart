import 'package:flutter/material.dart';
import 'package:hotel_booking_app/features/request_booking/widgets/request/date_picker.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: DatePicker)
Widget buildDatePickerUseCase(BuildContext context) {
  return DatePicker();
}