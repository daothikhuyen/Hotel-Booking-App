import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/themes/theme.dart';

class TitleWithBtn extends StatelessWidget {
  const TitleWithBtn({super.key, required this.title, required this.onPressed, required this.titleBtn});

  final String title;
  final String titleBtn;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            titleBtn,
            style: GoogleFonts.plusJakartaSans(
              textStyle: CustomerTextStyles.smallBoldTextStyle(
                Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
