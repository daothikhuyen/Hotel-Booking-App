import 'package:flutter/material.dart';
import 'package:hotel_booking_app/model/hotel.dart';
import 'package:hotel_booking_app/services/hotel_service.dart';

class HotelController extends ChangeNotifier {
  List<Hotel> hotels = [];

  bool loading = false;
  String? error;

  final HotelService _service = HotelService();

  Future<List<Hotel>> fetchMostPopularHotels()async {
    loading = true;
    error = null;
    notifyListeners();

    try {
      hotels = await _service.fetchMostPopularHotels();

    } catch (e) {
      error = e.toString();
    }

    loading = false;
    notifyListeners();

    return hotels;
  }
}