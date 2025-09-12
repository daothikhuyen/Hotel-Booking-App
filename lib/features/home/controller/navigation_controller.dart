import 'package:flutter/widgets.dart';
import 'package:hotel_booking_app/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/core/widgets/alter/snack_bar.dart';
import 'package:hotel_booking_app/data/model/destination.dart';
import 'package:hotel_booking_app/features/home/services/navigation_service.dart';

class NavigationController with ChangeNotifier {
  List<Destination> listDestinations = [];

  bool loading = false;
  String? error;

  final NavigationService _service = NavigationService();

  Future<void> fetchNavigationBar(BuildContext context) async {
    try {
      loading = true;
      notifyListeners();
      listDestinations =  await _service.fetchDestination();
    } on AppException catch (e) {
      HBSnackBar().showSnackBar(context, e.message);
      throw AppException(message: e.message);
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
