import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/core/routes/page_routes.dart';
import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/features/my_booking/controller/my_booking_controller.dart';
import 'package:hotel_booking_app/features/request_booking/services/booking_service.dart';

class BookingController extends ChangeNotifier{
  final user = FirebaseAuth.instance.currentUser;
  final BookingService _service = BookingService();
  final myBooking = MyBookingController();

  Future createBooking(BuildContext context, Booking booking) async {
    try {
      if (user != null) {
        await _service.saveBooking(booking);
        await myBooking.fetchMyBooking(table: 'booked', loadMore: true);
        await context.push(PageRoutes.bookingSucess);
      }
    } on AppException catch (e) {
      throw AppException(message: e.message);
    }
  }
}
