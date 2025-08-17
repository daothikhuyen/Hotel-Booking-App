import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';

class PrimaryBtn extends StatelessWidget {
  const PrimaryBtn({super.key, required this.textButton, required this.onPressed, required this.bold});

  final String textButton;
  final bool bold;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colorScheme.primary,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        textButton,
        // style: bold ? context.textTheme.labelSmall!.copyWith(color:  context.colorScheme.onSurface) : context.textTheme.bodyLarge!.copyWith(color:  context.colorScheme.onSurface),
        style: bold ? CustomTextStyles.bodyMediumMedium(context.colorScheme.onSurface) : CustomTextStyles.bodyMediumMedium(context.colorScheme.onSurface),
      ),
    );
  }
}
