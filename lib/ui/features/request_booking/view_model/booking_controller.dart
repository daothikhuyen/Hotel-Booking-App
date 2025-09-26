import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/data/repositories/api_response.dart';
import 'package:hotel_booking_app/data/repositories/api_status.dart';
import 'package:hotel_booking_app/data/services/booking_service.dart';
import 'package:hotel_booking_app/ui/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';

class BookingController extends ChangeNotifier {
  final user = FirebaseAuth.instance.currentUser;
  final _service = BookingService();

  Future<ApiResponse> createBooking(
    BuildContext context,
    Booking booking,
  ) async {
    try {
      if (user == null) {
        return ApiResponse(
          ApiStatus.error,
          message: context.l10n.userNotExisted,
        );
      }
      await _service.saveBooking(booking);

      return ApiResponse(ApiStatus.success);
    } on AppException catch (e) {
      return ApiResponse(ApiStatus.error, message: e.message);
    }
  }
}
