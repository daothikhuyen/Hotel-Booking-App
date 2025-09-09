import 'package:flutter/material.dart';
import 'package:hotel_booking_app/features/profile/widgets/setting_section.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: SettingSection)
Widget buildSettingSectionUseCase(BuildContext context) {
  return SettingSection();
}
