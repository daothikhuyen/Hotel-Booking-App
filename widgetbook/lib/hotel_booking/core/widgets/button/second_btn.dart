import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/widgets/buttons/second_btn.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: SecondBtn)
Widget buildSecondBtnUseCase(BuildContext context) {
  return Center(child: SecondBtn(
    size:  double.parse(
        context.knobs.double
            .slider(label: 'Size', initialValue: 450.0, min: 0, max: 1000.0)
            .toStringAsFixed(1),
      ),
    titleBtn: context.knobs.string(
      label: 'Button Text',
      initialValue: 'Book Now',
    ),
    onPressed: () {
      // Define the action for the button press
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Button Pressed')),
      );
    },
    color: context.knobs.color(label: 'color', initialValue: Colors.red), 
  ));
}
