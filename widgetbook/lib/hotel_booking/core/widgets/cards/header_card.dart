import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/build_divider.dart';
import 'package:hotel_booking_app/core/widgets/cards/header_card.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: HeaderCard)
Widget buildHeaderBarUseCase(BuildContext context) {
  return Center(
    child: HeaderCard(
      title: context.knobs.string(
        label: 'Title',
        initialValue: 'Recommended For you',
      ),
      onPressed: () {
        
      },
      titleBtn: context.knobs.string(
        label: 'Title Button',
        initialValue: 'All See',
      ),
    ),
  );
}
