import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/features/home/services/hotel_service.dart';

class HotelController extends ChangeNotifier {
  List<Hotel> hotels = [];

  bool loading = false;
  String? error;

  final HotelService _service = HotelService();

  Future<List<Hotel>> fetchHotel(Future<List<Hotel>> serviceMethod) async {
    try {
      loading = true;
      notifyListeners();
      hotels = await serviceMethod;
    } on AppException catch (e) {
      debugPrint(e.message);
    } finally {
      loading = false;
      notifyListeners();
    }

    return hotels;
  }

  Future<List<Hotel>> fetchMostPopularHotels(BuildContext context) =>
      fetchHotel(_service.fetchMostPopularHotels(context));

  Future<List<Hotel>> fetchRecomendedHotels(BuildContext context) =>
      fetchHotel(_service.fetchRecomendedHotels(context));

  Future<List<Hotel>> fetchBestToday(BuildContext context) =>
      fetchHotel(_service.fetchBestToday(context));
}
