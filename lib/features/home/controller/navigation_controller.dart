import 'package:flutter/widgets.dart';
import 'package:hotel_booking_app/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/data/model/destination.dart';
import 'package:hotel_booking_app/features/home/services/navigation_service.dart';

class NavigationController with ChangeNotifier {
  List<Destination> destinations = [];

  bool loading = false;
  String? error;

  final NavigationService _service = NavigationService();

  Future<List<Destination>> fetchNavigationBar() async {
    try {
      loading = true;
      notifyListeners();
      return await _service.fetchDestination();
    } on AppException catch (e) {
      throw AppException(message: e.message);
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
