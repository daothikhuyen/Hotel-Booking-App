import 'package:flutter/material.dart';
import 'package:hotel_booking_app/features/home/home_screen.dart';
import 'package:hotel_booking_app/features/my_booking/my_booking_screen.dart';

class DestinationView extends StatelessWidget {
  final int selectedIndex;

  const DestinationView(this.selectedIndex, {super.key} );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        alignment: Alignment.center,
        child: selectedIndex == 0
            ? const HomeScreen()
            : selectedIndex  == 1
            ? const MyBookingScreen()
            : const HomeScreen(),
      ),
    );
  }
}