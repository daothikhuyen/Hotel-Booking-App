import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/ui/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/ui/core/exceptions/error_type.dart';
import 'package:hotel_booking_app/ui/core/firestore_collections.dart';
import 'package:hotel_booking_app/ui/core/network/network_util.dart';

class MyBookingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  static const int limit = 3;

  User? get currentUser => auth.currentUser;
  DocumentSnapshot? _lastDoc;

  Future<List<Booking>> fetchMyBooking({
    required BuildContext context,
    required bool isHistory,
    bool isLoadMore = false,
  }) async {
    final now = Timestamp.now().millisecondsSinceEpoch;
    await NetworkUtil.hasNetwork(context);
    try {
      if (currentUser == null) return [];
      var query = _firestore
          .collection(FirestoreCollections.booking)
          .where('user.uid', isEqualTo: currentUser?.uid)
          .orderBy('checkOut', descending: false)
          .limit(limit);

      if (isHistory) {
        query = query.where('checkOut', isLessThan: now);
      } else {
        query = query.where('checkOut', isGreaterThan: now);
      }

      if (isLoadMore && _lastDoc != null) {
        query = query.startAfterDocument(_lastDoc!);
      }

      final snapshot = await query.get();

      if (snapshot.docs.isNotEmpty) {
        _lastDoc = snapshot.docs.last;
      }

      final booking =
          snapshot.docs.map((doc) {
            return Booking.fromJson(doc.data(), doc.id);
          }).toList();

      return booking;
    } on FirebaseException catch (e) {
      throw AppException(
        type: ErrorType.unknown,
        message: '${e.message}',
      );
    }
  }

  Future<List<Booking>> searchBooked({
    required BuildContext context,
    required String text,
    required bool isHistory,
  }) async {
    final now = Timestamp.now().millisecondsSinceEpoch;
    await NetworkUtil.hasNetwork(context);
    try {
      if (currentUser == null) return [];

      var query = _firestore
          .collection(FirestoreCollections.booking)
          .where('user.uid', isEqualTo: currentUser?.uid);
         
      if (isHistory) {
        query = query.where('checkOut', isLessThan: now);
      } else {
        query = query.where('checkOut', isGreaterThan: now);
      }

      final snapshot =
          await query.orderBy('hotel.name').startAt([text]).endAt([
            '$text\uf8ff',
          ]).get();

      final booking =
          snapshot.docs.map((doc) {
            return Booking.fromJson(doc.data(), doc.id);
          }).toList();

      return booking;
    } on FirebaseException catch (e) {
      throw AppException(
        type: ErrorType.unknown,
        message: '${e.message}',
      );
    }
  }

  void reset() {
    _lastDoc = null;
  }
}
