import 'package:flutter/widgets.dart';
import 'package:hotel_booking_app/data/model/category.dart';
import 'package:hotel_booking_app/data/model/destination.dart';
import 'package:hotel_booking_app/data/services/navigation_service.dart';
import 'package:hotel_booking_app/ui/core/exceptions/app_exception.dart';

class NavigationController with ChangeNotifier {
  List<Destination> listDestinations = [];
  List<Category> listCategory = [];

  bool loading = false;

  final NavigationService _service = NavigationService();

  Future<void> fetchNavigationBar(BuildContext context) async {
    try {
      loading = true;
      notifyListeners();
      listDestinations = await _service.fetchDestination(context);
    } on AppException catch (e) {
      throw AppException(type: e.type,message: e.message);
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> fetchCategory(BuildContext context) async {
    try {
      loading = true;
      notifyListeners();
      listCategory = await _service.fetchCategory(context);
    } on AppException catch (e) {
      throw AppException(type: e.type,message: e.message);
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  void reset() {
    listCategory.clear();
    loading = false;
    notifyListeners();
  }
}
