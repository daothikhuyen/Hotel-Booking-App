import 'package:flutter/material.dart';
import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/data/model/user.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/ui/features/request_booking/widgets/checkout/info_hotel_booking.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: InfoHotelBooking)
Widget buildInfoHotelUseCase(BuildContext context) {
  return InfoHotelBooking(
    booking: Booking(
      uid: '1111',
      hotel: Hotel(
        id: '123',
        image: Assets.images.home.frameOne.path,
        name: 'Lu San Hi',
        location: 'Hello',
        roomType: 'Double',
        categoryId: 'Zk2IvTj6oXRPto2qaUgM',
        discount: false
      ),
      user: HBUser(uid: '1234', email: 'daothikhuyen30@gmail.com'),
      checkIn: DateTime(2024, 6, 20),
      checkOut: DateTime(2024, 6, 25),
      guests: 2,
      nightlyRate: 450.0,
      cleaningFee: 50.0,
      serviceFee: 20.0,
      totalPrice: 2470.0,
    ),
  );
}
