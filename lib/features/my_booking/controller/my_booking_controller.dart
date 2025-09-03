import 'package:flutter/widgets.dart';
import 'package:hotel_booking_app/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/features/my_booking/services/my_booking_service.dart';

class MyBookingController with ChangeNotifier{

  bool isLoading = false;
  bool hasMore = true;
  List<Booking> listBooking = [];

  final MyBookingService _service = MyBookingService();

  Future<void> fetchMyBooking({bool loadMore = false}) async{
    try {
      if(isLoading) return;

      isLoading = true;
      notifyListeners();
      final newBookings = await _service.fetchMyBooking(isLoadMore: loadMore);

      debugPrint('newBooking $newBookings');

      if(newBookings.length < MyBookingService.limit){
        hasMore = false;
      }

      if(isLoading){
        listBooking.addAll(newBookings);
      }else{
        listBooking = newBookings;
      }

      isLoading = false;
      notifyListeners();
    } on AppException catch (e) {
       debugPrint('newBooking finishes');
      throw AppException(code: e.hashCode, message: 'Error ${ e.message}');
    }
  }

  void reset(){
    listBooking.clear();
    isLoading = false;
    hasMore = true;
    _service.reset();
    notifyListeners();
  }

  
}
