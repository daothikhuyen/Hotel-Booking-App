import 'package:flutter/widgets.dart';
import 'package:hotel_booking_app/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/features/my_booking/services/my_booking_service.dart';

class MyBookingController with ChangeNotifier {
  bool isLoading = false;
  bool hasMore = true;
  bool isEmpty = true;
  List<Booking> listBooking = [];
  List<Booking> listHistory = [];

  final MyBookingService _service = MyBookingService();

  Future<void> fetchMyBooking({
    required String table,
    bool loadMore = false,
  }) async {
    try {
      final List<Booking> newBookings;
      if (isLoading) return;

      if (loadMore) {
        isLoading = true;
        notifyListeners();
      }

      if (table == 'booked') {
        newBookings = await _service.fetchMyBooking(
          isLoadMore: loadMore,
          isHistory: false,
        );
      } else {
        newBookings = await _service.fetchMyBooking(
          isLoadMore: loadMore,
          isHistory: true,
        );
      }

      if (newBookings.length < MyBookingService.limit) {
        hasMore = false;
      }

      if(table == 'booked'){
        updateList(listBooking, newBookings);
      }else{
        updateList(listHistory, newBookings);
      }

      isLoading = false;
      notifyListeners();
    } on AppException catch (e) {
      throw AppException(code: e.hashCode, message: 'Error ${e.message}');
    }
  }

  Future<List<Booking>> searchBooked({
    required String text,
    required bool isHistory,
  }) async {
    try {
      hasMore = false;
      notifyListeners();
      if (text.isEmpty) {
        await fetchMyBooking(table: isHistory ? 'history' : 'booked');
      } else {
        final booked = await _service.searchBooked(
          text: text,
          isHistory: isHistory,
        );
        if(isHistory){
          listHistory = booked;
        }else{
          listBooking = booked;
        }
        notifyListeners();
        return booked;
      }
      return [];
    } on AppException catch (e) {
      throw AppException(
        code: e.hashCode,
        message: 'Error search booked ${e.message}',
      );
    }
  }

  void updateList(List<Booking> nameList, List<Booking> newBookings) {
    if (isLoading) {
      nameList.addAll(newBookings);
    } else {
      nameList
        ..clear()
        ..addAll(newBookings);
    }
  }

  void loading({required bool value}) {
    isEmpty = value;
    notifyListeners();
  }

  void reset(List<Booking> nameList) {
    nameList.clear();
    isLoading = false;
    hasMore = true;
    _service.reset();
    notifyListeners();
  }
}
