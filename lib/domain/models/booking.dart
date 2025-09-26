import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/data/model/user.dart';

class Booking {
  Booking({
    required this.uid,
    required this.hotel,
    required this.user,
    required this.checkIn,
    required this.checkOut,
    required this.guests,
    required this.nightlyRate,
    required this.cleaningFee,
    required this.serviceFee,
    required this.totalPrice,
  });

  String uid;
  Hotel hotel;
  HBUser user;
  DateTime checkIn;
  DateTime checkOut;
  int guests;
  double nightlyRate;
  double cleaningFee;
  double serviceFee;
  double totalPrice;
}
