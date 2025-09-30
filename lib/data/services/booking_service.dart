import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/ui/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/ui/core/exceptions/error_type.dart';
import 'package:hotel_booking_app/ui/core/firestore_collections.dart';
import 'package:hotel_booking_app/ui/core/network/network_util.dart';

class BookingService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Booking> myBooking = [];

  Future<void> saveBooking(BuildContext context, Booking booking) async {
    await NetworkUtil.hasNetwork(context);
    try {
      final bookingCollection = _firestore.collection(
        FirestoreCollections.booking,
      );
      await bookingCollection.add(booking.toJson());
      return;
    } on FirebaseException catch (e) {
     throw AppException(
        type: ErrorType.unknown,
        message: '${e.message}',
      );
    }
  }
}
