import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_booking_app/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/core/firestore_collections.dart';
import 'package:hotel_booking_app/data/model/booking.dart';

class MyBookingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Booking> myBooking = [];

  Future<List<Booking>> fetchMyBooking() async {
    try {
      final snapshot =
          await _firestore.collection(FirestoreCollections.booking).get();

      return snapshot.docs.map((doc) {
        return Booking.fromJson(doc.data());
      }).toList();
    } on FirebaseException catch (e) {
      throw AppException(message: 'fetchBooking ${e.message}');
    }
  }
}
