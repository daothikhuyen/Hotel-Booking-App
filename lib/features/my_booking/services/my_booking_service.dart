import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/core/firestore_collections.dart';
import 'package:hotel_booking_app/data/model/booking.dart';

class MyBookingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? get currentUser => auth.currentUser;

  List<Booking> myBooking = [];

  Future<List<Booking>> fetchMyBooking() async {
    try {
      final snapshot =
          await _firestore.collection(FirestoreCollections.booking).where(
            'user.uid', isEqualTo: currentUser?.uid,
          ).get();

      final booking = snapshot.docs.map((doc) {
        return Booking.fromJson(doc.data(),doc.id);
      }).toList();
      return booking;
    } on FirebaseException catch (e) {
      throw AppException(message: 'fetchBooking ${e.message}');
    }
  }
}
