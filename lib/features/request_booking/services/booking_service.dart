import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_booking_app/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/core/firestore_collections.dart';
import 'package:hotel_booking_app/data/model/booking.dart';

class BookingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Booking> myBooking = [];

  Future<void> saveBooking(Booking booking) async {
    try {
      final bookingCollection = _firestore.collection(
        FirestoreCollections.booking,
      );
      await bookingCollection.add(booking.toJson());
      return;
    } on AppException catch (e) {
      throw AppException(message: 'Error save booking $e');
    }
  }
}
