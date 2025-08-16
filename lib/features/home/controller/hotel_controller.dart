import 'package:flutter/material.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/features/home/service/hotel_service.dart';

class HotelController extends ChangeNotifier {
  List<Hotel> hotels = [];

  bool loading = false;
  String? error;

  final HotelService _service = HotelService();

  Future<List<Hotel>> fetchHotel(Future<List<Hotel>> serviceMethod) async {
    loading = true;
    error = null;
    notifyListeners();

    try {
      hotels = await serviceMethod;
    } catch (e) {
      error = e.toString();
    }

    loading = false;
    notifyListeners();

    return hotels;
  }

  Future<List<Hotel>> fetchMostPopularHotels() => fetchHotel(_service.fetchMostPopularHotels());

  Future<List<Hotel>> fetchRecomendedHotels() => fetchHotel(_service.fetchRecomendedHotels());

  Future<List<Hotel>> fetchBestToday() => fetchHotel(_service.fetchBestToday());
}
