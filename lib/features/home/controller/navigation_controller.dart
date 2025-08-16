import 'package:flutter/widgets.dart';
import 'package:hotel_booking_app/data/model/destination.dart';
import 'package:hotel_booking_app/features/home/service/navigation_service.dart';

class NavigationController with ChangeNotifier{
    List<Destination> destinations = [];

  bool loading = false;
  String? error;

  final NavigationService _service = NavigationService();

  Future<List<Destination>> fetchNavigationBar() async {
    loading = true;
    error = null;
    notifyListeners();

    try {
      destinations = await _service.fetchDestination();
    } catch (e) {
      error = e.toString();
    }

    loading = false;
    notifyListeners();

    return destinations;
  }
  
}