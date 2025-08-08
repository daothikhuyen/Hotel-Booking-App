import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.linkIcon, required this.onPressed});

  final String linkIcon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 72.0,
        height: 48.0,
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFFF6F6F6),
        ),
        child: SvgPicture.asset(linkIcon, fit: BoxFit.contain),
      ),
    );
  }
}
