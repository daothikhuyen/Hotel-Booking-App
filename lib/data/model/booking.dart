import 'dart:convert';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/data/model/user.dart';

class Booking {
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

  Map<String, dynamic> toJson() {
    return {
      'hotel': hotel.toJson(),
      'user': user.toJson(),
      'checkIn': checkIn.millisecondsSinceEpoch,
      'checkOut': checkOut.millisecondsSinceEpoch,
      'guests': guests,
      'nightlyRate': nightlyRate,
      'cleaningFee': cleaningFee,
      'serviceFee': serviceFee,
      'totalPrice': totalPrice,
    };
  }

  factory Booking.fromJson(Map<String, dynamic> map) {
    final hotelMap = map['hotel'] as Map<String, dynamic>;
    final userMap = map['user'] as Map<String, dynamic>;

    return Booking(
      uid: map['uid'] as String,
      checkIn: DateTime.fromMillisecondsSinceEpoch(map['checkIn'] as int),
      checkOut: DateTime.fromMillisecondsSinceEpoch(map['checkOut'] as int),
      guests: map['guests'] as int,
      nightlyRate: map['price'] as double,
      cleaningFee: map['cleaningFee'] as double,
      serviceFee: map['serviceFee'] as double,
      totalPrice: map['totalPrice'] as double,
      hotel: Hotel.fromJson(hotelMap, hotelMap['id']),
      user: HBUser.fromJson(userMap),
    );
  }

}
