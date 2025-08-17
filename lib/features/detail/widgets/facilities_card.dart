import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';

class FacilitiesCard extends StatelessWidget {
  const FacilitiesCard({super.key});

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
            child: SvgPicture.asset(
              Assets.images.icon.a3dRotate,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Text(
          'AC',
          style: context.textTheme.bodySmall!.copyWith(
            color: context.colorScheme.tertiary,
          ),
        ),
      ],
    );
  }
}
