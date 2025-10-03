import 'package:flutter/material.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/data/services/hotel_service.dart';
import 'package:hotel_booking_app/ui/core/exceptions/app_exception.dart';

class SearchHotelController extends ChangeNotifier {
  List<Hotel> listHotelSearch = [];

  final HotelService _service = HotelService();
  bool isFilter = false;
  static const int limit = 10;

  Future<void> searchHotel(BuildContext context, {required String text}) async {
    try {
      listHotelSearch = await _service.searchHotel(context, text, limit);
      notifyListeners();
    } on AppException catch (e) {
      throw AppException(type: e.type, message: e.message);
    }
  }

  Future<void> filterHotel(
    BuildContext context,
    String? location,
    double? price,
    int? bed,
    int? bathroom,
    int? rating,
  ) async {
    try {
      listHotelSearch = await _service.filterHotel(
        context,
        location ?? '',
        price ?? 0,
        bed ?? 0,
        bathroom ?? 0,
        rating ?? 0,
      );
      isFilter = true;
      notifyListeners();
    } on AppException catch (e) {
      throw AppException(type: e.type, message: e.message);
    }
  }
}
