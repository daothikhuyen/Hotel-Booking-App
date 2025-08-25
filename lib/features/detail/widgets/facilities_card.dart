import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';

class FacilitiesCard extends StatelessWidget {
  const FacilitiesCard({required this.icon, required this.title, super.key});

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 56,
          height: 56,
          child: CircleAvatar(
            radius: 24,
            backgroundColor: context.colorScheme.secondary,
            child: SvgPicture.asset(icon),
          ),
        ),
        Text(
          title,
          style: context.textTheme.bodySmall!.copyWith(
            color: context.colorScheme.tertiary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
