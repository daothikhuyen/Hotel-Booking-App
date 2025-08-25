import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/widgets/buttons/primary_btn.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: PrimaryBtn)
Widget buildPrimaryBtnUseCase(BuildContext context) {
  return Center(child: PrimaryBtn(
    size:  double.parse(
        context.knobs.double
            .slider(label: 'Size', initialValue: 450.0, min: 0, max: 1000.0)
            .toStringAsFixed(1),
      ),
    textButton: context.knobs.string(
      label: 'Button Text',
      initialValue: 'Book Now',
    ),
    onPressed: () {
      // Define the action for the button press
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Button Pressed')),
      );
    },
    bold: context.knobs.boolean(label: 'Bold', initialValue: true)
  ));
}
