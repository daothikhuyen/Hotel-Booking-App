import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerButton extends StatelessWidget {
  const CustomerButton({super.key, required this.textButton, required this.onPressed, required this.bold});

  final String textButton;
  final bool bold;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2853AF),
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        textButton,
        style: GoogleFonts.jost(
          fontSize: 18,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          color: Colors.white,
        ),
      ),
    );
  }
}
