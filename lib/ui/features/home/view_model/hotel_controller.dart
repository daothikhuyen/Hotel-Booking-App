import 'package:flutter/material.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/data/services/hotel_service.dart';
import 'package:hotel_booking_app/ui/core/exceptions/app_exception.dart';

class HotelController extends ChangeNotifier {
  List<Hotel> listAll = [];
  List<Hotel> listPopular = [];
  List<Hotel> listRecomended = [];
  List<Hotel> listBestToday = [];
  List<Hotel> listHotelSearch = [];

  bool isLoading = false;
  bool hasMore = true;
  static const int limit = 10;
  String? error;

  final HotelService _service = HotelService();

  Future fetchHotel(
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
      throw AppException(type: e.type, message: e.message);
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
        if (data.length < limit) {hasMore = false},
        if (isLoading) {listAll.addAll(data)} else {listAll = data},
      },
      loadMore: loadMore,
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
    String categoryId = '',
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

  Future<void> fetchHotelByCategory(
    BuildContext context,
    String categoryId, {
    int limit = limit,
  }) async {
    try {
      listRecomended = await _service.fetchHotelByCategory(
        context,
        categoryId,
        limit,
      );
      notifyListeners();
    } on AppException catch (e) {
      throw AppException(type: e.type, message: e.message);
    }
  }

  void reset(int index) {
    switch (index) {
      case 0:
        listAll.clear();
      case 1:
        listPopular.clear();
      case 2:
        listRecomended.clear();
      case 3:
        listBestToday.clear();
      default:
        listPopular.clear();
        listRecomended.clear();
        listBestToday.clear();
    }
    notifyListeners();
  }
}
