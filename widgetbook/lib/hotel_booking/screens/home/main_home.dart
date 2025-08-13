import 'package:flutter/material.dart';
import 'package:hotel_booking_app/screens/home/main_home_screen.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: MainHomeScreen)
Widget buildMainHomeUseCase(BuildContext context) {
  return Center(child: MainHomeScreen());
}
  