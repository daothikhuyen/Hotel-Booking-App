import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemCounter extends StatelessWidget {
  const ItemCounter({
    required this.icon,
    required this.color,
    required this.background,
    required this.size,
    required this.onPressed,
    super.key,
  });

  final String icon;
  final Color color;
  final Color background;
  final double size;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: size,
        height: size,
        child: CircleAvatar(
          radius: 30,
          backgroundColor: background,
          child: SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
