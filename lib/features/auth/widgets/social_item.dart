import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialItem extends StatelessWidget {
  const SocialItem({super.key, required this.linkIcon, required this.onPressed});

  final String linkIcon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 72.0,
        height: 48.0,
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFF6F6F6),
        ),
        child: SvgPicture.asset(linkIcon, fit: BoxFit.contain),
      ),
    );
  }
}
