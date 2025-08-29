import 'package:hotel_booking_app/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/features/my_booking/services/my_booking_service.dart';

class MyBookingController{
  List<Booking> myBooking = [];

  bool loading = false;

  final MyBookingService _service = MyBookingService();

  Future<List<Booking>> fetchMyBooking() async{
    try {
      return await _service.fetchMyBooking();
    } on AppException catch (e) {
      throw AppException(message: e.message);
    }
  }

  
}
