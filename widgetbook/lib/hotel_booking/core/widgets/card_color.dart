import 'package:flutter/material.dart';

class ColorCard extends StatelessWidget {
  const ColorCard({super.key, required this.color, required this.text});

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
