import 'package:flutter/material.dart';
import 'package:hotel_booking_app/model/destination.dart';
import 'package:hotel_booking_app/screens/home/home_screen.dart';
import 'package:hotel_booking_app/screens/my_booking/my_booking_screen.dart';

class DestinationView extends StatelessWidget {
  final Destination destination;

  const DestinationView(this.destination, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: destination.id == 0
            ? HomeScreen()
            : destination.id  == 1
            ? MyBookingScreen()
            : HomeScreen()
      ),
    );
  }
}