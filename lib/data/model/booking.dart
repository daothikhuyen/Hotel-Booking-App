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

  factory Booking.fromJson(Map<String, dynamic> josn, String  uid) {
    final hotelJson = josn['hotel'] as Map<String, dynamic>;
    final userJson= josn['user'] as Map<String, dynamic>;
    
    double? parseDouble(dynamic value) {
      if (value == null) return null;
      if (value is double) return value;
      if (value is int) return value.toDouble();
      if (value is String) return double.tryParse(value);
      return null;
    }

    return Booking(
      uid: uid,
      checkIn: DateTime.fromMillisecondsSinceEpoch(josn['checkIn'] as int),
      checkOut: DateTime.fromMillisecondsSinceEpoch(josn['checkOut'] as int),
      guests: (josn['guests'] as int?) ?? 0,
      nightlyRate:parseDouble(josn['price']) ?? 0,
      cleaningFee:parseDouble(josn['cleaningFee']) ?? 0,
      serviceFee: parseDouble(josn['serviceFee']) ?? 0,
      totalPrice: parseDouble(josn['totalPrice']) ?? 0,
      hotel: Hotel.fromJson(hotelJson, hotelJson['id']),
      user: HBUser.fromJson(userJson),
    );
  }
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

}
