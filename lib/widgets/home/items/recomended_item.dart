import 'package:flutter/material.dart';
import 'package:hotel_booking_app/themes/theme.dart';

class RecomendedItem extends StatelessWidget {
  const RecomendedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(   
        children: [
          Container(
            width: 78,
            height: 78,
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/home/FrameOne.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Text('Serenity Sands', style: CustomerTextStyles.avBoldTextStyle(Theme.of(context).colorScheme.onSurface),)
            ],
          )
        ],
      );
  }
}