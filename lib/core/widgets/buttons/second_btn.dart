import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';

class SecondBtn extends StatelessWidget {
  const SecondBtn({required this.titleBtn, super.key});

  final String titleBtn;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: context.colorScheme.primary),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          titleBtn,
          style: HBTextStyles.bodySemiboldSmall(context.colorScheme.primary),
        ),
      ),
    );
  }
}
