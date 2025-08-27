import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/widgets/cards/build_divider.dart';
import 'package:hotel_booking_app/data/data/hotel_data.dart';
import 'package:hotel_booking_app/features/my_booking/widgets/booking_card.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';

class Booked extends StatefulWidget {
  const Booked({super.key});

  @override
  State<Booked> createState() => _BookedState();
}

class _BookedState extends State<Booked> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: const BookingCard(
            linkImage: '',
            name: 'Most Popular Hotel',
            location: 'Los Angless, Los',
            currentPrice: 340.123,
            ratting: '4.5',
            dateTime: '12-14 Nov 2024',
            guest: 2,
            numberRoom: 1,
          ),
        );
      },
    );
  }
}
