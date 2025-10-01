import 'package:flutter/material.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';

class ColorCard extends StatelessWidget {
  const ColorCard({super.key, required this.color, required this.text});

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.spacing.sm),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 50,
            color: color,
          ),
          Text(text),
        ],
      ),
    );
  }
}
