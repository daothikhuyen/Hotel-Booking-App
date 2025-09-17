import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/core/widgets/alter/snack_bar.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/features/home/services/hotel_service.dart';

class HotelController extends ChangeNotifier {
  List<Hotel> listAll = [];
  List<Hotel> listPopular = [];
  List<Hotel> listRecomended = [];
  List<Hotel> listBestToday = [];

  bool isLoading = false;
  bool hasMore = true;
  static const int limit = 10;
  String? error;

  final HotelService _service = HotelService();

  Future<void> fetchHotel(
    BuildContext context,
    Future<List<Hotel>> serviceMethod,
    Function(List<Hotel>) data, {
    bool loadMore = false,
  }) async {
    try {
      if (isLoading) return;

      if (loadMore) {
        isLoading = true;
        notifyListeners();
      }

      data(await serviceMethod);
    } on AppException catch (e) {
      HBSnackBar().showSnackBar(context, e.message);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchAll(BuildContext context, {bool loadMore = false}) {
    return fetchHotel(
      context,
      _service.fetchAll(context, loadMore: loadMore, limit: limit),
      (data) => {
        listAll = data,
        if (data.length < limit) {hasMore = false},
        notifyListeners(),
      },
    );
  }

  Future<void> fetchMostPopularHotels(
    BuildContext context, {
    bool loadMore = false,
    int limit = limit,
  }) {
    return fetchHotel(
      context,
      _service.fetchMostPopularHotels(
        context,
        loadMore: loadMore,
        limit: limit,
      ),
      (data) => {
        listPopular = data,
        if (data.length < limit) {hasMore = false},
        notifyListeners(),
      },
    );
  }

  Future<void> fetchRecomendedHotels(
    BuildContext context, {
    int limit = limit,
    bool loadMore = false,
  }) => fetchHotel(
    context,
    _service.fetchRecomendedHotels(context, limit: limit, loadMore: loadMore),
    (data) => listRecomended = data,
  );

  Future<void> fetchBestToday(
    BuildContext context, {
    int limit = limit,
    bool loadMore = false,
  }) => fetchHotel(
    context,
    _service.fetchBestToday(context, limit: limit, loadMore: loadMore),
    (data) => listBestToday = data,
  );

  void reset() {
    listPopular.clear();
    listRecomended.clear();
    listBestToday.clear();
    notifyListeners();
  }

  Future<List<Hotel>> searchHotel(
    BuildContext context, {
    required String text,
  }) {
    try {
      return _service.searchHotel(text, limit);
    } on AppException catch (e) {
      HBSnackBar().showSnackBar(context, e.message);
      throw AppException(message: e.message);
    }
  }
}
