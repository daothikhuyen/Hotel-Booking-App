import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/core/widgets/alter/snack_bar.dart';
import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/features/request_booking/services/booking_service.dart';

class BookingController extends ChangeNotifier{
  final user = FirebaseAuth.instance.currentUser;
  final BookingService _service = BookingService();

  Future createBooking(BuildContext context, Booking booking) async {
    try {
      if (user != null) {
        await _service.saveBooking(booking);
      }
    } on AppException catch (e) {
      HBSnackBar().showSnackBar(context, e.message);
    }
  }
}
