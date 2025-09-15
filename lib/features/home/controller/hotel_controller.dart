import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/core/widgets/alter/snack_bar.dart';
import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/features/home/services/hotel_service.dart';

class HotelController extends ChangeNotifier {
  List<Hotel> listPopular = [];
  List<Hotel> listRecomended = [];
  List<Hotel> listBestToday = [];

  bool loading = false;
  String? error;

  final HotelService _service = HotelService();

  Future<void> fetchHotel(
    BuildContext context,
    Future<List<Hotel>> serviceMethod,
    Function(List<Hotel>) data,
  ) async {
    try {
      loading = true;
      notifyListeners();
      data(await serviceMethod);
    } on AppException catch (e) {
      HBSnackBar().showSnackBar(context, e.message);
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> fetchMostPopularHotels(BuildContext context) => fetchHotel(
    context,
    _service.fetchMostPopularHotels(context),
    (data) => listPopular = data,
  );

  Future<void> fetchRecomendedHotels(BuildContext context) => fetchHotel(
    context,
    _service.fetchRecomendedHotels(context),
    (data) => listRecomended = data,
  );

  Future<void> fetchBestToday(BuildContext context) => fetchHotel(
    context,
    _service.fetchBestToday(context),
    (data) => listBestToday = data,
  );

  void reset(){
    listPopular.clear();
    listRecomended.clear();
    listBestToday.clear();
    notifyListeners();
  }
}
